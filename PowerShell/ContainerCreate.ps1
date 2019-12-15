
try {

	
	# Create a resource Group
	New-AzResourceGroup -Name myResourceGroup -Location westeurope

	# Create a Container
	New-AzContainerGroup -ResourceGroupName myResourceGroup -Name mycontainer -Image mcr.microsoft.com/windows/servercore/iis:nanoserver -OsType Windows -DnsNameLabel aci-demo-win

	# List the Container
	Get-AzContainerGroup -ResourceGroupName myResourceGroup -Name mycontainer
} catch {

    Write-Host $_
  
}