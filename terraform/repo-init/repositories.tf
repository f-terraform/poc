locals {
    repositories_data = jsondecode(file("${path.module}/repositories.json"))
    repositories = [for repo in local.repositories_data : repo]
}

module "new_repo" {
    for_each = local.repositories
    source = "../../modules/repository"

    repo_name        = each.name
    repo_description = each.description
    repo_topics      = each.topics
}
