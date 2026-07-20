param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$ChangeList = "Enterprise Change Requests"
$CabLog = "CAB Decision Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($ChangeList, $CabLog)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $ChangeList "ChangeNumber" "Change Number" "Text"
Add-Field $ChangeList "RequestedBy" "Requested By" "User"
Add-Field $ChangeList "ChangeOwner" "Change Owner" "User"
Add-Field $ChangeList "ChangeType" "Change Type" "Choice"
Add-Field $ChangeList "RiskLevel" "Risk Level" "Choice"
Add-Field $ChangeList "BusinessImpact" "Business Impact" "Note"
Add-Field $ChangeList "ImplementationDate" "Implementation Date" "DateTime"
Add-Field $ChangeList "RollbackPlan" "Rollback Plan" "Note"
Add-Field $ChangeList "ChangeStatus" "Change Status" "Choice"

Add-Field $CabLog "ChangeNumber" "Change Number" "Text"
Add-Field $CabLog "Decision" "Decision" "Choice"
Add-Field $CabLog "DecisionBy" "Decision By" "User"
Add-Field $CabLog "DecisionDate" "Decision Date" "DateTime"
Add-Field $CabLog "DecisionComments" "Decision Comments" "Note"

Write-Host "Change request and CAB approval solution provisioned successfully."

Disconnect-PnPOnline
