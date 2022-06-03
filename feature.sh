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
mkdir -v datasources
mkdir -v models
mkdir -v repositories
cd ..

# Create Domain Folder
mkdir -v domain
cd domain
mkdir -v entities
mkdir -v repositories
mkdir -v usecases
cd ..

# Create Presentation Folder
mkdir -v presentation
cd presentation
mkdir -v providers
mkdir -v pages
mkdir -v widgets

echo "Feature $name setup!"
