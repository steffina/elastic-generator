#!/bin/bash
# export TKPENV to define environtment
# first param are index
# ex: post.sh product

output="Nothing to do"
if [[ "$1" != "" && "$2" != "" ]]; then
	# minify json
	echo "$(jq -c . < $2.json)" &> "$2.min.json"

	URL="http://devel-solr.tkpd:9200"
	if [ "$TKPENV" = 'staging' ]; then
        	URL=`http://10.255.13.51:9200`
	elif [ "$TKPENV" = 'production' ]; then
        	URL=`http://10.255.13.51:9200`
	fi
	URL="$URL/$2"

	if [[ "$1" == "update" ]]; then
		output="$(curl -s -H "Content-Type: application/x-ndjson" -XPOST "$URL/_bulk" --data-binary "@$2.min.json")"
	elif [[ "$1" == "delete" && "$2" != "product" && "$2" != "shop" ]]; then
		output="$(curl -XDELETE $URL)"
	fi
fi
echo "${output}"
