#!/bin/bash
# export TKPENV to define environtment
# first param are index
# ex: post.sh product

URL="http://devel-solr.tkpd:9200/$1"

if [ "$TKPENV" = 'staging' ]; then
	URL=`http://10.255.13.51:9200`
elif [ "$TKPENV" = 'production' ]; then
	URL=`http://10.255.13.51:9200`
fi

output=""
if [[ "$1" != "" ]]; then
	if [[ "$1" == "update" ]]; then
		output="$(curl -s -H "Content-Type: application/x-ndjson" -XPOST "$URL/_bulk" --data-binary "@$2.min.json")"
	elif [[ "$1" == "delete" ]]; then
		output="$(curl -X DELETE $URL)"
	fi
fi
echo "${output}"
