resource "google_project_iam_member" "wildcard_admin" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:my-service-account@${var.project}.iam.gserviceaccount.com"
}

resource "google_project_iam_custom_role" "wildcard_role" {
  role_id     = "wildcardRole"
  title       = "Wildcard Role"
  description = "Role with wildcard permissions"
  permissions = ["*"]
  project     = var.project
}