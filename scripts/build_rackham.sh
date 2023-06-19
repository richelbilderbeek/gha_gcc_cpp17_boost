#!/bin/bash
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00
#SBATCH --job-name gha_gcc_cpp17_boost
#SBATCH --qos=short
#
# Build the project on Rackham, an UPPMAX computer cluster, see
# https://www.uppmax.uu.se/support/user-guides/rackham-user-guide/
#
# Usage:
#
#   ./scripts/build_rackham.sh
#
#  Using sbatch, when being Richel:
#
#   sbatch -A uppmax2023-2-25 -M snowy scripts/build_rackham.sh
#
#  Or using the convenience script:
#
#   ./sbatch_richel.sh
#
if [[ ! -z "${CLUSTER}" ]]; then
  echo "Working on a cluster"
else
  echo "Not working on a cluster, stopping"
  exit 42
fi


date

# Loading GCC and Boost
module load gcc/13.1.0 boost/1.66.0

# Where is Boost?
whereis boost

g++ main.cpp --verbose -I/usr/include -o gha_gcc_cpp17_boost
./gha_gcc_cpp17_boost