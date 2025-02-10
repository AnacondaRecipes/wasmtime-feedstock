cargo build --release

cmake -G "Visual Studio 16 2019" -S crates/c-api -B target/c-api --install-prefix "%SRC_DIR%/artifacts"
cmake --build target/c-api
cmake --install target/c-api

copy %SRC_DIR%\target\release\wasmtime.exe %LIBRARY_BIN%
copy %SRC_DIR%\target\release\libwasmtime_cli.rlib  %LIBRARY_LIB%
copy %SRC_DIR%\artifacts\lib\wasmtime.dll  %LIBRARY_LIB%
