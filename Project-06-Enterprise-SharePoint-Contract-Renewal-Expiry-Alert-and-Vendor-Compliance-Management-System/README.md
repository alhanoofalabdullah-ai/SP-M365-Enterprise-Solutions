# Enterprise SharePoint Contract Renewal, Expiry Alert and Vendor Compliance Management System

Enterprise Microsoft 365 solution for managing contracts, renewal
deadlines, expiry alerts, vendor compliance and audit records using
SharePoint Online and Power Automate.

## Business Problem

Organizations often store contracts in disconnected folders and track
renewal dates manually through spreadsheets or email reminders.

This can result in missed renewal deadlines, unplanned service
interruptions, automatic contract renewals and incomplete compliance
records.

This solution centralizes contract documents and automates expiry
monitoring and renewal notifications.

## Core Features

- Central enterprise contract library
- Contract-number tracking
- Vendor information management
- Assigned contract ownership
- Department classification
- Contract-value tracking
- Start-date and expiry-date monitoring
- Automated 90-day reminders
- Automated 60-day escalations
- Automated 30-day urgent alerts
- Contract renewal-status tracking
- Vendor compliance tracking
- Contract audit log
- Failure notifications
- SharePoint version history

## Technologies

- SharePoint Online
- Microsoft 365
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- PnP PowerShell
- JSON

## Architecture

```text
Contract Document
       |
       v
SharePoint Contract Library
       |
       v
Daily Power Automate Check
       |
       v
Calculate Days Until Expiry
       |
  +----+----+----+
  |         |    |
90 Days  60 Days 30 Days
  |         |    |
Reminder Escalation Urgent Alert
  |         |    |
  +---------+----+
            |
            v
Update Renewal Status
            |
            v
Contract Compliance Log
            |
            v
Notify Contract Owner

---

## Repository Structure

Project-06-Enterprise-SharePoint-Contract-Renewal-Expiry-Alert-and-Vendor-Compliance-Management-System/
├── README.md
├── setup.ps1
├── contract-monitoring-flow.json
├── sample-contract.json
└── .gitignore

---

## SharePoint Components

## Enterprise Contracts

| Column	            | Purpose
| Contract Number	    | Unique contract identifier
| Vendor Name	        | Contracted supplier
| Contract Owner	    | Responsible employee
| Department	        | Business owner
| Start Date	        | Contract commencement
| Expiry Date	        | Contract expiration
| Contract Value	    | Financial value
| Renewal Status	    | Current renewal state
| Compliance Status	  | Vendor compliance condition
| Renewal Notes     	| Review and decision details

---

## Contract Compliance Log

| Column	            | Purpose
| Contract Number	    | Related contract
| Vendor Name	        | Contract supplier
| Compliance Action  	| Reminder, escalation or decision
| Action Owner	      | Responsible employee
| Action Date	        | Event timestamp
| Action Details	    | Compliance notes

---

## Contract Lifecycle

Active
  ↓
Renewal Review
  ↓
Renewal Approved or Renewal Rejected
  ↓
Renewed, Expired or Terminated

---

## Alert Model

| Remaining Period	 | Notification
| 90 days	           | Initial renewal reminder
| 60 days	           | Manager escalation
| 30 days	           | Urgent procurement alert
| 0 days	           | Contract marked as expired

---

## Recommended Power Automate Steps

1. Create a scheduled cloud flow.
2. Run it every day at 8:00 AM.
3. Get files from Enterprise Contracts.
4. Ignore terminated or expired contracts.
5. Calculate the remaining days.
6. Send a reminder at 90 days.
7. Send an escalation at 60 days.
8. Send an urgent warning at 30 days.
9. Mark contracts as expired at zero days.
10. Add every event to Contract Compliance Log.
11. Notify the contract owner.
12. Add a failure-handling scope.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ContractManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

contract-monitoring-flow.json

---

## Suggested SharePoint Views

## Expiring Within 90 Days

Expiry Date is less than or equal to Today + 90 days
Renewal Status is Active

## Renewal Review

Renewal Status = Renewal Review

## Expired Contracts

Renewal Status = Expired

## Non-Compliant Vendors

Compliance Status is not Compliant

---

## Security Model

* Procurement Team: edit all contracts
* Contract Owners: update assigned contracts
* Finance Team: read contract values
* Legal Team: review contract documents
* Auditors: read-only access
* General Employees: restricted access
* Site Owners: full administrative control

---

## Governance Controls

* Unique contract identification
* Central document repository
* Assigned contract accountability
* Automated expiry monitoring
* Recorded renewal decisions
* Vendor-compliance visibility
* Version-controlled documentation
* Restricted contract access
* Complete event history
* Failure notifications

---

## Business Value

* Prevents missed contract renewals
* Reduces unexpected service interruption
* Improves vendor-management visibility
* Creates clear contract ownership
* Supports procurement planning
* Improves compliance reporting
* Reduces spreadsheet dependency
* Creates an audit-ready contract history
* Improves renewal decision timing

---

## Future Enhancements

* Multi-level renewal approval
* Electronic signature integration
* Power BI contract dashboard
* Vendor risk scoring
* Microsoft Purview sensitivity labels
* Contract-obligation tracking
* Budget-owner approval
* Teams adaptive-card reminders
* Microsoft Graph notifications
* Automated contract archive process

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Governance and Enterprise Automation Portfolio.
