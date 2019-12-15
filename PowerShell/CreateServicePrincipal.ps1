###
# Sign into my Azure account and create a Service Principal Name
# Reference material is 
# https://docs.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-2.4.0
###

Import-Module Az.Resources # Imports the PSADPasswordCredential object

$spName = "ScottsPowerShellSP"
$spPassword = "S33ada33377scott"

try {


    Connect-AzAccount
    # $sp = Get-AzADServicePrincipal -ServicePrincipalName $spName

    # if ($sp) {
        # throw "Service Principal " + $spName + " already exists"
    # }

    $credentials = New-Object Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential -Property @{ StartDate = Get-Date; EndDate = Get-Date -Year 2024; Password = $spPassword }
    
     # Create a new Service Princpal 
    $sp = New-AzAdServicePrincipal -DisplayName $spName -PasswordCredential $credentials 

    $tenant = (Get-AzContext).Tenant.Id
   
    
    # Write-Host "Service Principle " + $sp.DisplayName + "Created In Tenant: " + 
    Write-Host "Tenant ID: " + $tenant



}
catch {
    Write-Host $_
}


