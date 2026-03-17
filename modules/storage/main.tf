#################################
# Storage Account
#################################

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location

  account_tier             = var.account_tier           # Standard / Premium
  account_kind             = var.account_kind           # StorageV2
  account_replication_type = var.account_replication_type  # ZRS / LRS / GRS
  access_tier              = var.access_tier           # Hot / Cool

  min_tls_version           = var.min_tls_version
  #enable_https_traffic_only = true
  is_hns_enabled            = var.hns_enabled          # Flat namespace for Blob Storage
  sftp_enabled              = var.sftp_enabled

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = var.delete_retention_days
    }

    container_delete_retention_policy {
      days = var.container_delete_retention_days
    }
  }

  tags = var.tags
}

#################################
# Storage Container
#################################

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}