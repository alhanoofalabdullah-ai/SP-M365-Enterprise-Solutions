param(
    [Parameter(Mandatory)]
    [string]$SiteUrl,

    [Parameter(Mandatory)]
    [string]$ClientId
)

$ErrorActionPreference = "Stop"
$ListName = "Employee Onboarding"
$LibraryName = "Employee Documents"

Connect-PnPOnline `
    -Url $SiteUrl `
    -Interactive `
    -ClientId $ClientId

function Add-Field {
    param(
        [string]$List,
        [string]$Name,
        [string]$Title,
        [string]$Type
    )

    $field = Get-PnPField `
        -List $List `
        -Identity $Name `
        -ErrorAction SilentlyContinue

    if (-not $field) {
        Add-PnPField `
            -List $List `
            -InternalName $Name `
            -DisplayName $Title `
            -Type $Type `
            -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $ListName -ErrorAction SilentlyContinue)) {
    New-PnPList `
        -Title $ListName `
        -Template GenericList `
        -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $LibraryName -ErrorAction SilentlyContinue)) {
    New-PnPList `
        -Title $LibraryName `
        -Template DocumentLibrary `
        -OnQuickLaunch
}

Add-Field $ListName "EmployeeID" "Employee ID" "Text"
Add-Field $ListName "EmployeeName" "Employee Name" "Text"
Add-Field $ListName "EmployeeEmail" "Employee Email" "Text"
Add-Field $ListName "Department" "Department" "Choice"
Add-Field $ListName "Manager" "Manager" "User"
Add-Field $ListName "JobTitle" "Job Title" "Text"
Add-Field $ListName "StartDate" "Start Date" "DateTime"
Add-Field $ListName "ProvisioningStatus" "Provisioning Status" "Choice"
Add-Field $ListName "ProvisioningNotes" "Provisioning Notes" "Note"

Add-Field $LibraryName "EmployeeID" "Employee ID" "Text"
Add-Field $LibraryName "Department" "Department" "Text"
Add-Field $LibraryName "DocumentType" "Document Type" "Choice"

Set-PnPList `
    -Identity $LibraryName `
    -EnableVersioning $true `
    -MajorVersions 50

Write-Host "Employee onboarding solution provisioned successfully."

Disconnect-PnPOnline
