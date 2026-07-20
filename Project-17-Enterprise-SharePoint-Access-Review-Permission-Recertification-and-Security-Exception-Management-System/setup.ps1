param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$ReviewList = "Access Review Register"
$ExceptionList = "Security Exception Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($ReviewList, $ExceptionList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $ReviewList "ReviewNumber" "Review Number" "Text"
Add-Field $ReviewList "ResourceName" "Resource Name" "Text"
Add-Field $ReviewList "ResourceType" "Resource Type" "Choice"
Add-Field $ReviewList "AccessOwner" "Access Owner" "User"
Add-Field $ReviewList "AssignedUser" "Assigned User" "User"
Add-Field $ReviewList "PermissionLevel" "Permission Level" "Choice"
Add-Field $ReviewList "ReviewDueDate" "Review Due Date" "DateTime"
Add-Field $ReviewList "ReviewDecision" "Review Decision" "Choice"
Add-Field $ReviewList "ReviewStatus" "Review Status" "Choice"

Add-Field $ExceptionList "ReviewNumber" "Review Number" "Text"
Add-Field $ExceptionList "ExceptionReason" "Exception Reason" "Note"
Add-Field $ExceptionList "ExceptionOwner" "Exception Owner" "User"
Add-Field $ExceptionList "ExpiryDate" "Expiry Date" "DateTime"
Add-Field $ExceptionList "ApprovalStatus" "Approval Status" "Choice"
Add-Field $ExceptionList "MitigationControls" "Mitigation Controls" "Note"

Write-Host "Access review and security exception solution provisioned successfully."

Disconnect-PnPOnline
