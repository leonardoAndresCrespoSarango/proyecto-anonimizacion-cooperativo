#!/bin/bash

for patient_dir in /data/*; do
    if [ -d "$patient_dir" ]; then
        output_dir="/data/$(basename "$patient_dir")/bet_output"
        mkdir -p "$output_dir"
        for nii_file in "$patient_dir"/*.nii; do
            if [ -f "$nii_file" ]; then
                output_file="$output_dir/$(basename "${nii_file%.nii}")_brain.nii"
                bet "$nii_file" "$output_file" -f 0.5 -g 0
            fi
        done
    fi
done
