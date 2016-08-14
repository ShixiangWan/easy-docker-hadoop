#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t shixiang/hadoop:1.0 .

echo ""
