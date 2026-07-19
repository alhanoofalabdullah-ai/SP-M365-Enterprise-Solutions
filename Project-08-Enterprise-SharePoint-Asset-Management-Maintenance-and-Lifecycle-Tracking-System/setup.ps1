param(
[string]$SiteUrl,
[string]$ClientId
)

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

$List="Enterprise Assets"

if(!(Get-PnPList -Identity $List -ErrorAction SilentlyContinue)){
New-PnPList -Title $List -Template GenericList -OnQuickLaunch
}

$f=@(
"AssetID","Asset Name","Category","Department",
"Owner","Purchase Date","Warranty Expiry",
"Maintenance Date","Status","Location"
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

Write-Host "Enterprise Asset Management Solution Ready"

Disconnect-PnPOnline
