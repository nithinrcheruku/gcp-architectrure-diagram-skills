# Multi-Tenant Agentic AI Platform on Google Cloud
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

# VPC Network & Subnets
resource "google_compute_network" "vpc_hub" {
  name                    = "vpc-hub-us-central1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_compute" {
  name          = "subnet-compute-sandbox"
  ip_cidr_range = "10.10.0.0/20"
  region        = "us-central1"
  network       = google_compute_network.vpc_hub.id
}

# Cloud Armor Security Policy
resource "google_compute_security_policy" "cloud_armor_edge" {
  name        = "policy-cloud-armor-edge"
  description = "Edge WAF and DDoS Protection for Multi-Tenant Gateway"

  rule {
    action   = "deny(403)"
    priority = "1000"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('sqli-v33-stable')"
      }
    }
  }
}

# Cloud Run Agent Runtime (gVisor MicroVM Sandbox)
resource "google_cloud_run_v2_service" "agent_runtime" {
  name     = "agent-runtime-sandbox"
  location = "us-central1"

  template {
    execution_environment = "EXECUTION_ENVIRONMENT_GEN2" # gVisor isolation
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/agent-runtime:latest"
      resources {
        limits = {
          cpu    = "4000m"
          memory = "8Gi"
        }
      }
    }
  }
}

# Cloud SQL AlloyDB / PostgreSQL (Tenant Row Isolation)
resource "google_sql_database_instance" "tenant_db" {
  name             = "tenant-db-instance"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    tier = "db-custom-4-16384"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc_hub.id
    }
  }
}

# Cloud KMS Customer-Managed Encryption Keys (CMEK)
resource "google_kms_key_ring" "tenant_keyring" {
  name     = "tenant-cmek-keyring"
  location = "us-central1"
}

resource "google_kms_crypto_key" "tenant_key" {
  name     = "tenant-encryption-key"
  key_ring = google_kms_key_ring.tenant_keyring.id
  rotation_period = "7776000s" # 90 days
}
