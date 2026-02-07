# opentofu-scaleway-object-storage-module

OpenTofu module for creating S3-compatible object storage buckets on Scaleway.

## Usage

```hcl
module "buckets" {
  source = "github.com/mikinhas/opentofu-scaleway-object-storage-module"

  buckets = {
    logs = {
      name = "my-app-logs"
      tags = { env = "prod", team = "platform" }
    }
    backups = {
      name          = "my-app-backups"
      region        = "nl-ams"
      force_destroy = true
    }
  }
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `buckets` | Map of buckets to create. Each key is a logical identifier. | `map(object({...}))` | yes |

Each bucket object supports:

| Attribute | Description | Type | Default |
|-----------|-------------|------|---------|
| `name` | Bucket name | `string` | — |
| `tags` | Map of tags | `map(string)` | `{}` |
| `region` | Scaleway region (e.g. `fr-par`, `nl-ams`) | `string` | Provider default |
| `project_id` | Scaleway project ID | `string` | Provider default |
| `force_destroy` | Delete objects before destroying the bucket | `bool` | `false` |

## Outputs

| Name | Description |
|------|-------------|
| `buckets` | Map of created buckets with `id`, `name`, `endpoint`, and `region` |
