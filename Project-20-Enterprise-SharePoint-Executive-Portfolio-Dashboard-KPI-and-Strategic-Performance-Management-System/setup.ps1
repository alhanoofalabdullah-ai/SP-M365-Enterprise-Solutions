param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$KpiList = "Enterprise KPI Register"
$ReviewList = "Executive Performance Reviews"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($KpiList, $ReviewList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $KpiList "KPIID" "KPI ID" "Text"
Add-Field $KpiList "StrategicObjective" "Strategic Objective" "Text"
Add-Field $KpiList "KPIOwner" "KPI Owner" "User"
Add-Field $KpiList "Department" "Department" "Choice"
Add-Field $KpiList "TargetValue" "Target Value" "Number"
Add-Field $KpiList "ActualValue" "Actual Value" "Number"
Add-Field $KpiList "PerformanceStatus" "Performance Status" "Choice"
Add-Field $KpiList "ReportingPeriod" "Reporting Period" "Text"
Add-Field $KpiList "NextReviewDate" "Next Review Date" "DateTime"

Add-Field $ReviewList "KPIID" "KPI ID" "Text"
Add-Field $ReviewList "ReviewOwner" "Review Owner" "User"
Add-Field $ReviewList "ReviewDate" "Review Date" "DateTime"
Add-Field $ReviewList "ExecutiveDecision" "Executive Decision" "Choice"
Add-Field $ReviewList "ManagementComments" "Management Comments" "Note"
Add-Field $ReviewList "RequiredAction" "Required Action" "Note"

Write-Host "Executive KPI management solution provisioned successfully."

Disconnect-PnPOnline
