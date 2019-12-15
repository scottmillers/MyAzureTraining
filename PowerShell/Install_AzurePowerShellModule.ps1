###
# Use PowerShell Core
# Install the Azure PowerShell Module and remove the previous one
# 
###


try {

    Write-Host $PSVersionTable.PSVersion
    
    # Install Az module.  
    Install-Module -Name Az -AllowClobber -Scope CurrentUser

    # Verify the install was successful
    Get-InstalledModule -Name Az -AllVersions | select Name,Version

    # Make sure AzRM module is not installed.  If it is then do Uninstall-AzRm. See below
    # Get-Command -Verb Get -Noun AzVM* -Module Az.Compute

    # These need to be run as Administrator to remove AzRm modules. See
    # https://azure.microsoft.com/en-us/blog/how-to-migrate-from-azurerm-to-az-in-azure-powershell/
    # Uninstall-AzureRm -PassThru

}
catch {
    Write-Host $_
}


