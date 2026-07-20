# Enterprise SharePoint Access Review, Permission Recertification and Security Exception Management System

Enterprise Microsoft 365 solution for reviewing user access, confirming
permission requirements, removing unnecessary access and managing
temporary security exceptions using SharePoint Online and Power Automate.

## Business Problem

Organizations often grant employees access to SharePoint sites, Teams,
document libraries and business workspaces without performing regular
reviews.

Over time, users may retain unnecessary permissions after changing
roles, moving departments or leaving projects. This creates security,
privacy and compliance risks.

This solution provides a centralized access-review register and
automates recurring permission recertification.

## Core Features

- Central access-review register
- Unique review-number tracking
- SharePoint and Microsoft 365 resource classification
- Access-owner assignment
- User and permission-level tracking
- Quarterly access recertification
- Retain, modify or remove decisions
- Temporary security exceptions
- Exception-expiry monitoring
- Overdue-review escalation
- Administrator notifications
- Review history and evidence
- Failure handling

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- Microsoft 365 Groups
- PnP PowerShell
- JSON

## Architecture

```text
Microsoft 365 Access Record
           |
           v
SharePoint Access Review Register
           |
           v
Quarterly Power Automate Flow
           |
           v
Access Owner Review
           |
    +------+------+-----------+
    |             |           |
 Retain        Modify       Remove
    |             |           |
    |             v           v
    |       Permission     Administrator
    |       Adjustment     Notification
    |
    v
Temporary Exception
    |
    v
Security Exception Log
    |
    v
Expiry Monitoring

---

## 
