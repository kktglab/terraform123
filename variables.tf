variable "environment" {
  type = string
  default = "stg"
}

variable "storage_account_replication_type" {
  type = string
  default = "LRS"  
}

variable "storage_account_name" {
  type = string
  default = "sakris"
}