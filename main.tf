module "resource_group" {
  source         = "./modules/01_resource_group"
  resource_group = var.resource_group
}

module "storage_account" {
  source          = "./modules/02_Storage_account"
  storage_account = var.storage_account
  depends_on      = [module.resource_group]
}

module "virtual_network" {
  source          = "./modules/03_virtual_network"
  virtual_network = var.virtual_network
  depends_on      = [module.resource_group]

}


module "subnet" {
  source     = "./modules/04_subnet"
  subnet     = var.subnet
  depends_on = [module.resource_group, module.virtual_network]
}


module "network_security_group" {
  source     = "./modules/05_nsg"
  nsg        = var.nsg
  depends_on = [module.resource_group]
}




module "subnet_nsg_assciation" {
  source                 = "./modules/06_subnet_nsg_association"
  subnet_nsg_association = var.subnet_nsg_association
  subnet_ids             = module.subnet.subnet_id
  nsg_ids                = module.network_security_group.nsg_id
  depends_on             = [module.network_security_group, module.subnet]
}


module "public_ip" {
  source     = "./modules/07_public_ip"
  pip        = var.pip
  depends_on = [module.resource_group]
}



module "nic" {

  source     = "./modules/08_nic"
  nic        = var.nic
  subnet_ids = module.subnet.subnet_id
  pip_ids    = module.public_ip.pip_id
  depends_on = [module.resource_group]
}

module "vm" {
  source     = "./modules/09_Virtual_machine"
  myvms      = var.myvms
  nic_ids    = module.nic.nic_id
  depends_on = [module.resource_group, module.subnet, module.nic]
}