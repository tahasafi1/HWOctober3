#!/bin/bash

task="vpc ec2 subnet"

for t in $task; do
    cd $t
    echo in $t
    terraform init
    echo terraform init
    terraform apply -auto-approve
    echo terraform apply
    cd ..
done
