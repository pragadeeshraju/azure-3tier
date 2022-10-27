variable "name" {
    type = string
    description = "Name of the project"
}
variable "subscription_id" {
  type        = string
  description = "Subscription ID of the azure account." 
}

variable "client_id" {
  type        = string
  description = "ClientID of the Service Principal."  
}

variable "client_secret" {
  type        = string
  description = "Client_secret of the Service Principal."
}  

variable "tenant_id" {
  type        = string
  description = "TenantID of the Azure Account"  
  }

variable "location" {
    type = string
}
variable "vnetcidr" {
    type = string
}
variable "websubnetcidr" {
    type = string
}
variable "appsubnetcidr" {
    type = string
}
variable "dbsubnetcidr" {
    type = string
}
variable "web_host_name"{
    type = string
}
variable "web_username" {
    type = string
}
variable "web_os_password" {
    type = string
}
variable "app_host_name"{
    type = string
}
variable "app_username" {
    type = string
}
variable "app_os_password" {
    type = string
}
variable "primary_database" {
    type = string
}
variable "primary_database_admin" {
    type = string
}
variable "primary_database_password" {
    type = string
}
variable "primary_database_version" {
    type = string
    default = "12.0"
}




