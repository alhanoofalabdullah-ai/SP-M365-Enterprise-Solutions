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

##

