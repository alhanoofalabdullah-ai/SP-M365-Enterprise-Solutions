# Enterprise SharePoint Regulatory Obligation, Compliance Evidence and Control Monitoring System

Enterprise Microsoft 365 solution for managing regulatory obligations,
control ownership, compliance evidence, review schedules and remediation
activities using SharePoint Online and Power Automate.

## Business Problem

Regulatory obligations are often tracked through spreadsheets, emails
and disconnected evidence folders.

This makes it difficult to confirm ownership, review dates, control
performance, evidence completeness and remediation status.

This solution centralizes regulatory requirements and automates
compliance-review and evidence-monitoring activities.

## Core Features

- Central regulatory-obligation register
- Unique obligation identification
- Regulator and requirement tracking
- Control-owner assignment
- Control-frequency classification
- Review-date monitoring
- Compliance-status tracking
- Risk-rating visibility
- Compliance-evidence library
- Evidence-owner assignment
- Evidence-period tracking
- High-risk escalation
- Remediation-plan monitoring
- Version-controlled evidence

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
Regulatory Obligation
         |
         v
SharePoint Obligation Register
         |
         v
Weekly Power Automate Review
         |
         +--> Check Review Date
         |
         +--> Notify Control Owner
         |
         +--> Request Evidence
         |
         +--> Evaluate Compliance
         |
         +--> Escalate High-Risk Gaps
         |
         v
Compliance Evidence Library
         |
         v
Remediation and Revalidation

---

## Repository Structure

Project-19-Enterprise-SharePoint-Regulatory-Obligation-Compliance-Evidence-and-Control-Monitoring-System/
├── README.md
├── setup.ps1
├── compliance-monitoring-flow.json
├── sample-obligation.json
└── .gitignore

---

## SharePoint Components

## Regulatory Obligations

| Column	                   | Purpose
| Obligation ID	          | Unique compliance identifier
| Regulator	          | Issuing authority
| Requirement Title      	 | Regulatory requirement
| Control Owner	          | Accountable employee
| Control Frequency	 | Monthly, Quarterly, Annual or Event-Based
| Next Review Date	 | Required control-review date
| Compliance Status	 | Current compliance condition
| Risk Rating	          | Low, Medium, High or Critical
| Remediation Plan	 | Required corrective action

---

## Compliance Evidence

| Column	             | Purpose
| Obligation ID	    | Related regulatory obligation
| Evidence Owner	    | Accountable evidence provider
| Evidence Period	    | Reporting or control period
| Evidence Status	    | Draft, Submitted, Accepted or Rejected
| Review Date         | Evidence-review timestamp

---

## Compliance Lifecycle

Registered
    ↓
Review Due
    ↓
Evidence Pending
    ↓
Compliant or Action Required
    ↓
Remediation
    ↓
Revalidated

---

## Non-compliance path:

Action Required
      ↓
Non-Compliant
      ↓
Management Escalation
      ↓
Remediation Plan
      ↓
Reassessment

---

## Recommended Power Automate Steps

1. Create a weekly scheduled flow.
2. Read obligations whose review date is due.
3. Notify the control owner.
4. Request current compliance evidence.
5. Check the evidence submission status.
6. Set the obligation to Compliant when accepted.
7. Set the obligation to Action Required when evidence is missing.
8. Escalate overdue high-risk obligations.
9. Create a remediation follow-up.
10. Update the next review date.
11. Add failure handling.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ComplianceGovernance" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

compliance-monitoring-flow.json

---

## Suggested SharePoint Views

## Reviews Due

Next Review Date <= Today
Compliance Status is not Compliant

## Evidence Pending

Compliance Status = Evidence Pending

## High-Risk Obligations

Risk Rating = High or Critical

## Non-Compliant Requirements

Compliance Status = Non-Compliant

## Remediation Required

Compliance Status = Action Required

---

## Security Model

* Compliance Team: full management access
* Control Owners: update assigned obligations
* Evidence Owners: upload and maintain evidence
* Risk Team: review high-risk obligations
* Executives: view material compliance gaps
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique obligation identification
* Assigned control ownership
* Defined review frequency
* Mandatory evidence collection
* Risk-based escalation
* Remediation-plan tracking
* Version-controlled evidence
* Scheduled revalidation
* Role-based access
* Audit-ready compliance history

---

## Business Value

* Centralizes regulatory obligations
* Improves compliance visibility
* Creates clear control ownership
* Reduces missed reviews
* Preserves compliance evidence
* Strengthens remediation tracking
* Supports regulatory inspections
* Improves executive reporting
* Reduces spreadsheet dependency
* Creates an audit-ready compliance repository

---

## Future Enhancements

* Power BI compliance dashboard
* Microsoft Purview retention labels
* Automated regulator reporting
* Control-testing calendar
* Teams adaptive-card reviews
* Regulatory-change register
* Policy-to-obligation mapping
* Audit-finding integration
* Compliance maturity scoring
* Microsoft Graph evidence discovery

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Compliance Governance and Enterprise Automation Portfolio.
