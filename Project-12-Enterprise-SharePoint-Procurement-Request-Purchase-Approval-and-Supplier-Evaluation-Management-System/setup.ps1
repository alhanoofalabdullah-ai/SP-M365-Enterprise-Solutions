param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$RequestList = "Procurement Requests"
$SupplierList = "Supplier Evaluation Register"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($RequestList, $SupplierList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $RequestList "RequestNumber" "Request Number" "Text"
Add-Field $RequestList "Requester" "Requester" "User"
Add-Field $RequestList "Department" "Department" "Choice"
Add-Field $RequestList "PurchaseCategory" "Purchase Category" "Choice"
Add-Field $RequestList "EstimatedValue" "Estimated Value" "Currency"
Add-Field $RequestList "RequiredDate" "Required Date" "DateTime"
Add-Field $RequestList "BusinessJustification" "Business Justification" "Note"
Add-Field $RequestList "Approver" "Approver" "User"
Add-Field $RequestList "ApprovalStatus" "Approval Status" "Choice"
Add-Field $RequestList "PurchaseOrderNumber" "Purchase Order Number" "Text"

Add-Field $SupplierList "SupplierName" "Supplier Name" "Text"
Add-Field $SupplierList "SupplierCategory" "Supplier Category" "Choice"
Add-Field $SupplierList "QualityScore" "Quality Score" "Number"
Add-Field $SupplierList "DeliveryScore" "Delivery Score" "Number"
Add-Field $SupplierList "ComplianceScore" "Compliance Score" "Number"
Add-Field $SupplierList "OverallRating" "Overall Rating" "Number"
Add-Field $SupplierList "EvaluationStatus" "Evaluation Status" "Choice"

Write-Host "Procurement and supplier evaluation solution provisioned successfully."

Disconnect-PnPOnline
