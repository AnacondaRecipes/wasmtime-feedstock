#!/bin/bash
cargo build --release
cargo build --release --manifest-path crates/c-api/Cargo.toml

cp ${SRC_DIR}/target/release/wasmtime ${PREFIX}/bin/

if [ `uname` == Darwin ]; then  
    cp ${SRC_DIR}/target/release/libwasmtime.dylib ${PREFIX}/lib/
elif [ `uname` == Linux ]; then
    cp ${SRC_DIR}/target/release/libwasmtime.so ${PREFIX}/lib/
fi
cp ${SRC_DIR}/target/release/libwasmtime_cli.rlib ${PREFIX}/lib/

