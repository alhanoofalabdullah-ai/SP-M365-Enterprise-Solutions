param(
[string]$SiteUrl,
[string]$ClientId
)

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

$List="Enterprise Risk Register"

if(!(Get-PnPList -Identity $List -ErrorAction SilentlyContinue)){
New-PnPList -Title $List -Template GenericList -OnQuickLaunch
}

$f=@(
"Risk ID","Risk Title","Category","Owner",
"Probability","Impact","Risk Score",
"Mitigation Plan","Review Date","Status"
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

Write-Host "Risk Register Solution Ready"

Disconnect-PnPOnline
