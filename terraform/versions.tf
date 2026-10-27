terraform {
  required_version = ">= 1.4.0, < 2.0.0"
}

# State is stored locally for this exercise (no backend block).
# A team would use a remote backend such as a GCS bucket with locking.
