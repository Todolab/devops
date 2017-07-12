#!/usr/bin/env bash

# Create vagrant setting file
if [ ! -d ".settings" ]; then
    mkdir -p ".settings"
fi
if [ ! -f ".settings/Todolab.yaml" ]; then
    cp -i src/settings/Todolab.yaml .settings/Todolab.yaml
fi

# Create ansible config file
if [ ! -d "ansible/vars" ]; then
    mkdir -p "ansible/vars"
fi
if [ ! -f "ansible/vars/config.yml" ]; then
    cp -i src/settings/config.yml ansible/vars/config.yml
fi



echo "Todolab initialized!"
