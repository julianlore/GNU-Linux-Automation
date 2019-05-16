#!/usr/bin/env bash
# Example user
user="jl"
groups="wheel"
useradd -m -G $groups -s /bin/zsh $user
passwd $user
