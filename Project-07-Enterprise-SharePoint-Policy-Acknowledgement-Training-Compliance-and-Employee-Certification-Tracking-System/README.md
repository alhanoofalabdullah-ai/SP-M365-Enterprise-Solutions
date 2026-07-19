# Enterprise SharePoint Policy Acknowledgement, Training Compliance and Employee Certification Tracking System

Enterprise Microsoft 365 solution for distributing corporate policies,
collecting employee acknowledgements, tracking mandatory training and
recording certification evidence.

## Business Problem

Organizations often distribute policies through email and rely on
spreadsheets to confirm whether employees have read required documents
or completed mandatory training.

This creates incomplete evidence, inconsistent reminders and limited
visibility into overdue compliance obligations.

This solution centralizes policies in SharePoint and automates employee
acknowledgement, training tracking, reminders and escalation.

## Core Features

- Central corporate policy library
- Policy-number and ownership metadata
- Effective-date and review-date tracking
- Employee policy assignments
- Acknowledgement-status tracking
- Mandatory-training status
- Due-date monitoring
- Automated reminders
- Manager escalation
- Certification-reference storage
- Compliance notes
- SharePoint version history
- Failure notifications

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- Microsoft Planner
- PnP PowerShell
- JSON
- Microsoft 365

## Architecture

```text
Corporate Policy
      |
      v
SharePoint Policy Library
      |
      v
Compliance Assignment List
      |
      v
Power Automate Workflow
      |
      +--> Send Policy Link
      |
      +--> Request Acknowledgement
      |
      +--> Create Training Task
      |
      +--> Send Reminder
      |
      +--> Escalate Overdue Item
      |
      v
Update Compliance Record

---

## Repository Structure

Project-07-Enterprise-SharePoint-Policy-Acknowledgement-Training-Compliance-and-Employee-Certification-Tracking-System/
├── README.md
├── setup.ps1
├── compliance-flow.json
├── sample-assignment.json
└── .gitignore

---

## SharePoint Components

## Corporate Policies

| Column	           | Purpose
| Policy Number	     | Unique policy identifier
| Policy Owner	     | Responsible business owner
| Department	       | Policy-owning department
| Effective Date	   | Date policy becomes active
| Review Date	       | Next scheduled policy review
| Policy Status	     | Draft, Active, Archived or Retired

---

## Policy Compliance Assignments

| Column	                   | Purpose
| Policy Number	             | Related corporate policy
| Assigned Employee	         | Employee required to comply
| Assigned Department	       | Employee department
| Due Date	                 | Required completion date
| Acknowledgement Status     | Reading and acknowledgement state
| Acknowledgement Date	     | Employee confirmation timestamp
| Training Status	           | Mandatory-learning progress
| Certificate Reference	     | Completion evidence
| Compliance Notes	         | Exceptions and escalation details

---

## Compliance Lifecycle

Assigned
   ↓
Pending
   ↓
Acknowledged
   ↓
Training Completed
   ↓
Compliant

---

## Overdue path:

Pending
   ↓
Reminder
   ↓
Overdue
   ↓
Manager Escalation

---

## Recommended Power Automate Steps

1. Trigger when a compliance assignment is created.
2. Set acknowledgement status to Pending.
3. Send the employee the policy link.
4. Create a Microsoft Planner training task.
5. Schedule a reminder before the due date.
6. Check acknowledgement and training completion.
7. Escalate overdue assignments to the manager.
8. Save the acknowledgement date.
9. Save the training certificate reference.
10. Update compliance notes.
11. Configure a failure-handling branch.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ComplianceManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

compliance-flow.json


----

## Suggested SharePoint Views

## Pending Acknowledgements

Acknowledgement Status = Pending

## Overdue Assignments

Due Date < Today
Acknowledgement Status is not Acknowledged

## Training Incomplete

Training Status is not Completed

## Fully Compliant

Acknowledgement Status = Acknowledged
Training Status = Completed

---

## Security Model

* Compliance Team: full management access
* Policy Owners: manage assigned policies
* Managers: view assignments for their teams
* Employees: view and update their own assignments
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique policy identification
* Controlled policy versions
* Assigned policy ownership
* Recorded employee acknowledgement
* Training-completion evidence
* Due-date monitoring
* Manager escalation
* Complete compliance history
* Role-based access
* Failure tracking

---

## Business Value

* Improves policy-compliance visibility
* Reduces manual reminder effort
* Creates audit-ready acknowledgement evidence
* Tracks mandatory employee training
* Standardizes compliance assignments
* Identifies overdue employees quickly
* Improves manager accountability
* Reduces spreadsheet dependency
* Supports regulatory and internal audits

---

## Future Enhancements

* Microsoft Forms acknowledgement page
* Power Apps employee compliance portal
* Power BI compliance dashboard
* Adaptive Cards in Microsoft Teams
* Microsoft Viva Learning integration
* Automated department-based assignment
* Policy quiz and assessment
* Certificate-file upload
* Microsoft Purview integration
* Annual policy re-certification

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Governance and Enterprise Automation Portfolio.
