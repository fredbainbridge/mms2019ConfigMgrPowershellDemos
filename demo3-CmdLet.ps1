Set-Location c:

Import-Module C:\source\mmsSQL -Force  #These should be in your module path.
Import-Module C:\source\mmsConfigMgr -Force


Get-Module
Get-Command -Module mmsSQL
$Connection = New-mmsSqlConnection -ServerName CM1 -DatabaseName CM_LAB
Invoke-mmsSqlCommand -Connection $Connection -Query "SELECT * FROM v_r_system" -ReturnResults 

Get-Command -Module mmsConfigMgr

$resourceID = '16777219'
$collectionID = "LAB00014"
New-mmsConfigMgrDirectMembershipRule -ResourceID $resourceID -CollectionID $collectionID -Verbose