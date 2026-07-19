# Enterprise SharePoint Records Retention, Review and Compliance Tracking System

Enterprise Microsoft 365 solution for managing corporate records,
retention schedules, compliance reviews, legal holds and disposal
decisions using SharePoint Online and Power Automate.

## Business Problem

Organizations often retain documents without consistent schedules,
ownership, review dates or disposal controls. This increases storage,
legal, regulatory and operational risk.

This solution provides a centralized records repository with automated
retention reviews and a complete compliance decision log.

## Core Features

- Central corporate records library
- Record-category classification
- Record-owner assignment
- Retention-period tracking
- Automated review-date monitoring
- Scheduled compliance reviews
- Retention-extension decisions
- Controlled disposal approvals
- Legal-hold management
- Compliance audit log
- Record-owner notifications
- Failure handling
- Version-history support

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
Corporate Record
       |
       v
SharePoint Records Library
       |
       v
Scheduled Power Automate Flow
       |
       v
Retention Review Date Check
       |
       v
Compliance Approval
       |
  +----+-----+------------+
  |          |            |
Extend    Disposal     Legal Hold
  |          |            |
  +----------+------------+
             |
             v
Update Record Metadata
             |
             v
Retention Review Log
             |
             v
Email Notification

---

## Repository Structure

Project-02-Enterprise-SharePoint-Records-Retention-and-Compliance-Tracking-System/
├── README.md
├── setup.ps1
├── retention-flow.json
├── sample-records.json
├── .gitignore
└── docs/
    └── deployment-guide.md

---

## SharePoint Components

## Corporate Records

| Column	              | Type	            | Purpose
| Record Category	       | Choice	     | Business classification
| Record Owner	       | Person	     | Accountable business owner
| Retention Period Years    | Number	     | Required retention duration
| Retention Start Date      | Date	            | Retention calculation start
| Retention Review Date     | Date	            | Next compliance review
| Retention Status	       | Choice	     | Current lifecycle status
| Legal Hold Reference	| Text	            | Legal case or hold identifier
| Compliance Notes	       | Multiple lines   | Review

---

## Retention Review Log

| Column	       | Type	           | Purpose
| Record Name	       | Text	           | Reviewed record
| Record URL	       | Hyperlink	    | SharePoint record location
| Review Action      | Choice	    | Compliance decision
| Reviewed By	       | Person	    | Decision maker
| Review Date	       | Date and Time   | Decision timestamp
| Decision Comments	| Multiple lines  | Decision explanation

---
## Record Lifecycle

Active
  |
  v
Review Due
  |
  +--> Extended
  |
  +--> Eligible for Disposal
  |
  +--> Legal Hold
  |
  v
Disposed

---

## Governance Controls

* Standardized record categories
* Mandatory retention dates
* Assigned business ownership
* Compliance-controlled decisions
* Legal-hold protection
* Recorded decision history
* Restricted disposal process
* Automated review reminders
* Audit-ready reporting

---
## Deployment

docs/deployment-guide.md

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/RecordsManagement" `
  -ClientId "YOUR-CLIENT-ID"

---
## Business Value

* Reduces unmanaged record accumulation
* Improves compliance visibility
* Standardizes retention decisions
* Protects records under legal hold
* Creates defensible disposal records
* Improves audit readiness
* Assigns clear record ownership
* Reduces manual compliance tracking

---

## Future Enhancements

* Microsoft Purview retention labels
* Automated retention-label publishing
* Power BI compliance dashboard
* Teams compliance notifications
* Multi-stage disposal approvals
* Electronic disposition certificates
* Legal case integration
* Microsoft Graph reporting
* Regulatory-rule mapping

---

Author

Alhanoof Alabdullah

Microsoft 365, SharePoint, Governance and Enterprise Automation Portfolio.
