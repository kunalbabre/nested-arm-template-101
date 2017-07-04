Login-AzureRmAccount 

$uniqueString = "e228086e"
$baseURI ="https://$($uniqueString).ngrok.io"

$resourceGroupName = "NestedTemplate-Test-RG-$($uniqueString)"
$templateFile ="$($baseURI)/azuredeploy.json"
$paramFile ="$($baseURI)/azuredeploy.parameters.json"
$location = "North Europe"


New-AzureRmResourceGroup -Location "$location" -Name "$resourceGroupName" -Force

New-AzureRmResourceGroupDeployment  -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParameterFile $paramFile -sp-location "$location" -sp-baseURI $baseURI -sp-uniqueString $uniqueString -Verbose

#Remove-AzureRmResourceGroup -Name "$resourceGroupName" -Force