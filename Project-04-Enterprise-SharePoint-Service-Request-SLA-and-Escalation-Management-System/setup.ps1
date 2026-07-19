param(
    [Parameter(Mandatory)]
    [string]$SiteUrl,

    [Parameter(Mandatory)]
    [string]$ClientId
)

$ErrorActionPreference = "Stop"
$RequestList = "Enterprise Service Requests"
$EscalationList = "SLA Escalation Log"

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

if (-not (Get-PnPList -Identity $RequestList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $RequestList -Template GenericList -OnQuickLaunch
}

if (-not (Get-PnPList -Identity $EscalationList -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $EscalationList -Template GenericList -OnQuickLaunch
}

Add-Field $RequestList "RequestNumber" "Request Number" "Text"
Add-Field $RequestList "Requester" "Requester" "User"
Add-Field $RequestList "Department" "Department" "Choice"
Add-Field $RequestList "RequestCategory" "Request Category" "Choice"
Add-Field $RequestList "Priority" "Priority" "Choice"
Add-Field $RequestList "AssignedTo" "Assigned To" "User"
Add-Field $RequestList "RequestStatus" "Request Status" "Choice"
Add-Field $RequestList "SLADeadline" "SLA Deadline" "DateTime"
Add-Field $RequestList "ResolutionDate" "Resolution Date" "DateTime"
Add-Field $RequestList "ResolutionNotes" "Resolution Notes" "Note"

Add-Field $EscalationList "RequestNumber" "Request Number" "Text"
Add-Field $EscalationList "EscalationLevel" "Escalation Level" "Choice"
Add-Field $EscalationList "EscalatedTo" "Escalated To" "User"
Add-Field $EscalationList "EscalationDate" "Escalation Date" "DateTime"
Add-Field $EscalationList "EscalationReason" "Escalation Reason" "Note"

Write-Host "Service request and SLA solution provisioned successfully."

Disconnect-PnPOnline
