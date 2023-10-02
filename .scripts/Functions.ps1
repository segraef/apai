# Function to clone the runner-images repository
function Copy-Repository {
    param (
        [string]$workingDirectory
    )
    Write-Output "Cloning https://github.com/actions/runner-images into $workingDirectory"
    git clone https://github.com/actions/runner-images
    exit
}

# Function to generate the specified image
function New-Image {
    param (
        [string]$workingDirectory = $pwd,
        [string]$subscriptionId,
        [string]$tenantId = $env:tenantId,
        [string]$servicePrincipalId = $env:servicePrincipalId,
        [string]$servicePrincipalKey = $env:servicePrincipalKey,
        [string]$resourceGroupName,
        [string]$imageType,
        [string]$location,
        [string]$debugPacker
    )

    $verbosePreference = "Continue"
    Write-Output "Generate image $imageType in $resourceGroupName"
    Import-Module $workingDirectory\runner-images\helpers\GenerateResourcesAndImage.ps1
    Set-Location $workingDirectory\runner-images
    if ($debugPacker -eq 'true') {
        $env:PACKER_LOG = 1
    }
    GenerateResourcesAndImage `
        -SubscriptionId $subscriptionId `
        -ResourceGroupName $resourceGroupName `
        -ImageType $imageType `
        -AzureLocation $location `
        -AzureTenantId $tenantId `
        -AzureClientId $servicePrincipalId `
        -AzureClientSecret $servicePrincipalKey `
        -Force
}

# Function to create a VMSS with the specified image
function New-VMSS {
    param (
        [string]$resourceGroupName,
        [string]$resourceGroupNameImage,
        [string]$imageType,
        [string]$location
    )

    Write-Output "Create/Update resource group $resourceGroupName"
    az group create --name $resourceGroupName --location $location
    $currentSubscription = az account show --query 'id' -o tsv
    Write-Output "Current subscription: $currentSubscription"
    $imageID = "/subscriptions/$currentSubscription/resourceGroups/$resourceGroupNameImage/providers/Microsoft.Compute/images/Runner-Image-$imageType"
    Write-Output "Create VMSS apa-$imageType in $resourceGroupName with image: $imageID"
    az vmss create `
        --name "apa-$imageType" `
        --resource-group $resourceGroupName `
        --image $imageID `
        --vm-sku Standard_D2_v3 `
        --storage-sku StandardSSD_LRS `
        --authentication-type SSH `
        --instance-count 2 `
        --disable-overprovision `
        --upgrade-policy-mode manual `
        --single-placement-group false `
        --platform-fault-domain-count 1 `
        --load-balancer '""' `
        --vnet-name apa-vnet `
        --vnet-address-prefix 10.1.1.0/24 `
        --subnet snet-release-agents `
        --subnet-address-prefix 10.1.1.0/24 `
        --generate-ssh-keys
}

# Function to update a VMSS with a new image
function Update-VMSS {
    param (
        [string]$resourceGroupName,
        [string]$resourceGroupNameImage,
        [string]$imageType
    )

    $currentSubscription = az account show --query 'id' -o tsv
    Write-Output "Current subscription: $currentSubscription"
    $imageID = "/subscriptions/$currentSubscription/resourceGroups/$resourceGroupNameImage/providers/Microsoft.Compute/images/Runner-Image-$imageType"
    Write-Output "Update VMSS Image in $resourceGroupName with image: $imageID"
    az vmss update `
        --resource-group $resourceGroupName `
        --name "apa-$imageType" `
        --set "virtualMachineProfile.storageProfile.imageReference.id=$imageID"
}
