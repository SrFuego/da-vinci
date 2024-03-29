#!/bin/bash

# Script to update requierements

# environments = (develop, staging, testing, production)

environments=("develop")

for i in ${!environments[@]}; do
    environment=${environments[$i]}
    echo "Environment: ${environment}"
    pip-compile -r api/requirements/${environment}.in -o api/requirements/$(date +'%Y%m%d').${environment}
done
