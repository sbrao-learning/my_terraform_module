output "storage_account_location" {
  value = {
    for k, v in azurerm_storage_account.sa :
    k => v.primary_location
  }
}

output "sa1_storage_location" {
  value = azurerm_storage_account.sa["sa1"].primary_location
}