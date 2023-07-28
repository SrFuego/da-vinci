#!/bin/bash

# Script to update requierements

# environments = (develop, staging, testing, production)

environments=("develop")

for i in ${!environments[@]}; do
    environment=${environments[$i]}
    echo "Environment: ${environment}"
    pip-compile -r requirements/${environment}.in -o requirements/$(date +'%Y%m%d').${environment}
done
