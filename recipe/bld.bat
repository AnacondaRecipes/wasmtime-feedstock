cargo build --release

SET CMAKE_GENERATOR = "Visual Studio 16 2019"

cmake -G"%CMAKE_GENERATOR%" -S crates/c-api -B target/c-api --install-prefix "%SRC_DIR%/artifacts"
cmake -G"%CMAKE_GENERATOR%" --build target/c-api
cmake -G"%CMAKE_GENERATOR%" --install target/c-api

copy %SRC_DIR%\target\release\wasmtime.exe %LIBRARY_BIN%
copy %SRC_DIR%\target\release\libwasmtime_cli.rlib  %LIBRARY_LIB%
copy %SRC_DIR%\artifacts\lib\wasmtime.dll  %LIBRARY_BIN%
copy %SRC_DIR%\artifacts\lib\wasmtime.dll.a  %LIBRARY_LIB%
