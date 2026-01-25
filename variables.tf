variable "credentials" {
  description = "My Credentials"
  default     = "my-creds.json"
}

variable "project" {
  description = "Project ID"
  default     = "project-f6a0efb4-f01f-4835-8ba" # الـ ID بتاعك
}

variable "zone" {
  description = "Zone"
  default     = "us-central1-c"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "project-f6a0efb4-f01f-4835-8ba-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
