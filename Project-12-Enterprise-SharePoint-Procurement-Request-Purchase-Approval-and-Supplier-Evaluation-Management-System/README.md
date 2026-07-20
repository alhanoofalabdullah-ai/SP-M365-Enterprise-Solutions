# Enterprise SharePoint Procurement Request, Purchase Approval and Supplier Evaluation Management System

Enterprise Microsoft 365 solution for managing procurement requests,
purchase approvals, supplier evaluations and purchasing visibility using
SharePoint Online and Power Automate.

## Business Problem

Procurement requests are often submitted through email, spreadsheets or
informal messages. This creates limited visibility into approval status,
purchase value, business justification and supplier performance.

This solution provides a centralized procurement register and automates
approval routing according to purchase value.

## Core Features

- Central procurement-request register
- Automatic request-number generation
- Requester and department tracking
- Purchase-category classification
- Estimated-value tracking
- Required-date monitoring
- Business-justification recording
- Value-based approval routing
- Multi-level purchase approval
- Purchase-order number tracking
- Supplier performance scoring
- Procurement notifications
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
Employee Procurement Request
            |
            v
SharePoint Procurement List
            |
            v
Power Automate Workflow
            |
            v
Evaluate Purchase Value
            |
     +------+------+
     |             |
Standard Value   High Value
     |             |
Manager         Director
Approval        Approval
     |             |
     +------+------+
            |
            v
Update Approval Status
            |
            v
Notify Requester and Procurement

---

## Repository Structure

Project-12-Enterprise-SharePoint-Procurement-Request-Purchase-Approval-and-Supplier-Evaluation-Management-System/
├── README.md
├── setup.ps1
├── procurement-flow.json
├── sample-request.json
└── .gitignore

---

## SharePoint Components

## Procurement Requests

| Column	                    | Purpose
| Request Number	            | Unique procurement identifier
| Requester	                  | Employee submitting the request
| Department	                | Requesting business unit
| Purchase Category	          | Software, hardware, services or supplies
| Estimated Value	            | Expected purchase amount
| Required Date	              | Required delivery date
| Business Justification	    | Business need
| Approver	                  | Assigned approval owner
| Approval Status	            | Current approval stage
| Purchase Order Number      	| Final purchasing reference

---

## 
