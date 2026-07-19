param(
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][string]$ClientId
)

$ErrorActionPreference = "Stop"
$MeetingList = "Enterprise Meetings"
$ActionList = "Meeting Action Register"
$DecisionList = "Meeting Decision Register"

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function Add-Field {
    param([string]$List, [string]$Name, [string]$Title, [string]$Type)

    if (-not (Get-PnPField -List $List -Identity $Name -ErrorAction SilentlyContinue)) {
        Add-PnPField -List $List -InternalName $Name `
            -DisplayName $Title -Type $Type -AddToDefaultView
    }
}

foreach ($list in @($MeetingList, $ActionList, $DecisionList)) {
    if (-not (Get-PnPList -Identity $list -ErrorAction SilentlyContinue)) {
        New-PnPList -Title $list -Template GenericList -OnQuickLaunch
    }
}

Add-Field $MeetingList "MeetingNumber" "Meeting Number" "Text"
Add-Field $MeetingList "MeetingDate" "Meeting Date" "DateTime"
Add-Field $MeetingList "MeetingOwner" "Meeting Owner" "User"
Add-Field $MeetingList "Department" "Department" "Choice"
Add-Field $MeetingList "MeetingType" "Meeting Type" "Choice"
Add-Field $MeetingList "Attendees" "Attendees" "User"
Add-Field $MeetingList "MeetingStatus" "Meeting Status" "Choice"

Add-Field $ActionList "MeetingNumber" "Meeting Number" "Text"
Add-Field $ActionList "ActionItem" "Action Item" "Note"
Add-Field $ActionList "ActionOwner" "Action Owner" "User"
Add-Field $ActionList "DueDate" "Due Date" "DateTime"
Add-Field $ActionList "ActionStatus" "Action Status" "Choice"

Add-Field $DecisionList "MeetingNumber" "Meeting Number" "Text"
Add-Field $DecisionList "DecisionTitle" "Decision Title" "Text"
Add-Field $DecisionList "DecisionOwner" "Decision Owner" "User"
Add-Field $DecisionList "DecisionDate" "Decision Date" "DateTime"
Add-Field $DecisionList "DecisionDetails" "Decision Details" "Note"

Write-Host "Meeting governance solution provisioned successfully."

Disconnect-PnPOnline
