<#
.SYNOPSIS
Creates the SharePoint structure required for the enterprise
document approval and governance solution.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SiteUrl,

    [Parameter(Mandatory = $true)]
    [string]$ClientId
)

$ErrorActionPreference = "Stop"

$DocumentLibrary = "Enterprise Documents"
$ApprovalLog = "Approval Log"

function Write-Step {
    param([string]$Message)

    Write-Host "`n[SP-M365] $Message" -ForegroundColor Cyan
}

function Add-FieldIfMissing {
    param(
        [string]$ListName,
        [string]$InternalName,
        [string]$DisplayName,
        [string]$Type,
        [string[]]$Choices
    )

    $field = Get-PnPField `
        -List $ListName `
        -Identity $InternalName `
        -ErrorAction SilentlyContinue

    if ($null -ne $field) {
        Write-Host "Field already exists: $DisplayName"
        return
    }

    $parameters = @{
        List         = $ListName
        InternalName = $InternalName
        DisplayName  = $DisplayName
        Type         = $Type
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

Write-Step "Creating document library"

$library = Get-PnPList `
    -Identity $DocumentLibrary `
    -ErrorAction SilentlyContinue

if ($null -eq $library) {
    New-PnPList `
        -Title $DocumentLibrary `
        -Template DocumentLibrary `
        -OnQuickLaunch

    Write-Host "Created library: $DocumentLibrary"
}

Set-PnPList `
    -Identity $DocumentLibrary `
    -EnableVersioning $true `
    -MajorVersions 50 `
    -EnableContentTypes $true

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "Department" `
    -DisplayName "Department" `
    -Type "Choice" `
    -Choices @(
        "Finance",
        "Human Resources",
        "Information Technology",
        "Operations",
        "Procurement",
        "Projects"
    )

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "DocumentOwner" `
    -DisplayName "Document Owner" `
    -Type "User"

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "Approver" `
    -DisplayName "Approver" `
    -Type "User"

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "ApprovalStatus" `
    -DisplayName "Approval Status" `
    -Type "Choice" `
    -Choices @(
        "Draft",
        "Pending Approval",
        "Approved",
        "Rejected"
    )

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "ApprovalDate" `
    -DisplayName "Approval Date" `
    -Type "DateTime"

Add-FieldIfMissing `
    -ListName $DocumentLibrary `
    -InternalName "ApprovalComments" `
    -DisplayName "Approval Comments" `
    -Type "Note"

Write-Step "Creating approval audit list"

$logList = Get-PnPList `
    -Identity $ApprovalLog `
    -ErrorAction SilentlyContinue

if ($null -eq $logList) {
    New-PnPList `
        -Title $ApprovalLog `
        -Template GenericList `
        -OnQuickLaunch

    Write-Host "Created list: $ApprovalLog"
}

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "DocumentName" `
    -DisplayName "Document Name" `
    -Type "Text"

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "DocumentUrl" `
    -DisplayName "Document URL" `
    -Type "URL"

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "ApprovalAction" `
    -DisplayName "Approval Action" `
    -Type "Choice" `
    -Choices @(
        "Submitted",
        "Approved",
        "Rejected",
        "Failed"
    )

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "ActionBy" `
    -DisplayName "Action By" `
    -Type "User"

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "ActionDate" `
    -DisplayName "Action Date" `
    -Type "DateTime"

Add-FieldIfMissing `
    -ListName $ApprovalLog `
    -InternalName "Comments" `
    -DisplayName "Comments" `
    -Type "Note"

Write-Step "Adding sample audit record"

Add-PnPListItem `
    -List $ApprovalLog `
    -Values @{
        Title          = "Solution Provisioned"
        DocumentName   = "System Initialization"
        ApprovalAction = "Submitted"
        ActionDate     = Get-Date
        Comments       = "SharePoint approval solution created successfully."
    }

Write-Step "Provisioning completed successfully"

Disconnect-PnPOnline
