
try {

	Remove-AzContainerGroup -ResourceGroupName myResourceGroup -Name mycontainer
	
} catch {

    Write-Host $_
  
}