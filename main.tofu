resource "github_repository_ruleset" "base" {
  name        = "base-ruleset"
  repository  = var.repository_name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }


  rules {
    # Only allow users with bypass permissions to delete matching refs
    deletion = true

    # Prevent merge commits from being pushed to matching branches
    required_linear_history = true

    # Commits pushed to matching branches must have verified signatures
    required_signatures = true

    # Prevent users with push access from force pushing to branches
    non_fast_forward = true

    pull_request {
      # Reviewable commits pushed will dismiss previous pull request review approvals
      dismiss_stale_reviews_on_push = true

      allowed_merge_methods = ["squash"]

      # All conversations on code must be resolved before a pull request can be merged
      required_review_thread_resolution = true
    }

  }
}
