param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$ServiceList = "Critical Business Services"
$TestLog = "Continuity Exercise Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($ServiceList, $TestLog)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $ServiceList "ServiceID" "Service ID" "Text"
Add-Field $ServiceList "ServiceOwner" "Service Owner" "User"
Add-Field $ServiceList "Criticality" "Criticality" "Choice"
Add-Field $ServiceList "RecoveryTimeObjective" "Recovery Time Objective" "Number"
Add-Field $ServiceList "RecoveryPointObjective" "Recovery Point Objective" "Number"
Add-Field $ServiceList "RecoverySite" "Recovery Site" "Text"
Add-Field $ServiceList "LastTestDate" "Last Test Date" "DateTime"
Add-Field $ServiceList "NextTestDate" "Next Test Date" "DateTime"
Add-Field $ServiceList "ReadinessStatus" "Readiness Status" "Choice"

Add-Field $TestLog "ServiceID" "Service ID" "Text"
Add-Field $TestLog "ExerciseType" "Exercise Type" "Choice"
Add-Field $TestLog "ExerciseDate" "Exercise Date" "DateTime"
Add-Field $TestLog "TestOwner" "Test Owner" "User"
Add-Field $TestLog "ExerciseResult" "Exercise Result" "Choice"
Add-Field $TestLog "Findings" "Findings" "Note"
Add-Field $TestLog "CorrectiveActions" "Corrective Actions" "Note"

Write-Host "Business continuity solution provisioned successfully."

Disconnect-PnPOnline
