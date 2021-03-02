#!/bin/bash

if dpkg --get-selections | grep -q "build-essential" > /dev/null; then
    echo "Success"
fi