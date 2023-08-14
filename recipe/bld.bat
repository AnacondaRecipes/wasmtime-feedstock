cargo build --release
cargo build --release --manifest-path crates\c-api\Cargo.toml

copy %SRC_DIR%\target\release\wasmtime %LIBRARY_BIN%
copy %SRC_DIR%\target\release\wasmtime.dll  %LIBRARY_LIB%
copy %SRC_DIR%\target\release\libwasmtime_cli.rlib  %LIBRARY_LIB%
