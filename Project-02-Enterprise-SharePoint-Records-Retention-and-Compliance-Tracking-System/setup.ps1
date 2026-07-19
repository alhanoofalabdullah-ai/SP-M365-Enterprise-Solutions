<#
.SYNOPSIS
Creates the SharePoint structure required for enterprise
records retention and compliance tracking.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SiteUrl,

    [Parameter(Mandatory = $true)]
    [string]$ClientId
)

$ErrorActionPreference = "Stop"

$RecordsLibrary = "Corporate Records"
$ReviewList = "Retention Review Log"

function Write-Step {
    param([string]$Message)

    Write-Host "`n[SP-M365] $Message" -ForegroundColor Cyan
}

function Get-ExistingField {
    param(
        [string]$ListName,
        [string]$InternalName
    )

    return Get-PnPField `
        -List $ListName `
        -Identity $InternalName `
        -ErrorAction SilentlyContinue
}

function Add-FieldIfMissing {
    param(
        [string]$ListName,
        [string]$InternalName,
        [string]$DisplayName,
        [string]$Type,
        [string[]]$Choices
    )

    $existingField = Get-ExistingField `
        -ListName $ListName `
        -InternalName $InternalName

    if ($null -ne $existingField) {
        Write-Host "Field already exists: $DisplayName"
        return
    }

    $parameters = @{
        List             = $ListName
        InternalName     = $InternalName
        DisplayName      = $DisplayName
        Type             = $Type
        AddToDefaultView = $true
    }

    if ($Choices) {
        $parameters["Choices"] = $Choices
    }

    Add-PnPField @parameters

    Write-Host "Created field: $DisplayName"
}

Write-Step "Connecting to SharePoint Online"

Connect-PnPOnline `
    -Url $SiteUrl `
    -Interactive `
    -ClientId $ClientId

Write-Step "Creating corporate records library"

$library = Get-PnPList `
    -Identity $RecordsLibrary `
    -ErrorAction SilentlyContinue

if ($null -eq $library) {
    New-PnPList `
        -Title $RecordsLibrary `
        -Template DocumentLibrary `
        -OnQuickLaunch

    Write-Host "Created library: $RecordsLibrary"
}

Set-PnPList `
    -Identity $RecordsLibrary `
    -EnableVersioning $true `
    -MajorVersions 100 `
    -EnableContentTypes $true

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RecordCategory" `
    -DisplayName "Record Category" `
    -Type "Choice" `
    -Choices @(
        "Finance",
        "Human Resources",
        "Legal",
        "Procurement",
        "Projects",
        "Information Technology"
    )

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RecordOwner" `
    -DisplayName "Record Owner" `
    -Type "User"

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RetentionPeriodYears" `
    -DisplayName "Retention Period Years" `
    -Type "Number"

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RetentionStartDate" `
    -DisplayName "Retention Start Date" `
    -Type "DateTime"

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RetentionReviewDate" `
    -DisplayName "Retention Review Date" `
    -Type "DateTime"

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "RetentionStatus" `
    -DisplayName "Retention Status" `
    -Type "Choice" `
    -Choices @(
        "Active",
        "Review Due",
        "Extended",
        "Eligible for Disposal",
        "Disposed",
        "Legal Hold"
    )

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "LegalHoldReference" `
    -DisplayName "Legal Hold Reference" `
    -Type "Text"

Add-FieldIfMissing `
    -ListName $RecordsLibrary `
    -InternalName "ComplianceNotes" `
    -DisplayName "Compliance Notes" `
    -Type "Note"

Write-Step "Creating retention review log"

$reviewList = Get-PnPList `
    -Identity $ReviewList `
    -ErrorAction SilentlyContinue

if ($null -eq $reviewList) {
    New-PnPList `
        -Title $ReviewList `
        -Template GenericList `
        -OnQuickLaunch

    Write-Host "Created list: $ReviewList"
}

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "RecordName" `
    -DisplayName "Record Name" `
    -Type "Text"

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "RecordUrl" `
    -DisplayName "Record URL" `
    -Type "URL"

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "ReviewAction" `
    -DisplayName "Review Action" `
    -Type "Choice" `
    -Choices @(
        "Review Requested",
        "Retention Extended",
        "Disposal Approved",
        "Legal Hold Applied",
        "Review Failed"
    )

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "ReviewedBy" `
    -DisplayName "Reviewed By" `
    -Type "User"

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "ReviewDate" `
    -DisplayName "Review Date" `
    -Type "DateTime"

Add-FieldIfMissing `
    -ListName $ReviewList `
    -InternalName "DecisionComments" `
    -DisplayName "Decision Comments" `
    -Type "Note"

Write-Step "Adding initial compliance record"

Add-PnPListItem `
    -List $ReviewList `
    -Values @{
        Title        = "Retention Solution Provisioned"
        RecordName   = "System Initialization"
        ReviewAction = "Review Requested"
        ReviewDate   = Get-Date
        DecisionComments = "Retention and compliance structure created."
    }

Write-Step "Provisioning completed successfully"

Disconnect-PnPOnline
