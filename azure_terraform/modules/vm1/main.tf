module "vm1" {

  source              = "../linux-modules"
  resource_group_name = "myrg-tassi"
  location            = "West Europe"
  tags                = { "env" : "production" }
  vnet_name           = "myvnet-tassi"
  cidr_block          = ["10.0.0.0/16"]
  subnet_cidr_block   = ["10.0.2.0/24"]
  subnet_name         = "mysubnet-tassi"
  public_ip_address   = "mypublicip-tassi"
  diskSize            = "Standard_DS1_v2"
  nic_name            = "mynic_tassi"
  nsg_name            = "mynsg-tassi"
  virtualMachineName  = "my-linux.vm"
  subnets = {
    public_subnet = {
      cidr_block = ["10.0.2.0/24"]
    }
 
    private_subnet = {
      cidr_block = ["10.0.3.0/24"]
    }
  }
  inbound_rules = {
  allow_ssh = {
    portNumber                 = 22
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  allow_http = {
    portNumber                 = 80
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}

}
