# Enterprise SharePoint Executive Portfolio Dashboard, KPI Monitoring and Strategic Performance Management System

Enterprise Microsoft 365 solution for managing strategic objectives,
department KPIs, target performance, executive reviews and corrective
actions using SharePoint Online and Power Automate.

## Business Problem

Executive performance information is often distributed across
spreadsheets, reports, presentations and email updates.

This makes it difficult to maintain one source of truth for strategic
objectives, target achievement, underperforming KPIs and management
decisions.

This solution centralizes enterprise KPI data and automates recurring
performance reviews and executive escalation.

## Core Features

- Central enterprise KPI register
- Unique KPI identification
- Strategic-objective mapping
- KPI-owner accountability
- Department classification
- Target and actual value tracking
- Automated achievement calculation
- Green, Amber and Red status
- Monthly performance monitoring
- Underperformance notifications
- Executive escalation
- Performance-review register
- Corrective-action tracking
- Failure notifications

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Microsoft Outlook
- Microsoft Teams
- Power BI
- PnP PowerShell
- Microsoft 365

## Architecture

```text
Strategic Objective
        |
        v
SharePoint KPI Register
        |
        v
Monthly Power Automate Review
        |
        +--> Calculate Achievement
        |
        +--> Set Performance Status
        |
        +--> Notify KPI Owner
        |
        +--> Escalate Red KPI
        |
        v
Executive Performance Review
        |
        v
Corrective Action and Follow-Up

---

## Repository Structure

Project-20-Enterprise-SharePoint-Executive-Portfolio-Dashboard-KPI-and-Strategic-Performance-Management-System/
├── README.md
├── setup.ps1
├── kpi-monitoring-flow.json
├── sample-kpi.json
└── .gitignore

---

## SharePoint Components

## Enterprise KPI Register

| Column	| Purpose
| KPI ID	| Unique performance identifier
| Strategic Objective	| Related enterprise goal
| KPI Owner	| Accountable manager
| Department	| Responsible business unit
| Target Value	| Planned performance target
| Actual Value	| Reported result
| Performance Status	| Green, Amber, Red or Failed
| Reporting Period	| Monthly, quarterly or annual period
| Next Review Date	| Next performance review

---

## Executive Performance Reviews

| Column	| Purpose
| KPI ID	| Related KPI
| Review Owner	| Executive or performance manager
| Review Date	| Review timestamp
| Executive Decision	| Accepted, Escalated or Action Required
| Management Comments	| Executive observations
| Required Action	| Agreed corrective action

---

## Performance Model

Target Defined
      ↓
Actual Result Submitted
      ↓
Performance Calculated
      ↓
Green, Amber or Red
      ↓
Executive Review
      ↓
Corrective Action

 
