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

## Repository Structure

Project-17-Enterprise-SharePoint-Access-Review-Permission-Recertification-and-Security-Exception-Management-System/
├── README.md
├── setup.ps1
├── access-review-flow.json
├── sample-review.json
└── .gitignore

---

## SharePoint Components

## Access Review Register

| Column	           | Purpose
| Review Number	| Unique review identifier
| Resource Name	| Site, team, library or group
| Resource Type	| Microsoft 365 resource category
| Access Owner	| Accountable business owner
| Assigned User	| User whose access is reviewed
| Permission Level	| Read, Edit, Full Control or Member
| Review Due Date	| Required certification date
| Review Decision	| Retain, Modify, Remove or Exception
| Review Status       | Pending, Completed, Overdue or Failed
---

## Security Exception Log

| Column	           | Purpose
| Review Number	| Related access review
| Exception Reason	| Business justification
| Exception Owner	| Responsible manager
| Expiry Date	| Temporary exception end date
| Approval Status	| Pending, Approved, Rejected or Expired
| Mitigation Controls	| Compensating security controls

---

## Access Review Lifecycle

Scheduled
   ↓
Pending Review
   ↓
Retain, Modify or Remove
   ↓
Completed

---

## Exception path:

Temporary Exception
        ↓
Security Approval
        ↓
Time-Limited Access
        ↓
Expiry Review
        ↓
Remove or Renew

---

## Recommended Power Automate Steps

1. Create a scheduled quarterly flow.
2. Read access reviews whose due date has arrived.
3. Send a review request to the access owner.
4. Offer retain, modify, remove and exception decisions.
5. Update the review record.
6. Notify administrators of required permission changes.
7. Create a security-exception record when needed.
8. Store the business justification.
9. Monitor exception expiry dates.
10. Escalate overdue reviews.
11. Notify security administrators of failures.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/AccessGovernance" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

access-review-flow.json

---

## Suggested SharePoint Views

## Reviews Due

Review Due Date <= Today
Review Status = Pending

## Remove Access Decisions

Review Decision = Remove Access

## Temporary Exceptions

Review Decision = Temporary Exception

## Expired Exceptions

Expiry Date < Today
Approval Status = Approved

## High-Privilege Access

Permission Level = Full Control

---

## Security Model

* Security Team: full management access
* Access Owners: review assigned resources
* Microsoft 365 Administrators: implement permission changes
* Department Managers: view department reviews
* Auditors: read-only access
* General Employees: no access to review records
* Site Owners: full administrative control

---

## Governance Controls

* Recurring access certification
* Assigned access ownership
* Recorded review decisions
* Least-privilege enforcement
* High-permission visibility
* Temporary exception control
* Exception expiry dates
* Business justification
* Administrator implementation tracking
* Audit-ready review history

---

## Business Value

* Reduces excessive user permissions
* Supports least-privilege security
* Improves Microsoft 365 governance
* Identifies outdated access quickly
* Creates clear access ownership
* Controls temporary exceptions
* Supports internal and regulatory audits
* Reduces spreadsheet-based reviews
* Strengthens security accountability
* Improves permission visibility

---

## Future Enhancements

* Microsoft Graph permission discovery
* Entra ID access-review integration
* Automatic group-member removal
* Power BI access-governance dashboard
* Teams adaptive-card reviews
* Privileged-access reporting
* Guest-user access review
* Inactive-account detection
* Sensitivity-label integration
* Automated evidence export

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Security Governance and Enterprise Automation Portfolio.
