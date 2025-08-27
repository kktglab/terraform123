variable "environment" {
  type = string
  default = "prod"
}

variable "storage_account_replication_type" {
  type = string
  default = "GRS"  
}

variable "storage_account_name" {
  type = string
  default = "sakris"
}