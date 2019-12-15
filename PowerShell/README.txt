Steps to setup so you can run these on your machine.
1) Powershell cmdlets won't run by default.  You need to change the Execution Policy
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6

You can change the Execution Policy only for the current session
pwsh.exe -ExecutionPolicy Unrestricted

2) Install the PowerShell module
https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-3.1.0

3) Connect
# Connect to Azure with a browser sign in token
Connect-AzAccount

