output "selected_vnet_id" {
  value = module.virtual_network.vnet_id[var.vnet_id_check]
}

