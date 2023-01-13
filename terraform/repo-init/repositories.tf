resource "github_repository" "terraform-created-repo" {
    name = "terraform-created-repo"
    description = "This is a description"

    visibility = "public"
    auto_init = true

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
