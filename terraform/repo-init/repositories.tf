locals {
    repositories_data = jsondecode(file("${path.module}/repositories.json"))
    repositories_list = [for repositories in local.repositories_data.repositories : repositories]
}

module "new_repo" {
    for_each = local.repositories_data
    source = "../../modules/repository"

    repo_name        = each.value.name
    repo_description = each.value.description
    repo_topics      = each.value.topics
}
