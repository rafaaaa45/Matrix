resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = "europe-west3"
  force_destroy = true
  # Intentionally missing logging, versioning, encryption, and uniform bucket-level access
}

resource "google_storage_bucket_iam_binding" "public" {
  bucket = google_storage_bucket.this.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}