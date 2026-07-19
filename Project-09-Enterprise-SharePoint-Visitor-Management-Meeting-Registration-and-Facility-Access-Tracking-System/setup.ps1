param(
[string]$SiteUrl,
[string]$ClientId
)

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

$List="Visitor Management"

if(!(Get-PnPList -Identity $List -ErrorAction SilentlyContinue)){
New-PnPList -Title $List -Template GenericList -OnQuickLaunch
}

$f=@(
"Visitor ID","Visitor Name","Company",
"Host","Visit Date","Purpose",
"Check In","Check Out","Status","Badge Number"
)

foreach($c in $f){
if(!(Get-PnPField -List $List -Identity $c.Replace(" ","") -ErrorAction SilentlyContinue)){
Add-PnPField `
-List $List `
-DisplayName $c `
-InternalName $c.Replace(" ","") `
-Type Text `
-AddToDefaultView
}
}

Write-Host "Visitor Management Solution Ready"

Disconnect-PnPOnline
