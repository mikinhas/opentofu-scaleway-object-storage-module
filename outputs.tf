output "buckets" {
  description = "Map of created buckets keyed by name."
  value = {
    for key, bucket in scaleway_object_bucket.this : key => {
      id       = bucket.id
      name     = bucket.name
      endpoint = bucket.endpoint
      region   = bucket.region
    }
  }
}
