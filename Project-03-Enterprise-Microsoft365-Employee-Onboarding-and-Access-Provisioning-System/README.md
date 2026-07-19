# Enterprise Microsoft 365 Employee Onboarding and Access Provisioning System

Enterprise onboarding automation solution built with SharePoint Online,
Microsoft Lists, Power Automate, Microsoft Teams, Outlook and Microsoft
365 Groups.

## Business Problem

Employee onboarding often requires manual coordination between Human
Resources, IT, managers and department administrators.

Manual processes can delay account access, document preparation,
task assignment and employee communication.

This solution centralizes onboarding requests and automates the main
provisioning activities.

## Features

- Central employee onboarding list
- Employee metadata management
- Automated onboarding workflow
- Employee document-folder creation
- Department access provisioning
- Microsoft 365 group assignment
- Microsoft Planner task creation
- Outlook welcome email
- Microsoft Teams announcement
- Provisioning-status tracking
- Failure notifications
- Version-controlled document library

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Teams
- Microsoft Outlook
- Microsoft Planner
- Microsoft 365 Groups
- PnP PowerShell
- JSON

## Architecture

```text
HR Onboarding Request
        |
        v
SharePoint Employee Onboarding List
        |
        v
Power Automate Workflow
        |
        +--> Create Employee Folder
        |
        +--> Assign Department Access
        |
        +--> Add Microsoft 365 Group
        |
        +--> Create Planner Tasks
        |
        +--> Send Outlook Email
        |
        +--> Post Teams Announcement
        |
        v
Update Provisioning Status

---

## Repository Structure

Project-03-Enterprise-Microsoft365-Employee-Onboarding-and-Access-Provisioning-System/
├── README.md
├── setup.ps1
├── onboarding-flow.json
├── sample-employee.json
└── .gitignore

---

## SharePoint Components

## Employee Onboarding List

| Column	             | Purpose
| Employee ID	         | Unique employee identifier
| Employee Name	       | Employee full name
| Employee Email	     | Microsoft 365 account
| Department	         | Assigned department
| Manager	             | Reporting manager
| Job Title	           | Employee position
| Start Date	         | Employment start date
| Provisioning Status	 | Current onboarding state
| Provisioning Notes	 | Processing information

---

## Employee Documents Library

| Column	       | Purpose
| Employee ID	   | Links documents to employee
| Department	   | Business department
| Document Type	 | Contract, policy or identification

---

## Workflow Statuses

Pending
  ↓
In Progress
  ↓
Completed

or

Failed

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/EmployeeOnboarding" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create an automated Power Automate flow using the design documented in:

onboarding-flow.json

---

## Recommended Power Automate Steps

1. Trigger when an onboarding item is created.
2. Update the status to In Progress.
3. Validate the employee email and manager.
4. Create a folder using the employee ID.
5. Apply folder permissions.
6. Add the employee to the department group.
7. Create onboarding Planner tasks.
8. Send the welcome email.
9. publish the Teams welcome message.
10. Update the status to Completed.
11. Configure a failure-handling scope.

---

## Security Model

* HR Team: create and edit onboarding requests
* IT Team: manage provisioning
* Managers: view assigned employee requests
* Employees: access only their own folder
* Auditors: read-only access
* Site Owners: full administrative control

---

## Business Value

* Reduces onboarding delays
* Standardizes employee provisioning
* Improves coordination between HR and IT
* Reduces manual processing errors
* Creates clear provisioning visibility
* Improves new-employee experience
* Supports governance and audit requirements

---

## Future Enhancements

* Microsoft Graph account provisioning
* Entra ID group automation
* License assignment
* Equipment-request workflow
* Power BI onboarding dashboard
* Offboarding automation
* Microsoft Forms onboarding intake
* Approval before access provisioning

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Governance and Enterprise Automation Portfolio.
