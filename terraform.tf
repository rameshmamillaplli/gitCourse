terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.8.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  client_id="f60716e5-743d-47c6-9ce1-261b7766ccf3"
  client_secret = "EO28Q~_nfbprv9Hd1z_7~Gl0.0fnlYyi.kXhoa7_"
  tenant_id = "0aaab9d5-17aa-45dc-a4fc-f45063ce0e62"
  subscription_id = "c01ad50a-b878-44d0-972f-98c0fe6ad372"
}

/*
### This is Manipal account
provider "azurerm" {
  features {
  }
  #client_id="f60716e5-743d-47c6-9ce1-261b7766ccf3"
  #client_secret = "EO28Q~_nfbprv9Hd1z_7~Gl0.0fnlYyi.kXhoa7_"
  tenant_id = "29bebd42-f1ff-4c3d-9688-067e3460dc1f"
  subscription_id = "1111c70d-3fb1-47fe-8e6e-b9cdaa8b050e"
  use_cli = true
}
*/

