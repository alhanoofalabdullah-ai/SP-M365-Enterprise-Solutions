param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$PolicyLibrary = "Corporate Policies"
$AssignmentList = "Policy Compliance Assignments"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $PolicyLibrary -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $PolicyLibrary -Template DocumentLibrary -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $AssignmentList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $AssignmentList -Template GenericList -OnQuickLaunch
}

Add-Field $PolicyLibrary "PolicyNumber" "Policy Number" "Text"
Add-Field $PolicyLibrary "PolicyOwner" "Policy Owner" "User"
Add-Field $PolicyLibrary "Department" "Department" "Choice"
Add-Field $PolicyLibrary "EffectiveDate" "Effective Date" "DateTime"
Add-Field $PolicyLibrary "ReviewDate" "Review Date" "DateTime"
Add-Field $PolicyLibrary "PolicyStatus" "Policy Status" "Choice"

Add-Field $AssignmentList "PolicyNumber" "Policy Number" "Text"
Add-Field $AssignmentList "AssignedEmployee" "Assigned Employee" "User"
Add-Field $AssignmentList "AssignedDepartment" "Assigned Department" "Choice"
Add-Field $AssignmentList "DueDate" "Due Date" "DateTime"
Add-Field $AssignmentList "AcknowledgementStatus" "Acknowledgement Status" "Choice"
Add-Field $AssignmentList "AcknowledgementDate" "Acknowledgement Date" "DateTime"
Add-Field $AssignmentList "TrainingStatus" "Training Status" "Choice"
Add-Field $AssignmentList "CertificateReference" "Certificate Reference" "Text"
Add-Field $AssignmentList "ComplianceNotes" "Compliance Notes" "Note"

Set-PnPList -Identity $PolicyLibrary `
    -EnableVersioning $true -MajorVersions 50

Write-Host "Policy compliance solution provisioned successfully."

Disconnect-PnPOnline
