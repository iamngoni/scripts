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
cd repositories
mkdir abstract
mkdir impl
cd ..

mkdir networking
cd ..

# Create Models Folder
mkdir -v models

# Create Presentation Folder
mkdir -v presentation
cd presentation
mkdir widgets
mkdir controllers
mkdir pages
cd ..

echo "Feature $name setup!"
