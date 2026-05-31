# Tool Directory

Third-party tools should be installed or staged here when they are needed for reproduction.

Expected subdirectories:

- `abc/`: ABC source/build or a compatible replacement for `student/abc`.
- `conda-env/`: local tool environment containing Yosys, Rust/Cargo, CUDA `nvcc`, and Python dependencies.
- `mockturtle/`: MockTurtle checkout and local runner.
- `culs/`: CULS checkout/build and wrapper scripts.
- `esyn/`: E-Syn checkout/build and wrapper scripts.

Do not assume these tools are final outputs. They are candidate generators or backend transformers. Every generated AIG still needs CEC and ADP measurement.

Large third-party checkouts, binary builds, Cargo caches, and the conda environment are intentionally ignored by Git. See `student/docs/tool_status.md` for exact clone/build commands and current verification status.
