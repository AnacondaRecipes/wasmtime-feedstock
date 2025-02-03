#!/bin/bash
cargo build --release
cargo build --release --manifest-path crates/c-api/Cargo.toml

mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib

cp ${SRC_DIR}/target/release/wasmtime ${PREFIX}/bin/
cp ${SRC_DIR}/target/release/libwasmtime_c_api.rlib ${PREFIX}/lib/
cp ${SRC_DIR}/target/release/libwasmtime_cli.rlib ${PREFIX}/lib/
