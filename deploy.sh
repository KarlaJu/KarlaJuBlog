#! /bin/bash

echo "1.- Add some text to make a great commit"
read commit

git add -A
git commit -m "$commit"
git push origin master

rm -rf public/*
hugo --buildDrafts

cd public
git checkout master
git add -A
git commit -m "$commit"
git push origin master --force

cd ..
git add -A
git commit -m "$commit"
git push origin master