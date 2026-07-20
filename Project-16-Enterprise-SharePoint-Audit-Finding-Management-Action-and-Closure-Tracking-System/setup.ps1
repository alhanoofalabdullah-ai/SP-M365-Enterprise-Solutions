param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$FindingList = "Enterprise Audit Findings"
$ActionList = "Audit Management Actions"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($FindingList, $ActionList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $FindingList "FindingNumber" "Finding Number" "Text"
Add-Field $FindingList "AuditArea" "Audit Area" "Choice"
Add-Field $FindingList "FindingOwner" "Finding Owner" "User"
Add-Field $FindingList "RiskRating" "Risk Rating" "Choice"
Add-Field $FindingList "FindingDetails" "Finding Details" "Note"
Add-Field $FindingList "TargetClosureDate" "Target Closure Date" "DateTime"
Add-Field $FindingList "FindingStatus" "Finding Status" "Choice"

Add-Field $ActionList "FindingNumber" "Finding Number" "Text"
Add-Field $ActionList "ManagementAction" "Management Action" "Note"
Add-Field $ActionList "ActionOwner" "Action Owner" "User"
Add-Field $ActionList "DueDate" "Due Date" "DateTime"
Add-Field $ActionList "ActionStatus" "Action Status" "Choice"
Add-Field $ActionList "ClosureEvidence" "Closure Evidence" "Text"

Write-Host "Audit finding solution provisioned successfully."

Disconnect-PnPOnline
