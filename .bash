#!/bin/bash
set -e
flutter analyze
if [ $? -eq 0 ]
then
    echo "Analysis passed. Proceeding with build."
    flutter build
else
    echo "Analysis failed. Build cancelled."
    exit 1
fi