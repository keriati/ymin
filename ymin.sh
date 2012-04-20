#!/bin/bash
##
# JS/CSS Minifier script for YUI Compressor
# Feel free to make it better :)
##

yuicompressor="~/bin/yuicompressor-2.4.7.jar"

minjs()
{
    echo "Compressing all javascript files:"
    for filein in `find . -name "*.js" | grep -v \.min\.js`
    do
        compress $filein
    done
    echo "Finished!"
}

mincss()
{
    echo "Compressing all css files:"
    for filein in `find . -name "*.css" | grep -v \.min\.css`
    do
        compress $filein
    done
    echo "Finished!"
}

compress()
{
    filein=$1
    fileout=${filein/\.css/\.min\.css}
    fileout=${filein/\.js/\.min\.js}
    echo "  $filein => $fileout"
    echo "java -jar $yuicompressor $filein > $fileout"
}

help()
{
    echo "JS/CSS Minifier script for YUI Compressor"
    echo "Options"
    echo ""
    echo " -a     Compress all files in directory"
    echo " <file> Compress one file in directory"
}

case $1 in
    "-a")
        minjs
        mincss
    ;;
    *)
        if [ -f $1 ]; then
            compress $1
        else
            help
        fi
    ;;
    "")
        help
    ;;
esac
