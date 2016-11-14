#!/bin/bash
echo "compiling---"
../build/bin/clang des.c run_des.c -o run-des.o -mllvm -sub
echo "compiling done, use ./run-des.o"
echo "produce llvm----"
../build/bin/clang des.c run_des.c -emit-llvm -S
echo "llvm produced, see des.ll and run_des.ll"
echo "produce obfuscated llvm----"
../build/bin/clang des-ob.c run_des-ob.c -mllvm -sub -emit-llvm -S
echo "obfuscated llvm produced, see des-ob.ll and run_des-ob.ll"
echo "produce llvm bc----"
../build/bin/clang -c des.c run_des.c -emit-llvm
echo "llvm bc produced, see des.bc and run_des.bc"
echo "produce obfuscated llvm bc----"
../build/bin/clang -c des-ob.c run_des-ob.c -mllvm -sub -emit-llvm
echo "obfuscated llvm bc produced, see des-ob.bc and run_des-ob.bc"
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
echo "compare decrypted and original----"
diff sample.txt sample.dec
echo "end"
