terraform {
  cloud {
    organization = "kris-tf-test"
    workspaces {
      name = "terraform123"
    }
  }
}   