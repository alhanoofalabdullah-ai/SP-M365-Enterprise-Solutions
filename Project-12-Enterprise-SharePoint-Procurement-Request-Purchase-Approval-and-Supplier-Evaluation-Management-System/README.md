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

| Column	                  | Purpose
| Request Number	      | Unique procurement identifier
| Requester	                  | Employee submitting the request
| Department	      | Requesting business unit
| Purchase Category	      | Software, hardware, services or supplies
| Estimated Value	      | Expected purchase amount
| Required Date	      | Required delivery date
| Business Justification      | Business need
| Approver	                  | Assigned approval owner
| Approval Status	      | Current approval stage
| Purchase Order Number       | Final purchasing reference

---

## Supplier Evaluation Register

| Column	            | Purpose
| Supplier Name	| Registered supplier
| Supplier Category	| Product or service category
| Quality Score	| Quality-performance score
| Delivery Score	| Delivery-performance score
| Compliance Score	| Compliance-performance score
| Overall Rating	| Combined supplier rating
| Evaluation Status	| Approved, Conditional or Suspended

---

## Procurement Lifecycle

Submitted
   ↓
Pending Approval
   ↓
Approved or Rejected
   ↓
Purchase Order Created
   ↓
Ordered
   ↓
Received
   ↓
Closed

---

## Approval Model

| Estimated Value	| Approval Level
| Up to 10,000	| Department Manager
| 10,001–100,000	| Procurement Manager
| Above 100,000	| Procurement Director

## The approval thresholds can be edited in:

procurement-flow.json

---

## Recommended Power Automate Steps

1. Trigger when a procurement request is created.
2. Generate a unique request number.
3. Set the approval status to Pending.
4. Read the estimated purchase value.
5. Select the appropriate approval level.
6. Start and wait for an approval.
7. Escalate high-value requests when required.
8. Update the approval status.
9. Notify the requester and procurement team.
10. Store the purchase-order number.
11. Add failure handling.

---

## Deployment

## Install PnP PowerShell:

Install-Module PnP.PowerShell -Scope CurrentUser

## Run

./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/ProcurementManagement" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"

## Create the Power Automate workflow using:

procurement-flow.json

---

## Suggested SharePoint Views

## Pending Approvals

Approval Status = Pending

## High-Value Requests

Estimated Value > 100000

## Approved Requests

Approval Status = Approved

## Purchase Orders Pending

Approval Status = Approved
Purchase Order Number is empty

## Low-Rated Suppliers

Overall Rating < 60

---

## Security Model

* Employees: create and view their own requests
* Department Managers: approve department requests
* Procurement Team: manage all procurement records
* Procurement Director: approve high-value purchases
* Finance Team: read financial values and approved requests
* Auditors: read-only access
* Site Owners: full administrative control

---

## Governance Controls

* Unique procurement identification
* Recorded business justification
* Controlled approval thresholds
* Assigned approval responsibility
* Purchase-value visibility
* Purchase-order traceability
* Supplier-performance scoring
* Role-based access
* Approval-history preservation
* Failure notifications

---

## Business Value

* Standardizes procurement intake
* Reduces approval delays
* Improves purchase visibility
* Strengthens financial controls
* Reduces email-based approvals
* Creates clear accountability
* Improves supplier-performance monitoring
* Supports procurement audits
* Enables consistent approval thresholds
* Centralizes purchasing history

---

## Future Enhancements

* Power Apps procurement portal
* Power BI spend dashboard
* Budget availability validation
* Multi-stage financial approval
* Supplier-document repository
* Microsoft Teams adaptive approvals
* Purchase-order document generation
* Vendor onboarding integration
* Contract-management integration
* Supplier risk scoring

---

Author

Alhanoof Alabdullah

SharePoint, Microsoft 365, Procurement Governance and Enterprise Automation Portfolio.
