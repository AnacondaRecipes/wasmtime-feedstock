cargo build --release
cargo build --release --manifest-path crates\c-api\Cargo.toml

copy %SRC_DIR%\target\release\wasmtime.exe %LIBRARY_BIN%
copy %SRC_DIR%\target\release\wasmtime.dll  %LIBRARY_BIN%
copy %SRC_DIR%\target\release\libwasmtime_cli.rlib  %LIBRARY_LIB%
