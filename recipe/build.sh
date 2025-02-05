#!/bin/bash
echo "Building binaries..."
cargo build --release

echo "Building C libraries..."
cmake -S crates/c-api -B target/c-api --install-prefix "$(pwd)/artifacts"
cmake --build target/c-api
cmake --install target/c-api


mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib

cp ${SRC_DIR}/target/release/wasmtime ${PREFIX}/bin/
cp ${SRC_DIR}/artifacts/lib/libwasmtime$SHLIB_EXT ${PREFIX}/lib/
