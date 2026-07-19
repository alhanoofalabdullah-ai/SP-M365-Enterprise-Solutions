# Enterprise SharePoint Risk Register, Issue Management and Mitigation Tracking System

Enterprise Microsoft 365 solution for identifying, monitoring and
managing organizational risks using SharePoint Online and Power Automate.

---

## Business Problem

Many organizations maintain risks in Excel spreadsheets, making it
difficult to monitor ownership, review dates and mitigation activities.

This solution centralizes enterprise risks in SharePoint and automates
notifications and review reminders.

---

## Features

- Enterprise Risk Register
- Risk Categorization
- Risk Owner Assignment
- Probability & Impact Tracking
- Risk Score Monitoring
- Mitigation Plan Tracking
- Scheduled Reviews
- Automatic Notifications
- Critical Risk Escalation
- Audit History

---

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- PnP PowerShell

---

## Architecture

```text
Risk Identification
        │
        ▼
SharePoint Risk Register
        │
        ▼
Daily Power Automate Flow
        │
 ┌──────┼─────────┐
 │      │         │
 ▼      ▼         ▼
Score Notify Escalate
Risk Owner Critical
 │
 ▼
Risk Review

---

## SharePoint Columns

| Column	            | Purpose
| Risk ID	            | Unique identifier
| Risk Title	        | Risk description
| Category	          | Business category
| Owner	              | Risk owner
| Probability	        | Likelihood
| Impact	            | Business impact
| Risk Score	        | Calculated score
| Mitigation Plan	    | Action plan
| Review Date	        | Next review
| Status	            | Current state

---

## Risk Lifecycle

Identified
     ↓
Open
     ↓
Monitoring
     ↓
Mitigated
     ↓
Closed

---

## Suggested Views

## High Risks

Risk Score >= 20

## Open Risks

Status = Open

## Due for Review

Review Date <= Today

## Closed Risks

Status = Closed

---

## Business Value

* Centralized enterprise risk register
* Better governance
* Automatic review reminders
* Improved ownership
* Faster escalation
* Audit-ready reporting
* Reduced manual tracking
* Better executive visibility

⸻

## Future Enhancements

* Power BI Risk Dashboard
* Heat Map Visualization
* AI Risk Prediction
* Power Apps Mobile Risk App
* Microsoft Teams Alerts
* Risk Approval Workflow
* Executive Dashboard
* Microsoft Purview Integration

⸻

Author

Alhanoof Alabdullah

Microsoft 365 | SharePoint | Enterprise Solutions
