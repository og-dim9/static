#! /bin/sh

first_arg="$1"
shift

if [ "$first_arg" = "dat2xml" ]; then
    exec /bin/dat2xml $@
elif [ "$first_arg" = "xml2dat" ]; then
    exec /bin/xml2dat $@
elif [ "$first_arg" = "cb2xml" ]; then
    exec /bin/cb2xml $@
else
    exec cb2xml $@
fi