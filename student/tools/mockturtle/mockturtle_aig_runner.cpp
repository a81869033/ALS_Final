#include <algorithm>
#include <chrono>
#include <cstdint>
#include <filesystem>
#include <iostream>
#include <limits>
#include <string>

#include <lorina/aiger.hpp>
#include <mockturtle/algorithms/aig_balancing.hpp>
#include <mockturtle/algorithms/aig_resub.hpp>
#include <mockturtle/algorithms/cleanup.hpp>
#include <mockturtle/algorithms/cut_rewriting.hpp>
#include <mockturtle/algorithms/node_resynthesis/sop_factoring.hpp>
#include <mockturtle/algorithms/node_resynthesis/xag_npn.hpp>
#include <mockturtle/algorithms/refactoring.hpp>
#include <mockturtle/algorithms/resubstitution.hpp>
#include <mockturtle/algorithms/sim_resub.hpp>
#include <mockturtle/algorithms/window_rewriting.hpp>
#include <mockturtle/io/aiger_reader.hpp>
#include <mockturtle/io/write_aiger.hpp>
#include <mockturtle/networks/aig.hpp>
#include <mockturtle/views/depth_view.hpp>

namespace
{

struct options
{
  std::string input;
  std::string output;
  std::string flow{ "resub_balance" };
  uint32_t max_pis{ 8u };
  uint32_t max_inserts{ 2u };
  bool quiet{ false };
};

void print_usage( char const* argv0 )
{
  std::cerr << "usage: " << argv0
            << " --input in.aig --output out.aig"
            << " [--flow crw|wrw|rf|resub|resub2|balance|resub_balance|balance_resub|cut_rewrite|refactor|sim_resub|window_rewrite|cut_refactor|window_resub_balance]"
            << " [--max-pis N] [--max-inserts N] [--quiet]\n";
}

bool parse_uint32( char const* text, uint32_t& value )
{
  try
  {
    size_t pos = 0u;
    auto const parsed = std::stoul( text, &pos, 10 );
    if ( pos != std::string( text ).size() )
      return false;
    value = static_cast<uint32_t>( parsed );
    return true;
  }
  catch ( ... )
  {
    return false;
  }
}

bool parse_args( int argc, char* argv[], options& opts )
{
  if ( argc == 4 && argv[1][0] != '-' )
  {
    opts.input = argv[1];
    opts.output = argv[2];
    opts.flow = argv[3];
    return true;
  }
  if ( argc == 3 && argv[1][0] != '-' )
  {
    opts.input = argv[1];
    opts.output = argv[2];
    return true;
  }

  for ( int i = 1; i < argc; ++i )
  {
    std::string const arg = argv[i];
    auto require_value = [&]( std::string const& name ) -> char const* {
      if ( i + 1 >= argc )
      {
        std::cerr << "missing value for " << name << "\n";
        return nullptr;
      }
      return argv[++i];
    };

    if ( arg == "--input" )
    {
      auto const value = require_value( arg );
      if ( value == nullptr )
        return false;
      opts.input = value;
    }
    else if ( arg == "--output" )
    {
      auto const value = require_value( arg );
      if ( value == nullptr )
        return false;
      opts.output = value;
    }
    else if ( arg == "--flow" )
    {
      auto const value = require_value( arg );
      if ( value == nullptr )
        return false;
      opts.flow = value;
    }
    else if ( arg == "--max-pis" )
    {
      auto const value = require_value( arg );
      if ( value == nullptr || !parse_uint32( value, opts.max_pis ) )
      {
        std::cerr << "invalid --max-pis value\n";
        return false;
      }
    }
    else if ( arg == "--max-inserts" )
    {
      auto const value = require_value( arg );
      if ( value == nullptr || !parse_uint32( value, opts.max_inserts ) )
      {
        std::cerr << "invalid --max-inserts value\n";
        return false;
      }
    }
    else if ( arg == "--quiet" )
    {
      opts.quiet = true;
    }
    else if ( arg == "--help" || arg == "-h" )
    {
      print_usage( argv[0] );
      std::exit( 0 );
    }
    else
    {
      std::cerr << "unknown argument: " << arg << "\n";
      return false;
    }
  }

  return !opts.input.empty() && !opts.output.empty();
}

void run_resubstitution( mockturtle::aig_network& aig, options const& opts )
{
  mockturtle::resubstitution_params ps;
  ps.max_pis = opts.max_pis;
  ps.max_inserts = opts.max_inserts;
  ps.progress = false;
  ps.verbose = false;
  mockturtle::aig_resubstitution( aig, ps );
  aig = mockturtle::cleanup_dangling( aig );
}

void run_resubstitution2( mockturtle::aig_network& aig, options const& opts )
{
  options stronger = opts;
  stronger.max_inserts = std::max<uint32_t>( stronger.max_inserts, 4u );
  run_resubstitution( aig, stronger );
  run_resubstitution( aig, stronger );
}

void run_balance( mockturtle::aig_network& aig )
{
  mockturtle::aig_balancing_params ps;
  ps.minimize_levels = true;
  ps.fast_mode = true;
  mockturtle::aig_balance( aig, ps );
  aig = mockturtle::cleanup_dangling( aig );
}

void run_cut_rewrite( mockturtle::aig_network& aig )
{
  mockturtle::xag_npn_resynthesis<mockturtle::aig_network> resyn;
  mockturtle::cut_rewriting_params ps;
  ps.cut_enumeration_ps.cut_size = 4u;
  ps.progress = false;
  mockturtle::cut_rewriting_stats st;
  aig = mockturtle::cut_rewriting( aig, resyn, ps, &st );
  aig = mockturtle::cleanup_dangling( aig );
}

void run_refactor( mockturtle::aig_network& aig )
{
  mockturtle::sop_factoring<mockturtle::aig_network> resyn;
  mockturtle::refactoring_params ps;
  mockturtle::refactoring_stats st;
  mockturtle::refactoring( aig, resyn, ps, &st );
  aig = mockturtle::cleanup_dangling( aig );
}

void run_sim_resub( mockturtle::aig_network& aig, options const& opts )
{
  mockturtle::resubstitution_params ps;
  ps.max_pis = opts.max_pis;
  ps.max_inserts = std::max<uint32_t>( opts.max_inserts, 4u );
  ps.max_divisors = std::numeric_limits<uint32_t>::max();
  ps.progress = false;
  ps.verbose = false;
  mockturtle::resubstitution_stats st;
  mockturtle::sim_resubstitution( aig, ps, &st );
  aig = mockturtle::cleanup_dangling( aig );
}

void run_window_rewrite( mockturtle::aig_network& aig )
{
  mockturtle::window_rewriting_params ps;
  ps.cut_size = 6u;
  ps.num_levels = 5u;
  ps.filter_cyclic_substitutions = true;
  mockturtle::window_rewriting_stats st;
  mockturtle::window_rewriting( aig, ps, &st );
  aig = mockturtle::cleanup_dangling( aig );
}

uint32_t depth_of( mockturtle::aig_network const& aig )
{
  return mockturtle::depth_view<mockturtle::aig_network>( aig ).depth();
}

} // namespace

int main( int argc, char* argv[] )
{
  options opts;
  if ( !parse_args( argc, argv, opts ) )
  {
    print_usage( argv[0] );
    return 2;
  }

  mockturtle::aig_network aig;
  if ( lorina::read_aiger( opts.input, mockturtle::aiger_reader( aig ) ) != lorina::return_code::success )
  {
    std::cerr << "failed to read AIGER input: " << opts.input << "\n";
    return 1;
  }

  auto const before_gates = aig.num_gates();
  auto const before_depth = depth_of( aig );
  auto const start = std::chrono::steady_clock::now();

  if ( opts.flow == "resub" )
  {
    run_resubstitution( aig, opts );
  }
  else if ( opts.flow == "resub2" )
  {
    run_resubstitution2( aig, opts );
  }
  else if ( opts.flow == "balance" )
  {
    run_balance( aig );
  }
  else if ( opts.flow == "resub_balance" )
  {
    run_resubstitution( aig, opts );
    run_balance( aig );
  }
  else if ( opts.flow == "balance_resub" )
  {
    run_balance( aig );
    run_resubstitution( aig, opts );
  }
  else if ( opts.flow == "crw" || opts.flow == "cut_rewrite" )
  {
    run_cut_rewrite( aig );
  }
  else if ( opts.flow == "rf" || opts.flow == "refactor" )
  {
    run_refactor( aig );
  }
  else if ( opts.flow == "sim_resub" )
  {
    run_sim_resub( aig, opts );
  }
  else if ( opts.flow == "wrw" || opts.flow == "window_rewrite" )
  {
    run_window_rewrite( aig );
  }
  else if ( opts.flow == "cut_refactor" )
  {
    run_cut_rewrite( aig );
    run_refactor( aig );
  }
  else if ( opts.flow == "window_resub_balance" )
  {
    run_window_rewrite( aig );
    run_sim_resub( aig, opts );
    run_balance( aig );
  }
  else
  {
    std::cerr << "unknown flow: " << opts.flow << "\n";
    return 2;
  }

  std::filesystem::path const output_path{ opts.output };
  if ( output_path.has_parent_path() )
  {
    std::error_code ec;
    std::filesystem::create_directories( output_path.parent_path(), ec );
    if ( ec )
    {
      std::cerr << "failed to create output directory: " << output_path.parent_path() << ": " << ec.message() << "\n";
      return 1;
    }
  }

  mockturtle::write_aiger( aig, opts.output );
  if ( !std::filesystem::is_regular_file( output_path ) )
  {
    std::cerr << "failed to write AIGER output: " << opts.output << "\n";
    return 1;
  }

  auto const elapsed = std::chrono::duration<double>( std::chrono::steady_clock::now() - start ).count();
  if ( !opts.quiet )
  {
    std::cout << "flow=" << opts.flow
              << " gates_before=" << before_gates
              << " depth_before=" << before_depth
              << " gates_after=" << aig.num_gates()
              << " depth_after=" << depth_of( aig )
              << " runtime_sec=" << elapsed << "\n";
  }

  return 0;
}
