# Enterprise SharePoint Business Continuity, Disaster Recovery and Critical Service Readiness Management System

Enterprise Microsoft 365 solution for managing critical business
services, recovery objectives, continuity exercises, disaster-recovery
readiness and corrective actions using SharePoint Online and Power
Automate.

## Business Problem

Business continuity and disaster-recovery information is often stored
in spreadsheets, separate documents and email threads.

This makes it difficult to identify overdue exercises, track recovery
objectives, confirm service readiness and monitor corrective actions.

This solution centralizes continuity information and automates exercise
scheduling, reminders, escalation and readiness reporting.

## Core Features

- Central critical-service register
- Unique service identification
- Service-owner assignment
- Business-criticality classification
- Recovery Time Objective tracking
- Recovery Point Objective tracking
- Recovery-site documentation
- Continuity-exercise scheduling
- Readiness-status tracking
- Exercise-result recording
- Failed-test escalation
- Corrective-action follow-up
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
Critical Business Service
          |
          v
SharePoint Service Register
          |
          v
Weekly Power Automate Review
          |
          +--> Check Next Test Date
          |
          +--> Notify Service Owner
          |
          +--> Create Exercise Record
          |
          +--> Evaluate Test Result
          |
          +--> Escalate Failed Tests
          |
          v
Update Readiness Status

---

## Repository Structure

Project-18-Enterprise-SharePoint-Business-Continuity-Disaster-Recovery-and-Critical-Service-Readiness-Management-System/
├── README.md
├── setup.ps1
├── continuity-flow.json
├── sample-service.json
└── .gitignore

---
