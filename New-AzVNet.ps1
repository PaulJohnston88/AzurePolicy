$networkSecurityGroup =  Get-AzNetworkSecurityGroup -Name CORP-WEU-NSG-001

$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet `
    -AddressPrefix "172.0.1.0/24" -NetworkSecurityGroup $networkSecurityGroup

$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet `
    -AddressPrefix "172.0.2.0/24" -NetworkSecurityGroup $networkSecurityGroup

New-AzVirtualNetwork -Name TEST-VNET-LZ1-CORP-001 -ResourceGroupName CORP `
    -Location 'West Europe' -AddressPrefix "172.0.0.0/16" -Subnet $frontendSubnet,$backendSubnet