#!/bin/bash
echo "compiling---"
../build/bin/clang des.c run_des.c -o run-des.o -mllvm -sub
echo "compiling done, use ./run-des.o"
echo "produce llvm----"
../build/bin/clang des.c run_des.c -mllvm -sub -emit-llvm -S
echo "llvm produced, see des.ll and run_des.ll"
./run-des.o -g keyfile
echo "keyfile----"
xxd keyfile
echo "sample.txt-----"
xxd sample.txt
./run-des.o -e keyfile sample.txt sample.enc
echo "sample.enc-----"
xxd sample.enc
./run-des.o -d keyfile sample.enc sample.dec
echo "sample.dec-----"
xxd sample.dec