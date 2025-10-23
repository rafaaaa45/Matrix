resource "google_sql_database_instance" "public_db" {
  name             = "test-sql-instance"
  database_version = "POSTGRES_13"
  region           = "europe-west3"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }
    # Intentionally missing disk encryption
  }
}