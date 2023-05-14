# Variables File

variable "subscription_id" {
  description = "Azure subscription_id"
}

variable "tenant_id" {
  description = "Azure tenant_id"
}

variable "client_secret" {
  description = "Azure client_secret"
}

variable "client_id" {
  description = "Azure client_id"
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default     = "samg"
}

variable "app-prefix" {
  description = "This prefix will be included in the name of most resources for the webblog app."
  default     = "webblog"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "eastus"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.1.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.1.10.0/24"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_A0"
}

variable "node_count" {
  description = "Number of VMs"
  default     = 2
}

variable "adminuser" {
  description = "Specifies the admin username."
  default     = "adminuser"
}

variable "vm_names" {
  description = "Names of the VMs"
  type        = set(string)
  default     = ["ka-webblog-01", "ka-webblog-02", "ka-webblog-03"]
}