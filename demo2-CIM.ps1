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

#maybe add member 
#wbemtest.exe root\SMS\site_LAB to see all the available classes and methods you can work with.