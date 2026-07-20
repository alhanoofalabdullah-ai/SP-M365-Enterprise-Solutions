param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$Library = "Enterprise Knowledge Base"
$ReviewLog = "Knowledge Article Review Log"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

if (-not (Get-PnPList -Identity $Library -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $Library -Template DocumentLibrary -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $ReviewLog -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $ReviewLog -Template GenericList -OnQuickLaunch
}

Add-Field $Library "ArticleNumber" "Article Number" "Text"
Add-Field $Library "ArticleCategory" "Article Category" "Choice"
Add-Field $Library "ArticleOwner" "Article Owner" "User"
Add-Field $Library "Reviewer" "Reviewer" "User"
Add-Field $Library "ArticleStatus" "Article Status" "Choice"
Add-Field $Library "ReviewDate" "Review Date" "DateTime"
Add-Field $Library "ExpiryDate" "Expiry Date" "DateTime"
Add-Field $Library "Keywords" "Keywords" "Note"

Add-Field $ReviewLog "ArticleNumber" "Article Number" "Text"
Add-Field $ReviewLog "ReviewAction" "Review Action" "Choice"
Add-Field $ReviewLog "ReviewedBy" "Reviewed By" "User"
Add-Field $ReviewLog "ReviewTimestamp" "Review Timestamp" "DateTime"
Add-Field $ReviewLog "ReviewComments" "Review Comments" "Note"

Set-PnPList -Identity $Library `
    -EnableVersioning $true -MajorVersions 50 -EnableContentTypes $true

Write-Host "Enterprise knowledge base solution provisioned successfully."

Disconnect-PnPOnline
