for file in $(/usr/bin/ls examples/*.pdf); do
    pdftoppm $file ${file%.*} -png
done
mv examples/*-[0-9].png assets
