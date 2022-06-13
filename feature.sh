#! /bin/sh
echo "Setting up feature in $PWD"
cd $PWD
while getopts n: flag
do
    case "${flag}" in 
        n) name=${OPTARG};;
    esac
done

echo "Feature: $name in $PWD"

mkdir -v $name

cd $name

# Create Data folder
mkdir -v data
cd data
mkdir repositories
mkdir dtos
mkdir datasources
cd ..

# Create Domain Folder
mkdir -v domain
cd domain
mkdir models
cd ..

# Create Presentation Folder
mkdir -v presentation
cd presentation
mkdir widgets
mkdir providers
mkdir controllers
cd ..

# Create Application Folder
mkdir -v application
cd application
mkdir services


echo "Feature $name setup!"
