#!/bin/bash

if [ -e "./asm.o" ]; then
  rm -rf ./asm.o
  echo -e "\e[31;1m[!] Deleted old object file\e[0;0m"
fi

if [ -e "./asm_exec" ]; then
  rm -rd ./asm_exec
  echo -e "\e[31;1m[!] Deleted old executable file\e[0;0m"
fi

nasm -f elf32 asm.S
ld -m elf_i386 asm.o -o asm_exec

o=$(./asm_exec | grep "TEST")

if [ $o == "TEST" ]; then
  echo -e "\e[32;m[+] Installation is 32-bit ready\e[0;0m"
fi
