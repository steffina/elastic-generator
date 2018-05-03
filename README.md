# elastic-generator
this will generate new documents on elastic

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
* then run:
``` bash
./post.sh {index name}
```
