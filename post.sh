#!/bin/bash
URL="http://devel-solr.tkpd:9200/product/_bulk"

if [ "$TKPENV" = 'staging' ]; then
        URL=`http://10.255.13.51:9200`
elif [ "$TKPENV" = 'production' ]; then
        URL=`http://10.255.13.51:9200`
fi

output=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        output="$(curl -s -H "Content-Type: application/x-ndjson" -XPOST $URL --data-binary "@testshop.json")"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        output="$(curl -s -H "Content-Type: application/x-ndjson" -XPOST $URL --data-binary "@testshop.json")"
fi
echo "${output}"
