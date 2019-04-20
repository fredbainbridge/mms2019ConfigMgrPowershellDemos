Import-Module C:\source\mmsSQL -Force
Import-Module C:\source\mmsConfigMgr -Force

$Connection = New-mmsSqlConnection -ServerName "CM1" -DatabaseName "CM_LAB"
$result = Invoke-mmsSqlCommand -Connection $Connection -Query "SELECT resourceID FROM v_r_system WHERE name0 = 'VM1'" -ReturnResults
$result
$result.ResourceID

New-mmsConfigMgrDirectMembershipRule -ResourceID $result.resourceID -CollectionID "LAB00014"

Get-mmsConfigMgrScript -ScriptName 'Shutdown Device'
Get-mmsConfigMgrClientStatus -ResourceID $result.resourceID

Invoke-mmsConfigMgrScript -ScriptName 'Shutdown Device' -LimitingCollectionID "LAB00014" -ResourceID $result.resourceID