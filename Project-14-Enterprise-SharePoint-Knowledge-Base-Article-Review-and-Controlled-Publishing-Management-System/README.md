# Enterprise SharePoint Knowledge Base, Article Review and Controlled Publishing Management System

Enterprise Microsoft 365 solution for creating, reviewing, publishing
and maintaining controlled knowledge articles using SharePoint Online
and Power Automate.

## Business Problem

Organizational knowledge is often distributed across emails, personal
documents, chat conversations and unmanaged folders.

This makes information difficult to find, validate and maintain.

This solution provides a centralized enterprise knowledge base with
controlled publishing, review dates, ownership and article lifecycle
management.

## Core Features

- Central knowledge-article library
- Unique article-number tracking
- Article-category classification
- Assigned article ownership
- Reviewer assignment
- Controlled review workflow
- Approved article publishing
- Rejected article correction
- Review-date monitoring
- Expiry-date monitoring
- Outdated article archiving
- Article review audit log
- Version-history support
- Failure notifications

## Technologies

- SharePoint Online
- Microsoft 365
- Power Automate
- Microsoft Lists
- Microsoft Outlook
- Microsoft Teams
- PnP PowerShell
- JSON

## Architecture

```text
Knowledge Article Draft
          |
          v
SharePoint Knowledge Library
          |
          v
Power Automate Review Workflow
          |
      +---+---+
      |       |
   Approve   Reject
      |       |
      v       v
   Publish   Return to Draft
      |
      v
Review Audit Log
      |
      v
Expiry Monitoring
      |
      v
Archive Outdated Article
```

## Repository Structure

```text
Project-14-Enterprise-SharePoint-Knowledge-Base-Article-Review-and-Controlled-Publishing-Management-System/
├── README.md
├── setup.ps1
├── publishing-flow.json
├── sample-article.json
└── .gitignore
```

## SharePoint Components

### Enterprise Knowledge Base

| Column | Purpose |
|---|---|
| Article Number | Unique knowledge identifier |
| Article Category | Business or technical category |
| Article Owner | Accountable content owner |
| Reviewer | Assigned reviewer |
| Article Status | Current publishing state |
| Review Date | Next content review |
| Expiry Date | Article validity end date |
| Keywords | Search and discovery terms |

### Knowledge Article Review Log

| Column | Purpose |
|---|---|
| Article Number | Related knowledge article |
| Review Action | Submitted, approved, rejected or archived |
| Reviewed By | Reviewer identity |
| Review Timestamp | Decision date and time |
| Review Comments | Review notes |

## Article Lifecycle

```text
Draft
  ↓
Pending Review
  ↓
Published
  ↓
Review Due
  ↓
Republished or Archived
```

Rejected path:

```text
Pending Review
      ↓
Rejected
      ↓
Draft
```

## Recommended Power Automate Steps

1. Trigger when an article is created or modified.
2. Validate the owner, reviewer and dates.
3. Set the article status to `Pending Review`.
4. Start and wait for reviewer approval.
5. Set approved articles to `Published`.
6. Return rejected articles to `Draft`.
7. Create an item in the review log.
8. Notify the article owner.
9. Run a scheduled expiry check.
10. Mark expired articles as `Expired`.
11. Archive outdated articles.
12. Configure failure handling.

## Deployment

Install PnP PowerShell:

```powershell
Install-Module PnP.PowerShell -Scope CurrentUser
```

Run:

```powershell
./setup.ps1 `
  -SiteUrl "https://contoso.sharepoint.com/sites/EnterpriseKnowledge" `
  -ClientId "YOUR-ENTRA-CLIENT-ID"
```

Create the Power Automate workflow using:

```text
publishing-flow.json
```

## Suggested SharePoint Views

### Published Articles

```text
Article Status = Published
```

### Pending Review

```text
Article Status = Pending Review
```

### Review Due

```text
Review Date <= Today
Article Status = Published
```

### Expired Articles

```text
Expiry Date < Today
```

### My Articles

```text
Article Owner = [Me]
```

## Security Model

- Knowledge Administrators: full management access
- Article Owners: create and update owned articles
- Reviewers: approve or reject assigned articles
- Employees: read published articles
- Auditors: read-only access to articles and review history
- Site Owners: full administrative control

## Governance Controls

- Unique article identification
- Assigned content ownership
- Mandatory reviewer approval
- Controlled publishing status
- Version-history preservation
- Scheduled content review
- Article expiry management
- Recorded review decisions
- Role-based access
- Outdated-content archiving

## Business Value

- Creates a single source of organizational knowledge
- Reduces repeated support requests
- Improves knowledge accuracy
- Prevents unapproved content publication
- Makes information easier to discover
- Assigns clear article ownership
- Identifies outdated information
- Supports employee self-service
- Improves audit readiness
- Preserves review history

## Future Enhancements

- SharePoint search verticals
- Power Apps knowledge portal
- Power BI article-usage dashboard
- Microsoft Teams knowledge bot
- Article feedback and ratings
- Frequently asked questions
- Microsoft Graph search integration
- Multilingual knowledge articles
- Automated review reminders
- Copilot-ready knowledge structure

## Author

**Alhanoof Alabdullah**

SharePoint, Microsoft 365, Knowledge Management and Enterprise Automation Portfolio.
