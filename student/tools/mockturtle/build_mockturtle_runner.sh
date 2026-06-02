#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src_dir="${MOCKTURTLE_SRC:-${script_dir}/src}"
build_dir="${MOCKTURTLE_BUILD:-${script_dir}/build}"
out_dir="${MOCKTURTLE_BIN_DIR:-${script_dir}/bin}"
source_file="${script_dir}/mockturtle_aig_runner.cpp"
output_file="${out_dir}/mockturtle_aig_runner"
cxx="${CXX:-c++}"

if [[ ! -d "${src_dir}" ]]; then
  echo "missing mockturtle source directory: ${src_dir}" >&2
  exit 1
fi

if [[ ! -f "${build_dir}/lib/abcsat/liblibabcsat.a" || ! -f "${build_dir}/lib/abcesop/liblibabcesop.a" ]]; then
  echo "missing mockturtle static libraries under ${build_dir}; build mockturtle first" >&2
  exit 1
fi

mkdir -p "${out_dir}"

"${cxx}" \
  -std=gnu++17 -O3 -DNDEBUG -pthread \
  -DABC_NAMESPACE=pabc -DABC_NO_USE_READLINE -DDISABLE_NAUTY -DFMT_HEADER_ONLY -DLIN64 \
  -I"${src_dir}/lib/abcsat" \
  -I"${src_dir}/lib/abcesop" \
  -isystem "${src_dir}/include" \
  -isystem "${src_dir}/lib/kitty" \
  -isystem "${src_dir}/lib/lorina" \
  -isystem "${src_dir}/lib/rang" \
  -isystem "${src_dir}/lib/fmt" \
  -isystem "${src_dir}/lib/parallel_hashmap" \
  -isystem "${src_dir}/lib/percy" \
  -isystem "${src_dir}/lib/json" \
  -isystem "${src_dir}/lib/bill" \
  "${source_file}" \
  "${build_dir}/lib/abcsat/liblibabcsat.a" \
  "${build_dir}/lib/abcesop/liblibabcesop.a" \
  -lstdc++fs \
  -o "${output_file}"

echo "${output_file}"
