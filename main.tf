terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
  zone        = var.zone
}



resource "google_storage_bucket" "demo-bucket" {
  name                        = var.gcs_bucket_name
  location                    = var.location
  force_destroy               = true
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

# لإنشاء Dataset للـ BigQuery
resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name # ده الاسم اللي هيظهرلك في GCP Console
  location   = var.location        # لازم تكون نفس منطقة الـ Bucket عشان تتجنب مشاكل نقل البيانات
}
