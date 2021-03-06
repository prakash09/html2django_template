#!/bin/bash
li=$(grep -E '<link.*href' $1 | grep -v 'http\|{%\|{{\|.com' | grep -o "href.*" | cut -d'"' -f2)
for i in ${li[@]}; do 
    sed -i .base -e "s#$i#{% static '$i' %}#g" $1; 
done

li=$(grep -E '<img.*src' $1 | grep -v 'http\|{%\|{{\|.com' |  grep -o "src.*" | cut -d'"' -f2)
for i in ${li[@]}; do 
    sed -i .base -e "s#$i#{% static '$i' %}#g" $1; 
done

li=$(grep -E '<script.*src' $1 | grep -v 'http\|{%\|{{\|.com' | grep -o "src.*"  | cut -d'"' -f2)
for i in ${li[@]}; do 
    sed -i .base -e "s#$i#{% static '$i' %}#g" $1; 
done
li=$(grep -E 'load|staticfiles' $1 )
if [ -z "$li" ]; then
    sed -i .base -e "1s#^#{% load staticfiles %}#" $1;
fi
