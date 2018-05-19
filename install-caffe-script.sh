#!/bin/bash

Echo off
echo "Check our ubuntue apt-get source list is updated..."
apt-get install sudo -y
sudo apt-get update -y

echo "Install the dependencies..."
sudo apt-get install python-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler  -y
sudo apt-get install --no-install-recommends libboost-all-dev  -y

echo "Install Caffe package..."
git clone https://github.com/BVLC/caffe
cd caffe
cp Makefile.config.example Makefile.config

echo "Install basic python dependencies..."
sudo pip install numpy scikit-image protobuf
cd python
for req in $(cat requirements.txt); do sudo pip install $req; done
cd ../

pause
