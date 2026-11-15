
variable "repository_name" {
  type        = string
  description = "The name of the repository to apply the settings to"
}

variable "sha_pinning_required" {
  type        = bool
  default     = false
  description = "Require actions and reusable workflows to be pinned to a full commit SHA. Existing workflows that reference actions by tag will fail once this is enabled."
}
