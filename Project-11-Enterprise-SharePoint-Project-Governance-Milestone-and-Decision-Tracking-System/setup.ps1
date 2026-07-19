param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$ProjectList = "Enterprise Projects"
$DecisionList = "Project Decision Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $ProjectList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $ProjectList -Template GenericList -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $DecisionList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $DecisionList -Template GenericList -OnQuickLaunch
}

Add-Field $ProjectList "ProjectID" "Project ID" "Text"
Add-Field $ProjectList "ProjectManager" "Project Manager" "User"
Add-Field $ProjectList "Sponsor" "Project Sponsor" "User"
Add-Field $ProjectList "Department" "Department" "Choice"
Add-Field $ProjectList "StartDate" "Start Date" "DateTime"
Add-Field $ProjectList "TargetEndDate" "Target End Date" "DateTime"
Add-Field $ProjectList "CurrentMilestone" "Current Milestone" "Text"
Add-Field $ProjectList "HealthStatus" "Health Status" "Choice"
Add-Field $ProjectList "CompletionPercent" "Completion Percent" "Number"
Add-Field $ProjectList "NextReviewDate" "Next Review Date" "DateTime"

Add-Field $DecisionList "ProjectID" "Project ID" "Text"
Add-Field $DecisionList "DecisionTitle" "Decision Title" "Text"
Add-Field $DecisionList "DecisionOwner" "Decision Owner" "User"
Add-Field $DecisionList "DecisionDate" "Decision Date" "DateTime"
Add-Field $DecisionList "DecisionStatus" "Decision Status" "Choice"
Add-Field $DecisionList "DecisionDetails" "Decision Details" "Note"

Write-Host "Project governance solution provisioned successfully."

Disconnect-PnPOnline
