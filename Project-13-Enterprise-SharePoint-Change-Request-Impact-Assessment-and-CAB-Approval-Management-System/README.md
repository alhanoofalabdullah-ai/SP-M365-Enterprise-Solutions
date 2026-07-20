# Enterprise SharePoint Change Request, Impact Assessment and CAB Approval Management System

Enterprise Microsoft 365 solution for managing technology and business
change requests, impact assessments, risk classification, CAB approvals
and implementation decisions using SharePoint Online and Power Automate.

## Business Problem

Organizations often manage changes through email, spreadsheets and
informal meetings. This makes it difficult to track risk, ownership,
approval decisions, implementation dates and rollback plans.

This solution centralizes change records and automates approval routing
based on change type and risk level.

## Core Features

- Central enterprise change register
- Automatic change-number generation
- Requester and change-owner tracking
- Standard, normal and emergency classification
- Risk-level assessment
- Business-impact recording
- Implementation-date tracking
- Rollback-plan documentation
- CAB approval routing
- Approval and rejection decisions
- CAB decision log
- Stakeholder notifications
- Failure handling

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
Change Request
      |
      v
SharePoint Change Register
      |
      v
Power Automate Workflow
      |
      v
Impact and Risk Assessment
      |
   +--+-------------+
   |                |
Low-Risk        High-Risk
   |                |
Change Manager     CAB
Approval          Approval
   |                |
   +--------+-------+
            |
            v
Update Change Status
            |
            v
CAB Decision Log
            |
            v
Stakeholder Notification

---

## Repository Structure

Project-13-Enterprise-SharePoint-Change-Request-Impact-Assessment-and-CAB-Approval-Management-System/
├── README.md
├── setup.ps1
├── change-approval-flow.json
├── sample-change.json
└── .gitignore

---

## SharePoint Components

## Enterprise Change Requests

| Column	               | Purpose
| Change Number	         | Unique change identifier
| Requested By	         | Change requester
| Change Owner	         | Responsible coordinator
| Change Type	         | Standard, Normal or Emergency
| Risk Level	         | Low, Medium, High or Critical
| Business Impact	         | Expected operational effect
| Implementation Date      | Planned change window
| Rollback Plan	         | Recovery procedure
| Change Status	         | Current workflow stage

---

## CAB Decision Log

| Column	               | Purpose
| Change Number	         | Related change request
| Decision	               | Approved, Rejected or Deferred
| Decision By	         | CAB or change manager
| Decision Date	         | Decision timestamp
| Decision Comments	   | Rationale and conditions

---

## Change Lifecycle

Draft
  ↓
Impact Assessment
  ↓
Pending Approval
  ↓
Approved or Rejected
  ↓
Scheduled
  ↓
Implemented
  ↓
Reviewed
  ↓
Closed

---

## Emergency path:

Emergency Request
       ↓
Expedited Approval
       ↓
Implementation
       ↓
Post-Implementation Review

---

## Approval Model

| Change Type or Risk	    | Approval Route
| Standard and Low Risk	    | Change Manager
| Normal and Medium Risk    | Service Owner and Change Manager
| High or Critical Risk	    | Change Advisory Board
| Emergency	                | Emergency CAB

---

## Recommended Power Automate Steps

1. Trigger when a change request is created.
2. Generate a unique change number.
3. Set status to Impact Assessment.
4. Read change type and risk level.
5. Route low-risk changes to the change manager.
6. Route high-risk changes to CAB approval.
7. Record the decision and comments.
8. Update the request status.
9. Create a CAB decision-log item.
10. Notify the requester and implementation team.
11. Add a failure-handling branch.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ChangeManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

change-approval-flow.json

---

## Suggested SharePoint Views

## Pending CAB Review

Change Status = Pending Approval
Risk Level = High or Critical

## Scheduled Changes

Change Status = Scheduled

## Emergency Changes

Change Type = Emergency

## Changes This Month

Implementation Date is within the current month

## Rejected Changes

Change Status = Rejected

---

## Security Model

* Employees and Service Owners: create change requests
* Change Managers: manage assessments and approvals
* CAB Members: review high-risk changes
* Implementation Teams: update approved changes
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique change identification
* Assigned change ownership
* Standard change classification
* Documented impact assessment
* Risk-based approval routing
* Mandatory rollback planning
* Recorded CAB decisions
* Controlled implementation status
* Post-implementation review
* Role-based access

---

## Business Value

* Standardizes change-management processes
* Improves visibility of planned changes
* Reduces unapproved implementations
* Strengthens risk controls
* Preserves CAB decisions
* Improves rollback readiness
* Reduces email-based coordination
* Supports IT governance and audit requirements
* Creates clear accountability
* Improves implementation planning

---

## Future Enhancements

* Power Apps change-request portal
* Power BI change dashboard
* Teams adaptive-card CAB approvals
* Automated conflict detection
* Maintenance-window calendar integration
* Change-success rate reporting
* Incident linkage
* Configuration-item integration
* Emergency-change analytics
* Post-implementation review automation

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, IT Governance and Enterprise Automation Portfolio.
