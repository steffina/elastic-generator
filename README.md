# elastic-generator
this will generate new documents on elastic

## requirement
* jq https://stedolan.github.io/jq/download/

## structure
``` bash
{
  "create": {
    "_index": "{index name}",
    "_type": "default",
    "_id": "{document id, should unique}"
  }
}
{
  ... map of index
}
```

## how to run
* modify file {index name}.json as needed
* file json will generate {index name}.min.json
* then run:
``` bash
./post.sh {update|delete} {index name}
```
