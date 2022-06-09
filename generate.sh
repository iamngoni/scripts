#! /bin/sh
echo "$PWD"
cd $PWD

while getopts l:n: flag
do
    case "${flag}" in 
        l) language=${OPTARG};;
        n) name=${OPTARG};;
    esac
done

languages=("flutter" "nodejs" "react" "vue")
exists=0

for str in ${languages[@]}; do
    if [ "$str" = "$language" ]; then
        exists=1
    fi
done

echo "Language is supported: $exists"

if [[ ! " ${languages[*]} " =~ " ${language} " ]]; then
    echo "$language is not yet supported by script. 😱😱"
    exit 1
fi

echo "Generating new $language project named $name"

if [ "$language" == "flutter" ]; then
    flutter create --org zw.co.iamgoni $name
fi

if [ "$language" == "react" ]; then
    yarn create vite $name --template react
fi

if [ "$language" == "vue" ]; then
    yarn create vite $name --template vue
fi

if [ "$language" == "nodejs" ]; then
    mkdir $name
    cd $name
    npm init -y
    mkdir src
    cd src
    touch index.ts
    cd ..
    echo "Copying node template files"
    cp /home/iamngoni/scripts/node/* .
    cd ..
fi

cd $PWD/$name
echo "Generating git project"
git init .
git add .
git commit -m "Initial commit"
echo "Attempting to create repository"
gh repo create $name --private
git remote add origin git@github.com:iamngoni/$name.git
git push -u origin master
