provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
  zone    = var.instance_zone
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"
  name = "bucket-test1-275813"
  location = var.region
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
