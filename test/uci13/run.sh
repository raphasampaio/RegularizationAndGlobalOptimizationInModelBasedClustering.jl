#!/bin/bash
set -e

rm -rf RegularizationAndGlobalOptimizationInModelBasedClustering.jl

git clone https://github.com/raphasampaio/RegularizationAndGlobalOptimizationInModelBasedClustering.jl.git

export JULIA_DOWNLOAD="/tmp/julia/download"
export JULIA_INSTALL="/tmp/julia/install"
export JULIA_DEPOT_PATH="/tmp/julia/.julia"

wget https://raw.githubusercontent.com/abelsiqueira/jill/master/jill.sh
bash jill.sh --no-confirm -v 1.8.4

export PATH=$PATH:"/tmp/julia/install"
export JULIA_184="/tmp/julia/install/julia"

which $JULIA_184
$JULIA_184 --version

cd RegularizationAndGlobalOptimizationInModelBasedClustering.jl
chmod +x run.sh

./run.sh -k=[]

./run.sh --algorithm=[1,4,5,6,7,8,9,10,11,12] -i=[1,2,3,4,5,6,7,8,9,10] -k=[] --uci --datasets=[22,23,24,25] --tolerance=0.01 --maxiterations=100