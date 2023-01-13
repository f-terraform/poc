terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.14.0"
        }
    }
    
#    backend "gcs" {
#     bucket  = "bkt-tfstate-github-pp"
#     credentials = "./terraform_credential.json"
#   }

    backend "gcs" {
    bucket  = "f_terraform_poc"
    prefix  = "terraform/state"
    }
}
