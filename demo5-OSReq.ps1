Import-Module C:\source\mmsSQL -Force
Import-Module C:\source\mmsConfigMgr -Force

Add-mmsConfigMgrApplicationDeploymentTypeOSRequirement -ApplicationName "Google Chrome" -Requirement 'All Windows 10 (64-bit)'