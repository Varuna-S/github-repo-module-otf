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

resource "github_workflow_repository_permissions" "base" {
  repository = var.repository_name

  # Default workflow token permission must be read-only
  default_workflow_permissions = "read"

  # Workflows must not be allowed to approve pull requests
  can_approve_pull_request_reviews = false
}

resource "github_repository_vulnerability_alerts" "base" {
  # Repository must have vulnerability alerts enabled
  repository = var.repository_name

  enabled = true
}

resource "github_actions_repository_permissions" "base" {
  repository = var.repository_name

  enabled = true

  allowed_actions = "selected"
  allowed_actions_config {
    # Allow GitHub-owned actions
    github_owned_allowed = true

    # Allow specific actions by pattern
    # patterns_allowed = []

    # Allow Marketplace-verified actions
    verified_allowed = true
  }
}
