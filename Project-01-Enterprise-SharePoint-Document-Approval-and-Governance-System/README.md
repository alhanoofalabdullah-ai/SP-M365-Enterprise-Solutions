---

# README.md

```markdown
# Enterprise SharePoint Document Approval, Governance and Audit Management System

Enterprise Microsoft 365 solution for managing document submissions,
approvals, metadata, notifications and audit history using SharePoint
Online, Power Automate, Microsoft Lists and Outlook.

## Business Problem

Organizations frequently manage approvals through email attachments,
manual spreadsheets and disconnected communications. This creates
limited visibility, duplicated files and incomplete audit records.

This solution centralizes documents in SharePoint and automates the
approval lifecycle.

## Solution Features

- Enterprise SharePoint document library
- Structured document metadata
- Automated approval routing
- Approve and reject decisions
- Document status updates
- Approver comments
- Approval timestamps
- Email notifications
- Central approval audit log
- Version-history support
- Failure logging
- Governance documentation
- Reusable provisioning script

## Technologies

- SharePoint Online
- Microsoft 365
- Power Automate
- Microsoft Lists
- Microsoft Outlook
- PnP PowerShell
- JSON
- PowerShell

## Architecture

```text
Document Owner
      |
      v
SharePoint Document Library
      |
      v
Power Automate Trigger
      |
      v
Approval Request
      |
  +---+---+
  |       |
Approve  Reject
  |       |
  v       v
Update SharePoint Metadata
      |
      v
Approval Audit Log
      |
      v
Outlook Notification

---
Project-01-Enterprise-SharePoint-Document-Approval-and-Governance-System/
├── README.md
├── setup.ps1
├── flow-design.json
├── sample-data.json
├── .gitignore
└── docs/
    └── deployment-guide.md

---
## SharePoint Components

## Enterprise Documents

Document library used as the controlled repository.

| Column            | Type	          | Purpose
| Department        | Choice	        | Business ownership
| Document Owner    | Person	        | Requester
| Approver	        | Person	        | Assigned reviewer
| Approval Status	  | Choice	        | Workflow state
| Approval Date	    | Date and Time	  | Decision timestamp
| Approval Comments	| Multiple lines	| Decision notes

---
## Approval Log

Microsoft List used for traceability.

| Column	        | Type	          | Purpose
| Document Name	  | Text	          | Source document
| Document URL	  | Hyperlink	      | Document location
| Approval Action	| Choice	        | Submitted, approved or rejected
| Action By	      | Person	        | Decision maker
| Action Date	    | Date and Time 	| Event timestamp
| Comments	      | Multiple lines	| Audit information

---
## Workflow States

Draft
  ↓
Pending Approval
  ↓
Approved or Rejected

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/DocumentGovernance" `
  -ClientId "YOUR-CLIENT-ID"

---
## Governance Controls

* Required metadata
* Controlled approval states
* Document versioning
* Recorded approver identity
* Recorded decision date
* Central audit history
* Role-based access
* Failure notifications
* Secure service-account execution

---

## Business Value

* Reduces manual approval emails
* Creates one source of truth
* Improves approval visibility
* Strengthens audit readiness
* Standardizes document governance
* Reduces processing delays
* Supports compliance reporting

---

## Future Enhancements

* Sequential multi-level approvals
* Approval escalation
* Teams notifications
* Power BI dashboard
* Retention labels
* Sensitivity labels
* Microsoft Purview integration
* Digital-signature integration
* Microsoft Graph reporting

---

Author

Alhanoof Alabdullah

Microsoft 365, SharePoint, Automation and Enterprise Solutions Portfolio.
