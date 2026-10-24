resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "centralindia"
}
/*
## I am commenting this temporarily
resource "azurerm_virtual_network" "app_network" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = local.virtual_network.address_prefix

}
resource "azurerm_subnet" "websubnet01" {
  name                 = local.subnets.name[0]
  resource_group_name  = azurerm_resource_group.appgrp.name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes     = [local.subnet_address_prefix[0]]
}
resource "azurerm_subnet" "appsubnet01" {
  name                 = local.subnets.name[1]
  resource_group_name  = azurerm_resource_group.appgrp.name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes     = [local.subnet_address_prefix[1]]
}
#Azure RM network interface
#This is my creation
resource "azurerm_network_interface" "appinterface01" {
  name                = "appinterface01"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.appsubnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.appip01.id
  }
}
resource "azurerm_network_interface" "webinterface01" {
  name                = "webinterface01"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.websubnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.webip01.id
  }
}

# Public ip associated with NIC
resource "azurerm_public_ip" "webip01" {
  name                = "webip01"
  resource_group_name = azurerm_resource_group.appgrp.name
  location            = local.resource_location
  allocation_method   = "Static"
}
# Public ip associated with NIC
resource "azurerm_public_ip" "appip01" {
  name                = "appip01"
  resource_group_name = azurerm_resource_group.appgrp.name
  location            = local.resource_location
  allocation_method   = "Static"
}
# Creating network securigty group and inbound rule
resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-nsg"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name
  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
#Assigning NSG to subnets.
resource "azurerm_subnet_network_security_group_association" "websubnet01_appnsg"{
  subnet_id = azurerm_subnet.websubnet01.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "appsubnet01_appnsg"{
  subnet_id = azurerm_subnet.appsubnet01.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}
resource "azurerm_windows_virtual_machine" "webvm01" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.appgrp.name
  location            = local.resource_location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.webinterface01.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_managed_disk" "datadisk01" {
  name                 = "datadisk01"
  location             = local.resource_location
  resource_group_name  = azurerm_resource_group.appgrp.name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = "4"
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk01_webvm01" {
  managed_disk_id    = azurerm_managed_disk.datadisk01.id
  virtual_machine_id = azurerm_windows_virtual_machine.webvm01.id
  lun                = "0"
  caching            = "ReadWrite"
}
*/
/*
## Handling count in the resource block below it will create 3 storage accounts with
same configuration.
*/
resource "azurerm_storage_account" "appstorageaccount" {
  count = 3
  name                     = "${count.index}appstore400009078"
  resource_group_name      = "app-grp"
  location                 = azurerm_resource_group.appgrp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}