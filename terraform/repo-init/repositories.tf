resource "github_repository" "terraform-created-repo" {
    name = "terraform-created-repo"
    description = "This is a description"

    visibility = "public"
    auto_init = true

    # topics = ["matts-topic"]

    has_issues = true
}

resource "github_branch" "development" {
    repository = github_repository.terraform-created-repo.name
    branch = "development"
}

resource "github_branch_default" "default" {
    repository = github_repository.terraform-created-repo.name
    branch = github_branch.development.branch
}

resource "github_branch_protection" "branch-enterprise" {
    repository_id = github_repository.terraform-created-repo.node_id

    pattern = "development"
    enforce_admins = true

    required_pull_request_reviews {
        dismiss_stale_reviews = false
        restrict_dismissals = true
    }
}

resource "github_branch_protection" "second-branch" {
    repository_id = github_repository.terraform-created-repo.node_id

    lifecycle {
        ignore_changes  = [pattern]
    }

    pattern = "protect-this-branch-too"
    enforce_admins = true

    required_pull_request_reviews {
        dismiss_stale_reviews = false
        restrict_dismissals = true
    }
}