# Site configuration
$SiteCode = "LAB" # Site code 
$ProviderMachineName = "CM1.lab.lab" # SMS Provider machine name

Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 

# Connect to the site's drive if it is not already present
if($null -eq (Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue)) {
    New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
}

# Set the current location to be the site code.
Set-Location "$($SiteCode):\" @initParams

# navigate the psdrive.  its cool
Get-Command -Module ConfigurationManager
(Get-Command -Module ConfigurationManager).Count
