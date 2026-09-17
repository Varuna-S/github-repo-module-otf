language {
  compatible_with {
    opentofu = ">= 1.12"
  }
}

terraform {
  required_providers {
    github = {
      source  = "opentofu/github"
      version = "6.13.0"
    }
  }
}