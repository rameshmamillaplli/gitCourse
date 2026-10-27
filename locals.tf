locals {
resource_location="centralindia"
virtual_network ={
    name = "app-network"
    address_prefix = ["10.0.0.0/16"]
}
## Better approach
subnets ={
    name = ["websubnet01","appsubnet01"]
}
subnet_address_prefix = ["10.0.0.0/24","10.0.1.0/24"]
/*
websubnet ={
    websubnetname = "websubnet01"
    websubnet_address_prefix = "10.0.0.0/24"
}
appsubnet ={
    appsubnetname = "appsubnet01"
    appsubnet_address_prefix= "10.0.1.0/24"
}
*/
}
