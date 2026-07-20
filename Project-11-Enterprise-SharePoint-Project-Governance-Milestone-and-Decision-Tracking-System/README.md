# Enterprise SharePoint Project Governance, Milestone and Decision Tracking System

Enterprise Microsoft 365 solution for managing project governance,
milestones, health status, executive reviews and decision records using
SharePoint Online and Power Automate.

## Business Problem

Large organizations often manage project status through separate
spreadsheets, email updates and presentation decks.

This makes it difficult to maintain one source of truth for milestones,
project health, executive decisions and governance reviews.

This solution centralizes project information and automates governance
notifications and escalations.

## Core Features

- Central enterprise project register
- Project-manager and sponsor assignment
- Department classification
- Project milestone tracking
- Completion-percentage monitoring
- Green, Amber and Red health status
- Scheduled governance reviews
- Sponsor escalation for red projects
- Executive decision log
- Next-review-date tracking
- PMO notifications
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
Project Registration
        |
        v
SharePoint Enterprise Projects List
        |
        v
Weekly Power Automate Review
        |
        +--> Check Milestone
        |
        +--> Check Completion
        |
        +--> Check Health Status
        |
        +--> Notify Project Manager
        |
        +--> Escalate Red Projects
        |
        v
Project Decision Log

---

## Repository Structure

Project-11-Enterprise-SharePoint-Project-Governance-Milestone-and-Decision-Tracking-System/
├── README.md
├── setup.ps1
├── governance-flow.json
├── sample-project.json
└── .gitignore

---

## SharePoint Components

## Enterprise Projects

| Column	              | Purpose
| Project ID	          | Unique project identifier
| Project Manager	      | Responsible manager
| Project Sponsor	      | Executive owner
| Department	          | Business area
| Start Date	          | Project commencement
| Target End Date     	| Planned completion
| Current Milestone	    | Current delivery stage
| Health Status	        | Green, Amber or Red
| Completion Percent	  | Delivery progress
| Next Review Date	    | Governance-review date

---

## Project Decision Log

| Column	              | Purpose
| Project ID	          | Related project
| Decision Title	      | Governance decision
| Decision Owner	      | Accountable approver
| Decision Date	        | Decision timestamp
| Decision Status	      | Proposed, Approved or Rejected
| Decision Details	    | Rationale and actions

---

## Project Lifecycle

Proposed
   ↓
Approved
   ↓
Active
   ↓
On Hold or Completed
   ↓
Closed

---

## Health Model

| Status	       | Meaning
| Green	         | On schedule and within scope
| Amber	         | Requires management attention
| Red	           | Critical issue or major delay
| On Hold	       | Temporarily suspended
| Completed	     | Delivery finished

---

## Recommended Power Automate Steps

1. Create a scheduled weekly flow.
2. Read active projects.
3. Filter projects with a review date due.
4. Check milestone progress.
5. Check completion percentage.
6. Evaluate project health.
7. Notify the project manager.
8. Escalate red projects to the sponsor.
9. Create a decision-log item.
10. Update the next governance-review date.
11. Add a failure-handling branch.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ProjectGovernance" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

governance-flow.json

---

## Suggested SharePoint Views

## Red Projects

Health Status = Red

## Governance Review Due

Next Review Date <= Today

## Active Projects

Health Status is not Completed

## Near Completion

Completion Percent >= 80

---

## Security Model

* PMO Team: full management access
* Project Managers: edit assigned projects
* Sponsors: review and approve decisions
* Department Leaders: read department projects
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique project identification
* Assigned project accountability
* Defined executive sponsorship
* Standard health-status model
* Scheduled review cycle
* Escalation of critical projects
* Documented executive decisions
* Progress tracking
* Role-based access
* Audit-ready project history

---

## Business Value

* Creates one source of truth
* Improves executive visibility
* Standardizes project governance
* Highlights critical projects quickly
* Strengthens sponsor accountability
* Reduces spreadsheet dependency
* Preserves project decisions
* Improves PMO reporting
* Supports portfolio governance

---

## Future Enhancements

* Power BI portfolio dashboard
* Project heat map
* Teams adaptive-card reviews
* Budget and cost tracking
* Project dependency register
* RAID log integration
* Stage-gate approvals
* Microsoft Planner integration
* Portfolio prioritization scoring
* Microsoft Graph reporting

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, PMO Governance and Enterprise Automation Portfolio.
