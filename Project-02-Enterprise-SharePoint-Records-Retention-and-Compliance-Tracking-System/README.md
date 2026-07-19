# Enterprise SharePoint Records Retention, Review and Compliance Tracking System

Enterprise Microsoft 365 solution for managing corporate records,
retention schedules, compliance reviews, legal holds and disposal
decisions using SharePoint Online and Power Automate.

## Business Problem

Organizations often retain documents without consistent schedules,
ownership, review dates or disposal controls. This increases storage,
legal, regulatory and operational risk.

This solution provides a centralized records repository with automated
retention reviews and a complete compliance decision log.

## Core Features

- Central corporate records library
- Record-category classification
- Record-owner assignment
- Retention-period tracking
- Automated review-date monitoring
- Scheduled compliance reviews
- Retention-extension decisions
- Controlled disposal approvals
- Legal-hold management
- Compliance audit log
- Record-owner notifications
- Failure handling
- Version-history support

## Technologies

- SharePoint Online
- Microsoft 365
- Power Automate
- Microsoft Lists
- Microsoft Outlook
- PnP PowerShell
- JSON
- PowerShell

## Architecture

```text
Corporate Record
       |
       v
SharePoint Records Library
       |
       v
Scheduled Power Automate Flow
       |
       v
Retention Review Date Check
       |
       v
Compliance Approval
       |
  +----+-----+------------+
  |          |            |
Extend    Disposal     Legal Hold
  |          |            |
  +----------+------------+
             |
             v
Update Record Metadata
             |
             v
Retention Review Log
             |
             v
Email Notification

---

## Repository Structure

Project-02-Enterprise-SharePoint-Records-Retention-and-Compliance-Tracking-System/
├── README.md
├── setup.ps1
├── retention-flow.json
├── sample-records.json
├── .gitignore
└── docs/
    └── deployment-guide.md

---

## SharePoint Components

## Corporate Records

| Column	                 | Type	            | Purpose
| Record Category	         | Choice	          | Business classification
| Record Owner	           | Person	          | Accountable business owner
| Retention Period Years	 | Number	          | Required retention duration
| Retention Start Date	   | Date	            | Retention calculation start
| Retention Review Date	   | Date	            | Next compliance review
| Retention Status	       | Choice	          | Current lifecycle status
| Legal Hold Reference	   | Text	            | Legal case or hold identifier
| Compliance Notes	       | Multiple lines	  | Review

---
## Retention Review Log

