curl -XPOST 'localhost:9200/_ingest/pipeline/_simulate?pretty' -H 'Content-Type: application/json' -d'
{
  "pipeline": {
  "description" : "parse multiple patterns",
  "processors": [
    {
      "grok": {
        "field": "message",
        "patterns": ["%{FAVORITE_DOG:pet}", "%{FAVORITE_CAT:pet}"],
        "pattern_definitions" : {
          "FAVORITE_DOG" : "beagle",
          "FAVORITE_CAT" : "burmese"
        }
      }
    }
  ]
},
"docs":[
  {
    "_source": {
      "message": "I love burmese cats!"
    }
  }
  ]
}
'
