# Enterprise SharePoint Visitor Management, Meeting Registration and Facility Access Tracking System

Enterprise Microsoft 365 solution for managing visitors, meeting registrations,
host notifications and facility access using SharePoint Online and Power Automate.

---

## Business Problem

Organizations often register visitors manually through paper forms or
Excel spreadsheets, making it difficult to monitor visitor activity,
track facility access and notify hosts efficiently.

This solution provides a centralized visitor management process.

---

## Features

- Visitor Registration
- Visitor ID Generation
- Meeting Scheduling
- Host Notification
- Visitor Badge Tracking
- Check-in Recording
- Check-out Recording
- Visit History
- Visitor Status Tracking
- Audit Trail

---

## Technologies

- SharePoint Online
- Microsoft Lists
- Power Automate
- Outlook
- Microsoft Teams
- PnP PowerShell

---

## Architecture

```text
Visitor Registration
        │
        ▼
SharePoint Visitor List
        │
        ▼
Power Automate Workflow
        │
 ┌──────┼─────────┐
 │      │         │
 ▼      ▼         ▼
Host  Badge   Check-in
Notify Generate Record
 │
 ▼
Check-out
 │
 ▼
Archive

---

## SharePoint Columns

| Column	       | Purpose
| Visitor ID	   | Unique visitor number
| Visitor Name	 | Full name
| Company	       | Visitor company
| Host	         | Employee host
| Visit Date	   | Planned visit
| Purpose	       | Visit purpose
| Check In	     | Arrival time
| Check Out	     | Departure time
| Status	       | Visit status
| Badge Number	 | Badge identifier

---

## Visitor Lifecycle

Registered
      ↓
Checked In
      ↓
Meeting
      ↓
Checked Out
      ↓
Archived

---

## Suggested Views

## Today’s Visitors

Visit Date = Today

## Checked In

Status = Checked In

## Expected Visitors

Status = Registered

## Completed Visits

Status = Checked Out

⸻

## Business Value

* Centralized visitor registration
* Faster reception process
* Automatic host notifications
* Better facility security
* Visitor history
* Badge tracking
* Audit-ready records
* Improved meeting coordination

⸻

## Future Enhancements

* QR Code Check-in
* Visitor Self-Service Portal
* Power Apps Reception App
* Microsoft Teams Notifications
* Power BI Dashboard
* ID Card Scanning
* Face Recognition Integration
* Digital NDA Signature

⸻

Author

Alhanoof Alabdullah

Microsoft 365 | SharePoint | Enterprise Solutions
