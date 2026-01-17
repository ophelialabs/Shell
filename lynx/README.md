# Terminal Login & Deployment System

A secure terminal-based login system with deployment objectives and documentation.

## Quick Start

```bash
bash /shell/lynx/setup.sh
/shell/lynx/login.sh
```

## Credentials

- **Username:** admin
- **Password:** admin1234

## Features

- Secure login authentication
- Deployment zone assignment
- Objective display
- Related documentation reference
- Auto-session timeout (10 seconds)
- Color-coded terminal output

## System Flow

1. Display banner and login prompt
2. Validate credentials against admin account
3. Show deployment dashboard with objectives
4. Offer documentation viewing
5. Auto-clear after 10 seconds

## Deployment Information
 - Change Assignment and Documentation sections to suit personal use cases

**Current Assignment:** DEPLOYMENT ZONE ALPHA

- Security monitoring system deployment
- Firewall configuration
- SSH authentication setup
- Network validation
- Status: ACTIVE, Priority: HIGH

## Documentation Sections

The system provides quick reference guides for:

- Firewall Configuration (UFW)
- SSH Key Authentication
- System Monitoring Tools
- Network Validation Procedures
- Deployment Checklist

## File Structure

```
/home/jesse/challenges/shell/lynx2/
├── login.sh          # Main login & deployment script
├── setup.sh          # Setup/initialization script
└── README.md         # This file
```

## Customization

Edit `login.sh` to:
- Change credentials (lines 13-14)
- Modify objectives (show_dashboard function)
- Update documentation (show_documentation function)
- Adjust timeout duration (countdown_exit function)

## Security Notes

This is a demonstration system. For production use:
- Use environment variables for credentials
- Implement proper user database
- Add encryption for sensitive data
- Enable audit logging
- Implement rate limiting on failed attempts
