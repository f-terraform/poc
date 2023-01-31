variable "repo_name" {
    type = string
}

variable "repo_description" {
    type = string
}

variable "repo_topics" {
    type = list(string)
}

variable "repo_visibility" {
    type    = string
    default = "internal"
}
