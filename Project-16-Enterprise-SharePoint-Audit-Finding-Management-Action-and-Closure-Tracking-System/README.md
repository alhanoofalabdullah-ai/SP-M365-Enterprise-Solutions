# Enterprise SharePoint Audit Finding, Management Action and Closure Tracking System

Enterprise Microsoft 365 solution for managing audit findings,
management actions, remediation deadlines, evidence and formal closure
using SharePoint Online and Power Automate.

## Business Problem

Audit findings are often tracked through spreadsheets, email chains and
separate evidence folders. This creates limited visibility into overdue
actions, accountable owners and closure evidence.

This solution centralizes audit findings and automates follow-up,
escalation and closure validation.

## Core Features

- Central enterprise audit-finding register
- Automatic finding-number generation
- Audit-area classification
- Finding-owner assignment
- Risk-rating tracking
- Target-closure-date monitoring
- Management-action register
- Action-owner accountability
- Automated reminders
- High-risk escalation
- Closure-evidence tracking
- Formal audit validation
- Failure notifications

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- PnP PowerShell
- JSON
- Microsoft 365

## Architecture

```text
Audit Finding
      |
      v
SharePoint Audit Register
      |
      v
Power Automate Workflow
      |
      +--> Assign Finding Owner
      |
      +--> Create Management Action
      |
      +--> Monitor Due Date
      |
      +--> Escalate Overdue Finding
      |
      v
Closure Evidence
      |
      v
Internal Audit Validation
      |
      v
Closed Finding

---

## Repository Structure

Project-16-Enterprise-SharePoint-Audit-Finding-Management-Action-and-Closure-Tracking-System/
├── README.md
├── setup.ps1
├── audit-flow.json
├── sample-finding.json
└── .gitignore

---

## SharePoint Components

## Enterprise Audit Findings

| Column	                  | Purpose
| Finding Number	          | Unique audit identifier
| Audit Area              	| Audited function or process
| Finding Owner	            | Accountable manager
| Risk Rating	              | Low, Medium, High or Critical
| Finding Details	          | Audit observation
| Target Closure Date      	| Required remediation deadline
| Finding Status	          | Current lifecycle stage

---

## Audit Management Actions

| Column	               | Purpose
| Finding Number	       | Related finding
| Management Action	     | Agreed remediation action
| Action Owner	         | Responsible employee
| Due Date	             | Required completion date
| Action Status	         | Open, In Progress, Completed or Overdue
| Closure Evidence	     | Evidence reference

---

## Finding Lifecycle

Open
  ↓
Action Agreed
  ↓
In Progress
  ↓
Evidence Submitted
  ↓
Audit Validation
  ↓
Closed

---

## Overdue path:

In Progress
    ↓
Due Date Missed
    ↓
Escalated
    ↓
Management Review

---

## Recommended Power Automate Steps

1. Trigger when an audit finding is created.
2. Generate a unique finding number.
3. Set finding status to Open.
4. Assign the responsible owner.
5. Create a management-action record.
6. Send reminders before the due date.
7. Escalate overdue high-risk findings.
8. Request closure evidence.
9. Route completed actions to Internal Audit.
10. Close the finding after validation.
11. Configure failure handling.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/InternalAudit" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

audit-flow.json

---

## Suggested SharePoint Views

## High-Risk Findings

Risk Rating = High or Critical
Finding Status is not Closed

## Overdue Actions

Due Date < Today
Action Status is not Completed

## Evidence Pending Review

Finding Status = Evidence Submitted

## Closed Findings

Finding Status = Closed

---

## Security Model

* Internal Audit: full management access
* Finding Owners: update assigned findings
* Action Owners: update assigned remediation actions
* Executives: read high-risk findings
* Auditors: read-only reporting access
* Site Owners: full administrative control

---

## Governance Controls

* Unique finding identification
* Standard risk classification
* Assigned ownership
* Agreed management actions
* Defined remediation deadlines
* Automated overdue escalation
* Mandatory closure evidence
* Independent audit validation
* Role-based access
* Complete remediation history

---

## Business Value

* Centralizes audit follow-up
* Improves remediation accountability
* Reduces overdue findings
* Strengthens management visibility
* Preserves closure evidence
* Supports audit committees
* Improves regulatory readiness
* Reduces spreadsheet dependency
* Standardizes closure validation
* Creates an audit-ready history

---

## Future Enhancements

* Power BI audit dashboard
* Teams escalation cards
* Recurring-finding analytics
* Audit-plan integration
* Evidence document library
* Executive risk summary
* Automated audit committee reports
* Microsoft Purview retention
* Control-owner mapping
* Regulatory-obligation linkage

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Internal Audit Governance and Enterprise Automation Portfolio.
