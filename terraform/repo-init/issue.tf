resource "github_issue" "test" {
    repository = github_repository.terraform-created-repo.name
    title = "Another new Issue"
    body = "This is a test :dog"
}
