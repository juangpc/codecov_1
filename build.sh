#!/bin/bash

mkdir -p build

clang++ -c -fprofile-instr-generate -fcoverage-mapping src/foo.cpp -o build/foo.o
clang++ -c -fprofile-instr-generate -fcoverage-mapping src/func1.cpp -o build/func1.o

clang++ -fprofile-instr-generate -fcoverage-mapping src/main.cpp -o build/app

mkdir -p coverage

LLVM_PROFILE_FILE="coverage/app.profraw" build/app

/Library/Developer/CommandLineTools/usr/bin/llvm-profdata merge -sparse coverage/app.profraw -o coverage/app.profdata

/Library/Developer/CommandLineTools/usr/bin/llvm-cov show --show-branches=count build/app -instr-profile=coverage/app.profdata
/Library/Developer/CommandLineTools/usr/bin/llvm-cov show build/app -instr-profile=coverage/app.profdata
/Library/Developer/CommandLineTools/usr/bin/llvm-cov show build/app -instr-profile=coverage/app.profdata > coverage/coverage.txt

/Library/Developer/CommandLineTools/usr/bin/llvm-cov report build/app -instr-profile=coverage/app.profdata

./codecov -t c0d84956-6f86-4f21-a947-6bcd026ec152 --source src --file coverage/coverage.txt 

