resource "scaleway_object_bucket" "this" {
  for_each = { for b in var.buckets : b.name => b }

  name          = each.value.name
  tags          = each.value.tags
  region        = each.value.region
  project_id    = each.value.project_id
  force_destroy = each.value.force_destroy
}
