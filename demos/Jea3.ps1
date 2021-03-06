﻿<#
in jeamodule.psrc


VisibleCmdlets = 'Clear-Host','Exit-PSSession','Get-Command','Get-FormatData','Get-Help','Measure-Object','Out-Default','Select-Object', 'Get-Service',
@{ Name = 'Restart-Service'; Parameters = @{ Name = 'Name'; ValidateSet = 'bits' } },
@{ Name = 'Stop-Service'; Parameters = @{ Name = 'Name'; ValidateSet = 'bits' } },
@{ Name = 'Start-Service'; Parameters = @{ Name = 'Name'; ValidateSet = 'bits' } }

#>

$VmName = 'jeaDemo'
$secpasswd = ConvertTo-SecureString "RAND0m1" -AsPlainText -Force
$AdminCred = New-Object System.Management.Automation.PSCredential ("Administrator", $secpasswd)
$AliceCred = New-Object System.Management.Automation.PSCredential ("alice", $secpasswd)
$DaveCred = New-Object System.Management.Automation.PSCredential ("dave", $secpasswd)
$HarryCred  = New-Object System.Management.Automation.PSCredential ("harry", $secpasswd)
$StuartCred = New-Object System.Management.Automation.PSCredential ("stuart", $secpasswd)

$AdminSess = New-PsSession -VmName $VmName -Credential $AdminCred


$jeasession = New-PSSession -VMName 'jea server' -ConfigurationName JeaModule -Credential $harrycred
Import-PSSession -Session $jeasession -Prefix JEA 

Get-JeaService -name bits
Get-Service -name bits
Stop-JeaService -name bits
Get-JeaService -name bits
Get-Service -name bits
