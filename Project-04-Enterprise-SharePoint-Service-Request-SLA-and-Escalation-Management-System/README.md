# Enterprise SharePoint Service Request, SLA and Escalation Management System

Enterprise Microsoft 365 solution for managing internal service requests,
priority-based SLA deadlines, assignments, escalations and resolution
tracking using SharePoint Online and Power Automate.

## Business Problem

Internal service requests are often submitted through email or informal
messages. This makes it difficult to track ownership, deadlines,
priorities, overdue requests and resolution performance.

This solution provides a centralized SharePoint request register with
automated SLA calculation, assignment and escalation.

## Core Features

- Central enterprise service-request list
- Automatic request-number generation
- Requester and department tracking
- Priority classification
- Automatic SLA-deadline calculation
- Service-owner assignment
- Request acknowledgement
- Overdue-request monitoring
- Multi-level escalation support
- Resolution-date tracking
- Escalation audit log
- Requester and manager notifications
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
Employee Request
       |
       v
SharePoint Service Request List
       |
       v
Power Automate Workflow
       |
       +--> Generate Request Number
       |
       +--> Calculate SLA Deadline
       |
       +--> Assign Service Owner
       |
       +--> Notify Requester
       |
       v
SLA Monitoring
       |
   +---+---+
   |       |
On Time  Overdue
   |       |
   |       v
   |   Escalation Log
   |       |
   |       v
   |   Manager Notification
   |
   v
Resolution and Closure

---

## Repository Structure

Project-04-Enterprise-SharePoint-Service-Request-SLA-and-Escalation-Management-System/
├── README.md
├── setup.ps1
├── sla-flow.json
├── sample-request.json
└── .gitignore

---

## SharePoint Components

## Enterprise Service Requests

| Column	          | Purpose
| Request Number	  | Unique service-request identifier
| Requester	        | Employee submitting the request
| Department	      | Requesting business unit
| Request Category	| Type of service requested
| Priority	        | Critical, High, Medium or Low
| Assigned To	      | Responsible service owner
| Request Status	  | Current processing stage
| SLA Deadline	    | Required completion date and time
| Resolution Date	  | Actual completion timestamp
| Resolution Notes	| Final resolution details

---

## SLA Escalation Log

| Column	           | Purpose
| Request Number	   | Related service request
| Escalation Level	 | First, second or executive escalation
| Escalated To	     | Escalation recipient
| Escalation Date	   | Escalation timestamp
| Escalation Reason	 | Cause of escalation

---

## Request Lifecycle

New
 ↓
Open
 ↓
In Progress
 ↓
Resolved
 ↓
Closed

## An overdue request follows:

Open or In Progress
        ↓
SLA Breached
        ↓
Escalated
        ↓
Resolved

---

## SLA Model

| Priority	| Target Resolution
| Critical	| 4 hours
| High	    | 8 hours
| Medium	  | 24 hours
| Low	      | 48 hours

# These values can be changed in: sla-flow.json

---

## Recommended Power Automate Steps

1. Trigger when a service request is created.
2. Generate the request number.
3. Set the request status to Open.
4. Read the selected priority.
5. Calculate the SLA deadline.
6. Assign the request to the correct service owner.
7. Send an acknowledgement to the requester.
8. Create a delayed SLA-monitoring action.
9. Check whether the request is resolved.
10. Escalate overdue requests.
11. Write the escalation event to the log.
12. Notify the assigned owner and manager.
13. Record the resolution date when completed.
14. Notify the requester of closure.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ServiceManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

sla-flow.json

---

## Security Model

* Employees: create requests and view their own submissions
* Service Team: edit assigned requests
* Service Managers: manage escalations and reporting
* Auditors: read-only access
* Site Owners: full administrative control
* General Users: no access to escalation records

---

## Governance Controls

* Unique request identification
* Defined business ownership
* Standard priority classifications
* Measurable SLA deadlines
* Recorded escalation history
* Resolution evidence
* Role-based access
* Controlled request closure
* Failure notifications

---

## Business Value

* Centralizes internal service requests
* Improves response visibility
* Reduces missed requests
* Enforces service-level targets
* Creates clear accountability
* Standardizes escalation handling
* Improves requester communication
* Supports operational reporting
* Strengthens audit readiness

---

## Suggested Views

## My Requests

Requester = [Me]

## Assigned to Me

Assigned To = [Me]

## SLA Breached

- SLA Deadline < Today
- Request Status is not Resolved
- Request Status is not Closed

## Critical Requests

Priority = Critical

---

## Future Enhancements

* Power BI SLA dashboard
* Teams adaptive-card updates
* Multi-level escalation rules
* Automatic department routing
* Service-category configuration list
* Customer-satisfaction survey
* Microsoft Forms request intake
* Microsoft Graph notifications
* Service performance analytics
* Knowledge-base recommendations

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Governance and Enterprise Automation Portfolio.
