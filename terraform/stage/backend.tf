terraform {
    backend "gcs" {
        bucket = "bucket-test1-275813"
        prefix  = "terraform/state"
    }
}
