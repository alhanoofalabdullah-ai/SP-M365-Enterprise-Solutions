param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$ObligationList = "Regulatory Obligations"
$EvidenceLibrary = "Compliance Evidence"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $ObligationList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $ObligationList -Template GenericList -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $EvidenceLibrary -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $EvidenceLibrary -Template DocumentLibrary -OnQuickLaunch
}

Add-Field $ObligationList "ObligationID" "Obligation ID" "Text"
Add-Field $ObligationList "Regulator" "Regulator" "Text"
Add-Field $ObligationList "RequirementTitle" "Requirement Title" "Text"
Add-Field $ObligationList "ControlOwner" "Control Owner" "User"
Add-Field $ObligationList "ControlFrequency" "Control Frequency" "Choice"
Add-Field $ObligationList "NextReviewDate" "Next Review Date" "DateTime"
Add-Field $ObligationList "ComplianceStatus" "Compliance Status" "Choice"
Add-Field $ObligationList "RiskRating" "Risk Rating" "Choice"
Add-Field $ObligationList "RemediationPlan" "Remediation Plan" "Note"

Add-Field $EvidenceLibrary "ObligationID" "Obligation ID" "Text"
Add-Field $EvidenceLibrary "EvidenceOwner" "Evidence Owner" "User"
Add-Field $EvidenceLibrary "EvidencePeriod" "Evidence Period" "Text"
Add-Field $EvidenceLibrary "EvidenceStatus" "Evidence Status" "Choice"
Add-Field $EvidenceLibrary "ReviewDate" "Review Date" "DateTime"

Set-PnPList -Identity $EvidenceLibrary `
    -EnableVersioning $true -MajorVersions 50

Write-Host "Regulatory compliance monitoring solution provisioned successfully."

Disconnect-PnPOnline
