param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$IncidentList = "Enterprise Incidents"
$ActionList = "Corrective Action Register"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($IncidentList, $ActionList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $IncidentList "IncidentNumber" "Incident Number" "Text"
Add-Field $IncidentList "ReportedBy" "Reported By" "User"
Add-Field $IncidentList "IncidentCategory" "Incident Category" "Choice"
Add-Field $IncidentList "Severity" "Severity" "Choice"
Add-Field $IncidentList "IncidentDate" "Incident Date" "DateTime"
Add-Field $IncidentList "Location" "Location" "Text"
Add-Field $IncidentList "Investigator" "Investigator" "User"
Add-Field $IncidentList "RootCause" "Root Cause" "Note"
Add-Field $IncidentList "IncidentStatus" "Incident Status" "Choice"

Add-Field $ActionList "IncidentNumber" "Incident Number" "Text"
Add-Field $ActionList "CorrectiveAction" "Corrective Action" "Note"
Add-Field $ActionList "ActionOwner" "Action Owner" "User"
Add-Field $ActionList "TargetDate" "Target Date" "DateTime"
Add-Field $ActionList "ActionStatus" "Action Status" "Choice"
Add-Field $ActionList "CompletionEvidence" "Completion Evidence" "Text"

Write-Host "Incident and corrective action solution provisioned successfully."

Disconnect-PnPOnline
