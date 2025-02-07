#!/bin/bash
echo "Building binaries..."
cargo build --release

echo "Building C libraries..."
cmake -S crates/c-api -B target/c-api --install-prefix "${SRC_DIR}/artifacts"
cmake --build target/c-api
cmake --install target/c-api

mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib

UNAME_S=$(uname -s)
case "$UNAME_S" in
  Darwin*)
    LIBDIR="lib";;
  *)
    LIBDIR="lib64";;
esac

cp ${SRC_DIR}/target/release/wasmtime ${PREFIX}/bin/
cp ${SRC_DIR}/artifacts/${LIBDIR}/libwasmtime$SHLIB_EXT ${PREFIX}/lib/
cp ${SRC_DIR}/target/release/libwasmtime_cli.rlib ${PREFIX}/lib/