#!/bin/bash

# init puppet
apt-get update
apt-get install puppet git-core
cd ~
git clone https://github.com/edwardsharp/faye00.git
cd faye00 
git checkout -b puppet
echo "YOU DID IT!"