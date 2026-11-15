# Security Policy

## Supported Versions

| Version | Supported |
| ------- | --------- |
| `main`  | Yes       |

Only the current state of the default branch is supported. Fixes are not
backported to earlier tags.

## Reporting a Vulnerability

**Please do not open a public issue for a security concern.**

Report it privately through
[GitHub Security Advisories](https://github.com/Varuna-S/github-repo-module-otf/security/advisories/new).

Please include:

- A description of the vulnerability and its impact
- Steps to reproduce, or the configuration that triggers it
- The affected module or file paths
- Any known mitigations or workarounds

Please do **not** include real account identifiers, credentials, or state files
in your report. A redacted example is sufficient.

## Response Process

This project is maintained by a single volunteer on a best-effort basis.

- **Acknowledgement** — we aim to acknowledge a valid report within
  **15 business days**.
- **Confidentiality** — we aim to keep reports confidential until a fix is
  available, or until the disclosure window below has elapsed.
- **Disclosure** — after verification we aim for coordinated disclosure within
  **60 days**, though this may vary with the complexity of the fix.
- **Communication** — we aim to work with the reporter to clarify details and
  discuss mitigations, and to publish a GitHub Security Advisory once the issue
  is resolved.

This policy describes intent, not a contractual commitment. The software is
provided under the terms of the [LICENSE](LICENSE), which disclaims warranties
and limits liability.

## Scope

**In scope** — defects in the OpenTofu module published in this repository.
For example: a ruleset that leaves the default branch open to force pushes or
deletion, a workflow token granted more permission than documented, or an
Actions policy that lets unverified third-party actions run.

**Out of scope**

- Misconfigurations introduced in your own deployment of these modules
- Automated scanner output with no demonstrated impact
