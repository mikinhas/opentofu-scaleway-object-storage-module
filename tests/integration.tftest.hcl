variables {
  buckets = [
    {
      name          = "opentofu-test-bucket-ci"
      tags          = { env = "test" }
      force_destroy = true
    }
  ]
}

run "create_bucket" {
  command = apply

  assert {
    condition     = contains(keys(output.buckets), "opentofu-test-bucket-ci")
    error_message = "Output should contain key 'opentofu-test-bucket-ci'"
  }

  assert {
    condition     = output.buckets["opentofu-test-bucket-ci"].name == "opentofu-test-bucket-ci"
    error_message = "Output bucket name mismatch"
  }
}
