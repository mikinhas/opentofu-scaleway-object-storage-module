variable "buckets" {
  description = "List of buckets to create. The name field is used as the unique key."
  type = list(object({
    name          = string
    tags          = optional(map(string), {})
    region        = optional(string)
    project_id    = optional(string)
    force_destroy = optional(bool, false)
  }))
}
