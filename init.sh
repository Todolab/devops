#!/usr/bin/env bash
if [ ! -d ".settings" ]; then
    mkdir -p ".settings"
fi

cp -i src/settings/Todolab.yaml .settings/Todolab.yaml


echo "Todolab initialized!"
