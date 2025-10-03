# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security bugs seriously. We appreciate your efforts to responsibly disclose your findings, and will make every effort to acknowledge your contributions.

### How to Report

Please report security vulnerabilities by emailing us at: security@awesome-ui.dev

Please include the following information in your report:

- Type of issue (e.g. buffer overflow, SQL injection, cross-site scripting, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

### What to Expect

After you submit a report, we will:

1. Confirm receipt of your vulnerability report within 48 hours
2. Provide regular updates on our progress
3. Credit you in our security advisories (unless you prefer to remain anonymous)

## Security Considerations for UI Components

This library focuses on UI components and design tokens. Security considerations include:

- **Input Validation**: All input components should validate and sanitize user input
- **Accessibility**: Ensure components don't expose sensitive information through screen readers
- **Theme Security**: Validate theme tokens to prevent XSS through malicious color values
- **Platform Security**: Follow platform-specific security guidelines for Material and Cupertino

## Security Best Practices

When using this library:

1. Always validate user input before processing
2. Use semantic HTML elements for better accessibility
3. Implement proper error handling and user feedback
4. Keep dependencies up to date
5. Test components with accessibility tools
6. Follow platform security guidelines

## Disclosure Policy

- We will investigate and respond to all valid reports
- We will keep you informed of our progress
- We will coordinate with you on the timing of public disclosure
- We will credit you in our security advisories (unless you prefer to remain anonymous)

## Recognition

We maintain a [Security Hall of Fame](SECURITY_HALL_OF_FAME.md) to recognize security researchers who help keep our project secure.
