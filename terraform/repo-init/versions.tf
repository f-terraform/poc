terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.14.0"
        }
    }

    backend "gcs" {
    bucket  = "f-terraform-poc"
    prefix  = "terraform/state"
    }
}
