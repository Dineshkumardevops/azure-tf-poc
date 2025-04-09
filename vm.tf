resource "azurerm_virtual_network" "example" {
  name                = "vnet-tf-poc"
  address_space       = ["10.0.0.0/16"]
  location            = "southcentralus"
  resource_group_name = "1-9978b038-playground-sandbox"
}

resource "azurerm_subnet" "example" {
  name                 = "subnet-tf-poc"
  resource_group_name  = "1-9978b038-playground-sandbox"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "nic-tf-poc"
  location            = "southcentralus"
  resource_group_name = "1-9978b038-playground-sandbox"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = "vm-tf-poc"
  resource_group_name             = "1-9978b038-playground-sandbox"
  location                        = "southcentralus"
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.example.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
