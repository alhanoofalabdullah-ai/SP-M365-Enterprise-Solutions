param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$Library = "Enterprise Contracts"
$LogList = "Contract Compliance Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param(
        [string]$List,
        [string]$Name,
        [string]$Title,
        [string]$Type
    )

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField `
            -List $List `
            -InternalName $Name `
            -DisplayName $Title `
            -Type $Type `
            -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $Library -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $Library -Template DocumentLibrary -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $LogList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $LogList -Template GenericList -OnQuickLaunch
}

Add-Field $Library "ContractNumber" "Contract Number" "Text"
Add-Field $Library "VendorName" "Vendor Name" "Text"
Add-Field $Library "ContractOwner" "Contract Owner" "User"
Add-Field $Library "Department" "Department" "Choice"
Add-Field $Library "StartDate" "Start Date" "DateTime"
Add-Field $Library "ExpiryDate" "Expiry Date" "DateTime"
Add-Field $Library "ContractValue" "Contract Value" "Currency"
Add-Field $Library "RenewalStatus" "Renewal Status" "Choice"
Add-Field $Library "ComplianceStatus" "Compliance Status" "Choice"
Add-Field $Library "RenewalNotes" "Renewal Notes" "Note"

Add-Field $LogList "ContractNumber" "Contract Number" "Text"
Add-Field $LogList "VendorName" "Vendor Name" "Text"
Add-Field $LogList "ComplianceAction" "Compliance Action" "Choice"
Add-Field $LogList "ActionOwner" "Action Owner" "User"
Add-Field $LogList "ActionDate" "Action Date" "DateTime"
Add-Field $LogList "ActionDetails" "Action Details" "Note"

Set-PnPList `
    -Identity $Library `
    -EnableVersioning $true `
    -MajorVersions 50

Write-Host "Contract renewal and compliance solution provisioned successfully."

Disconnect-PnPOnline
