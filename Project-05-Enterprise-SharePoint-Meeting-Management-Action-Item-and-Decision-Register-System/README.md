# Enterprise SharePoint Meeting Management, Action Item and Decision Register System

Enterprise Microsoft 365 solution for managing meetings, action items,
owners, due dates, decisions and governance follow-up using SharePoint
Online and Power Automate.

## Business Problem

Organizations often record meeting outcomes in email, Word documents or
separate spreadsheets.

This makes it difficult to track actions, owners, due dates, decisions
and overdue commitments.

This solution centralizes meeting governance and automates action
reminders and escalation.

## Core Features

- Central enterprise meeting register
- Automatic meeting-number generation
- Meeting-owner assignment
- Department and meeting-type classification
- Attendee tracking
- Meeting-status monitoring
- Action-item register
- Action-owner assignment
- Due-date reminders
- Overdue-action escalation
- Decision register
- Meeting closure control
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
Meeting Record
      |
      v
SharePoint Meeting Register
      |
      v
Power Automate Workflow
      |
      +--> Send Meeting Summary
      |
      +--> Create Action Items
      |
      +--> Assign Owners
      |
      +--> Create Decisions
      |
      +--> Send Due-Date Reminders
      |
      +--> Escalate Overdue Actions
      |
      v
Close Meeting

---

## Repository Structure

Project-05-Enterprise-SharePoint-Meeting-Management-Action-Item-and-Decision-Register-System/
├── README.md
├── setup.ps1
├── meeting-flow.json
├── sample-meeting.json
└── .gitignore

---

## SharePoint Components

## Enterprise Meetings

| Column	         | Purpose
| Meeting Number	 | Unique meeting identifier
| Meeting Date	   | Scheduled meeting date
| Meeting Owner	   | Responsible coordinator
| Department	     | Business area
| Meeting Type	   | Steering, operational or project meeting
| Attendees	       | Meeting participants
| Meeting Status	 | Current meeting stage

---

## Meeting Action Register

| Column	          | Purpose
| Meeting Number  	| Related meeting
| Action Item	      | Required follow-up activity
| Action Owner	    | Responsible person
| Due Date	        | Required completion date
| Action Status	    | Open, In Progress, Completed or Overdue

---

## Meeting Decision Register

| Column	           | Purpose
| Meeting Number	   | Related meeting
| Decision Title	   | Short decision summary
| Decision Owner	   | Accountable owner
| Decision Date	     | Decision timestamp
| Decision Details	 | Full decision record

---

## Meeting Lifecycle

Scheduled
   ↓
Completed
   ↓
Actions Open
   ↓
All Actions Completed
   ↓
Closed

---

## Recommended Power Automate Steps

1. Trigger when a meeting record is created.
2. Generate a unique meeting number.
3. Send the meeting summary to attendees.
4. Create action-item records.
5. Assign owners and due dates.
6. Create decision-register records.
7. Send reminders before action due dates.
8. Escalate overdue actions.
9. Check whether all actions are complete.
10. Close the meeting.
11. Add failure handling.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/MeetingGovernance" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

meeting-flow.json

---

## Suggested SharePoint Views

## Upcoming Meetings

Meeting Date >= Today
Meeting Status = Scheduled

## Open Actions

Action Status = Open or In Progress

## Overdue Actions

Due Date < Today
Action Status is not Completed

## Decisions by Meeting

## Group by:

Meeting Number

## My Actions

Action Owner = [Me]

---

## Security Model

* Meeting Owners: manage assigned meetings
* Action Owners: update assigned actions
* PMO or Governance Team: full management access
* Attendees: read meeting records
* Executives: read decisions and overdue actions
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique meeting identification
* Assigned meeting ownership
* Recorded attendees
* Action-owner accountability
* Defined due dates
* Automated reminders
* Overdue escalation
* Formal decision records
* Controlled meeting closure
* Audit-ready history

---

## Business Value

* Centralizes meeting outcomes
* Reduces lost action items
* Improves owner accountability
* Preserves decision history
* Increases governance visibility
* Reduces email dependency
* Improves PMO follow-up
* Highlights overdue commitments
* Standardizes meeting records
* Supports audit and executive reporting

---

## Future Enhancements

* Microsoft Teams meeting integration
* Meeting-minutes document library
* Planner task synchronization
* Power BI action dashboard
* Teams adaptive-card reminders
* Recurring meeting templates
* Automated minutes generation
* Attendance analytics
* Action aging reports
* Microsoft Graph calendar integration

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, PMO Governance and Enterprise Automation Portfolio.
