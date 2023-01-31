locals {
    repositories_data = jsondecode(file("${path.module}/repositories.json"))
    repositories_list = local.repositories_data.repositories
}

provider "github" {
    owner = "f-terraform"
    token = var.gh_token
}

module "new_repo" {
    for_each  = local.repositories_list
    source    = "../../modules/repository"
    providers = {
        github = github
    }

    repo_name        = each.key
    repo_description = each.value.description
    repo_topics      = each.value.topics
}
