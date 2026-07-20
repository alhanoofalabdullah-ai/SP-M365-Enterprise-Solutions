# Enterprise SharePoint Incident Reporting, Investigation and Corrective Action Management System

Enterprise Microsoft 365 solution for reporting incidents, assigning
investigations, identifying root causes and tracking corrective actions
using SharePoint Online and Power Automate.

## Business Problem

Organizations often report incidents through email, paper forms or
spreadsheets. This makes it difficult to maintain consistent records,
assign investigators, monitor corrective actions and demonstrate closure.

This solution centralizes incident records and automates investigation,
escalation and corrective-action tracking.

## Core Features

- Central enterprise incident register
- Automatic incident-number generation
- Reporter and location tracking
- Incident-category classification
- Severity assessment
- Investigator assignment
- Immediate critical-incident escalation
- Root-cause documentation
- Corrective-action register
- Target-date monitoring
- Completion-evidence tracking
- Incident closure validation
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
Incident Report
      |
      v
SharePoint Incident Register
      |
      v
Power Automate Workflow
      |
      +--> Generate Incident Number
      |
      +--> Assign Investigator
      |
      +--> Notify Management
      |
      +--> Escalate Critical Incident
      |
      v
Investigation and Root Cause
      |
      v
Corrective Action Register
      |
      v
Verification and Closure

---

## Repository Structure

Project-15-Enterprise-SharePoint-Incident-Reporting-Investigation-and-Corrective-Action-Management-System/
├── README.md
├── setup.ps1
├── incident-flow.json
├── sample-incident.json
└── .gitignore

---

## SharePoint Components

## Enterprise Incidents

| Column	                    | Purpose
| Incident Number            	| Unique incident identifier
| Reported By	                | Employee submitting the incident
| Incident Category	          | Safety, security, IT or operational
| Severity	                  | Low, Medium, High or Critical
| Incident Date	              | Date and time of occurrence
| Location	                  | Incident location
| Investigator	              | Responsible investigator
| Root Cause	                | Investigation findings
| Incident Status	            | Current lifecycle stage

---

## Corrective Action Register

| Column	                   | Purpose
| Incident Number	           | Related incident
| Corrective Action	         | Required preventive or corrective measure
| Action Owner	             | Responsible employee
| Target Date	               | Required completion date
| Action Status	             | Open, In Progress, Completed or Overdue
| Completion Evidence	       | Evidence reference

---

## Incident Lifecycle

Reported
   ↓
Under Review
   ↓
Investigation
   ↓
Corrective Action
   ↓
Verification
   ↓
Closed

---

## Critical path:

Critical Incident
       ↓
Immediate Escalation
       ↓
Management Notification
       ↓
Urgent Investigation

---

## Recommended Power Automate Steps

1. Trigger when an incident is created.
2. Generate a unique incident number.
3. Set the status to Reported.
4. Assign an investigator by category.
5. Notify safety, security or department managers.
6. Escalate high and critical incidents.
7. Create a corrective-action record.
8. Monitor the action target date.
9. Notify owners of overdue actions.
10. Require completion evidence.
11. Close the incident after verification.
12. Add failure handling.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/IncidentManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

incident-flow.json

---

## Suggested SharePoint Views

## Critical Incidents

Severity = Critical
Incident Status is not Closed

## Active Investigations

Incident Status = Investigation

## Overdue Corrective Actions

Target Date < Today
Action Status is not Completed

## Incidents Pending Closure

Incident Status = Verification

---

## Security Model

* Employees: create incident reports
* Incident Managers: manage all incidents
* Investigators: update assigned investigations
* Action Owners: update assigned corrective actions
* Executives: view critical incidents
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique incident identification
* Standard severity model
* Assigned investigation ownership
* Recorded root-cause analysis
* Corrective-action accountability
* Target-date monitoring
* Completion evidence
* Controlled closure
* Critical-incident escalation
* Role-based access

---

## Business Value

* Standardizes incident reporting
* Improves response time
* Creates clear investigation ownership
* Strengthens corrective-action tracking
* Reduces unresolved incidents
* Supports safety and operational governance
* Improves audit readiness
* Preserves root-cause records
* Creates management visibility
* Reduces spreadsheet dependency

---

## Future Enhancements

* Power Apps mobile incident form
* Photo and evidence upload
* QR-based location reporting
* Power BI incident dashboard
* Teams emergency alerts
* Investigation approval workflow
* Near-miss reporting
* Recurring-incident analysis
* Corrective-action effectiveness scoring
* Microsoft Purview retention integration

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Governance and Enterprise Automation Portfolio.
