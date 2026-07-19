# Enterprise SharePoint Asset Management, Maintenance and Lifecycle Tracking System

Enterprise Microsoft 365 solution for managing organizational assets,
maintenance schedules, warranty monitoring and lifecycle tracking using
SharePoint Online and Power Automate.

---

## Business Problem

Organizations often manage laptops, printers, monitors, phones and
other corporate assets using Excel spreadsheets.

This results in:

- Lost assets
- Missed maintenance
- Expired warranties
- Poor ownership tracking

This solution centralizes asset management inside SharePoint.

---

## Features

- Enterprise Asset Register
- Asset Owner Tracking
- Department Assignment
- Warranty Monitoring
- Maintenance Scheduling
- Asset Lifecycle Tracking
- Maintenance Notifications
- SharePoint Views
- Power Automate Reminders

---

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Outlook
- Microsoft 365
- PnP PowerShell

---

## Architecture

```text
Asset Registration
        │
        ▼
SharePoint Asset List
        │
        ▼
Daily Power Automate Flow
        │
 ┌──────┼─────────┐
 │      │         │
 ▼      ▼         ▼
Warranty  Maintenance  Lifecycle
Check      Reminder     Update
 │          │
 └──────┬───┘
        ▼
Owner Notification

---

## SharePoint Columns

| Column             	| Purpose
| Asset ID	          | Asset identifier
| Asset Name	        | Asset name
| Category	          | Asset type
| Department	        | Business owner
| Owner             	| Assigned employee
| Purchase Date	      | Purchase date
| Warranty Expiry	    | Warranty end
| Maintenance Date	  | Next maintenance
| Status            	| Current lifecycle
| Location	          | Physical location

---

## Asset Lifecycle

Purchased
    ↓
Active
    ↓
Maintenance Due
    ↓
Under Maintenance
    ↓
Active
    ↓
Retired
    ↓
Disposed

---

## Suggested SharePoint Views

## Active Assets

Status = Active

## Maintenance Due

Maintenance Date <= Today

## Warranty Expiring

Warranty Expiry <= Today + 90 Days

## Retired Assets

Status = Retired

---

## Business Value

* Central asset inventory
* Reduces lost equipment
* Improves maintenance planning
* Tracks warranty expiration
* Improves ownership visibility
* Supports IT audits
* Simplifies reporting
* Standardizes lifecycle management

⸻

## Future Enhancements

* QR Code Tracking
* Power Apps Mobile Scanner
* Power BI Dashboard
* Barcode Integration
* Microsoft Teams Notifications
* Vendor Maintenance Portal
* Asset Cost Dashboard
* AI Asset Prediction

⸻

Author

Alhanoof Alabdullah

Microsoft 365 | SharePoint | Enterprise Solutions
