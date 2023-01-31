resource "github_repository" "generated-repo" {
    name        = var.repo_name
    description = var.repo_description
    topics      = var.repo_topics
    visibility  = var.repo_visibility

    auto_init              = true
    delete_branch_on_merge = true
    has_issues             = true

    lifecycle {
        ignore_changes = [topics]
    }
}

resource "github_branch_protection" "main" {
    repository_id  = github_repository.generated-repo.node_id
    pattern        = "main"
    enforce_admins = true

    required_pull_request_reviews {
        dismiss_stale_reviews = false
        restrict_dismissals   = true
    }
}
