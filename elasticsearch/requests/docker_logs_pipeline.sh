curl -XPUT 'localhost:9200/_ingest/pipeline/docker_logs_pipeline?pretty' -H 'Content-Type: application/json' -d'
{
  "description" : "docker logs pipeline",
  "processors" : [
    {
      "grok": {
        "field": "log",
        "ignore_failure" : true,
        "patterns": [
          "%{COMBINEDAPACHELOG}",
          "%{COMMONAPACHELOG}"
        ]
      }
    }
  ]
}
'
