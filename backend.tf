terraform {
  backend "remote" {
    organization = "kris-tf-test"
    workspaces {
      name = "terraform123"
    }
  }  
}   