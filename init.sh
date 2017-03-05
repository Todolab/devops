#!/usr/bin/env bash
if [ ! -d ".todolab-settings" ]; then
    mkdir -p ".todolab-settings"
fi

cp -i settings/Todolab.yaml .todolab-settings/Todolab.yaml


echo "Todolab initialized!"
