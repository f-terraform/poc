locals {
    repositories_data = jsondecode(file("${path.module}/repositories.json"))
    repositories_list = local.repositories_data.repositories
}

module "new_repo" {
    for_each  = local.repositories_list
    source    = "../../modules/repository"

    repo_name        = each.key
    repo_description = each.value.description
    repo_topics      = each.value.topics
}
