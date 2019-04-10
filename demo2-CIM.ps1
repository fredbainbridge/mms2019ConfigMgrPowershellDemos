#WBEM Test root\SMS\site_LAB

$SiteCode = "LAB" # Site code 
$ProviderMachineName = "CM1.lab.lab" # SMS Provider machine name
#CIM Example
$CIMSession = New-CimSession -ComputerName $ProviderMachineName -ErrorAction Stop
$CIMParams = @{
    "NameSpace" = "root\SMS\site_$($SiteCode)";
    "ClassName" = "SMS_Script"
}
try {
    $CimQueryResults = Get-CimInstance -CimSession $CIMSession @CIMParams  -ErrorAction Stop
}
catch {
    Write-Warning "Unable to connect to the SMS Provider."
}
$CimQueryResults

#maybee add member 