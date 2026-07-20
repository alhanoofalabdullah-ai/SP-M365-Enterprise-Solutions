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

 ---

## Status Rules

| Status | Achievement
| Green	| 90% or higher
| Amber	| 70%–89%
| Red	| Below 70%

## Achievement can be calculated as:

Actual Value ÷ Target Value × 100

---

## Recommended Power Automate Steps

1. Create a monthly scheduled flow.
2. Read active KPI records.
3. Calculate target-achievement percentage.
4. Set Green, Amber or Red status.
5. Notify KPI owners of Amber performance.
6. Escalate Red KPIs to executive sponsors.
7. Create an executive-review item.
8. Request corrective action.
9. Update the next review date.
10. Add failure handling.

---

## Power BI Dashboard Suggestions

## Create visuals for:

* KPI status distribution
* Department performance
* Target versus actual
* Red KPI trend
* Strategic-objective progress
* Corrective actions overdue
* Monthly performance movement
* Executive-review outcomes

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ExecutivePerformance" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

kpi-monitoring-flow.json

---

## Suggested SharePoint Views

## Red KPIs

Performance Status = Red

## Amber KPIs

Performance Status = Amber

## Reviews Due

Next Review Date <= Today

## My KPIs

KPI Owner = [Me]

## Strategic Objectives

Strategic Objective

---

## Security Model

* Performance Management Team: full management access
* KPI Owners: update assigned KPI results
* Department Leaders: view department performance
* Executives: review enterprise performance
* Auditors: read-only access
* General Employees: restricted read access
* Site Owners: full administrative control

---

## Governance Controls

* Unique KPI identification
* Strategic-objective alignment
* Assigned KPI ownership
* Standard target and actual measures
* Consistent performance thresholds
* Scheduled executive reviews
* Underperformance escalation
* Corrective-action tracking
* Role-based access
* Review-history preservation

---

## Business Value

* Creates one source of truth for performance
* Improves executive visibility
* Standardizes KPI reporting
* Identifies underperformance quickly
* Strengthens management accountability
* Supports strategic planning
* Reduces spreadsheet dependency
* Enables portfolio-level reporting
* Improves corrective-action tracking
* Supports Power BI executive dashboards

---

## Future Enhancements

* Live Power BI dashboard
* Teams adaptive-card reviews
* Balanced Scorecard model
* Automated department scorecards
* Strategic initiative linkage
* Budget and KPI correlation
* Forecast performance trends
* Microsoft Graph reporting
* Mobile Power Apps portal
* Executive PDF report generation

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Executive Performance and Enterprise Automation Portfolio.
