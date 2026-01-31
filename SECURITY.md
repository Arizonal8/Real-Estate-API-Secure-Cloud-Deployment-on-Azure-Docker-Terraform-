
---

### `SECURITY.md`

```markdown
# Security Policy

This document describes the security considerations, practices, and assumptions used in this project.

---

## 1. Secrets management

### 1.1 Local development

For local development, secrets are stored in a `.env` file that is **not** committed to Git:

- `MONGO_URI`
- `IMAGEKIT_PUBLIC_KEY`
- `IMAGEKIT_PRIVATE_KEY`
- `IMAGEKIT_URL_ENDPOINT`
- `SMTP_USER`
- `SMTP_PASS`
- `PORT`

The `.env` file is listed in `.gitignore` to prevent accidental commits.

### 1.2 Azure Container Apps

In Azure, secrets are stored using **Container Apps secrets**, not environment variables directly.

Example pattern:

- Secret names:
  - `imagekit-public-key`
  - `imagekit-private-key`
  - `imagekit-url-endpoint`
  - `mongo-uri`
  - `smtp-user`
  - `smtp-pass`

- Environment variables:
  - `IMAGEKIT_PUBLIC_KEY=secretref:imagekit-public-key`
  - `IMAGEKIT_PRIVATE_KEY=secretref:imagekit-private-key`
  - `IMAGEKIT_URL_ENDPOINT=secretref:imagekit-url-endpoint`
  - `MONGO_URI=secretref:mongo-uri`
  - `SMTP_USER=secretref:smtp-user`
  - `SMTP_PASS=secretref:smtp-pass`

This ensures secrets are not exposed in the codebase or Terraform files.

---

## 2. Infrastructure as Code (Terraform)

Terraform is used to define Azure resources. This helps security in several ways:

- Changes are version‑controlled and reviewable.
- Resource definitions are explicit and auditable.
- Misconfigurations can be caught in code review.

Sensitive values (like connection strings) should be passed via:

- Terraform variables (with care).
- Azure Key Vault or Container Apps secrets (preferred).
- Never hard‑coded in `.tf` files.

---

## 3. Network and access

This project assumes:

- Access to Azure resources is controlled via Azure AD and role‑based access control (RBAC).
- Only authorized users can run `terraform apply` or `az containerapp` commands.
- Cosmos DB connection string is treated as a secret and not shared publicly.

If you extend this project, consider:

- Restricting Cosmos DB network access (e.g., private endpoints, IP allowlists).
- Using managed identities instead of connection strings where possible.
- Adding API authentication and authorization (e.g., JWT, OAuth).

---

## 4. Application security

At the application level:

- Environment variables are used instead of hard‑coding credentials.
- Sensitive data (passwords, keys) is never logged.
- Error messages should be sanitized before returning to clients.
- Input validation and basic checks should be implemented on all routes.

If you build on this project, you should:

- Add proper authentication and authorization.
- Validate and sanitize all user input.
- Implement rate limiting and logging for suspicious activity.

---

## 5. Logging and debugging

Logs are useful for debugging but can leak sensitive data if not handled carefully.

Guidelines:

- Do not log secrets, tokens, or passwords.
- Avoid logging full connection strings.
- Use Azure Log Analytics for centralized logging.
- Restrict access to logs to authorized users only.

---

## 6. Dependencies

Keep dependencies up to date:

- Regularly run `npm audit` and review vulnerabilities.
- Update Node.js and library versions when security patches are released.
- Avoid untrusted or unmaintained packages.

---

## 7. Git and GitHub hygiene

- Do not commit `.env` or any file containing secrets.
- Use `.gitignore` to exclude sensitive files.
- Rotate any secret that may have been exposed.
- Use protected branches and pull requests for changes to Terraform and deployment scripts.

---

## 8. Threat model (high level)

This project assumes:

- An attacker may try to:
  - Access your database via leaked connection strings.
  - Abuse exposed API endpoints.
  - Exploit misconfigured infrastructure.

Mitigations include:

- Keeping secrets out of the repo.
- Using Azure’s secret management.
- Using Infrastructure as Code for repeatable, reviewable setups.
- Adding authentication and authorization on API routes (recommended for production).

---

## 9. Responsible use

This project is intended for learning, portfolio, and controlled environments.  
Before using it in production, you should:

- Perform a full security review.
- Harden infrastructure (network, identity, monitoring).
- Add proper authentication, authorization, and input validation.
- Follow your organization’s security policies and compliance requirements.
