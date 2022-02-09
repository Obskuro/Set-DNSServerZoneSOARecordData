function Set-DNSServerZoneSOARecordData {
[cmdletbinding()]
Param (
    [Parameter(Mandatory=$true,
    Position=0,
    ValueFromPipeline=$false)]
    [ValidateNotNullOrEmpty()]
    [string]$ZoneName,`
    [int]$RefreshInterval,`
    [int]$RetryDelay,`
    [int]$ExpireLimit,`
    [int]$MinimumTimeToLive,`
    [string]$PrimaryServer,`
    [string]$ResponsiblePerson
)

Write-Verbose $( "ZoneName:" + $ZoneName)

$oldsoa = Get-DnsServerResourceRecord -ZoneName $ZoneName -Name “@” -RRType Soa
$newsoa = $oldsoa.Clone()

if ($RefreshInterval) {$newsoa.RecordData.RefreshInterval = New-TimeSpan -Seconds $RefreshInterval
    Write-Verbose $("RefreshInterval changed from " + $oldsoa.RecordData.RefreshInterval + " to " + $newsoa.RecordData.RefreshInterval)}
if ($RetryDelay) {$newsoa.RecordData.RetryDelay = New-TimeSpan -Seconds $RetryDelay
    Write-Verbose $("RetryDelay changed from " + $oldsoa.RecordData.RetryDelay + " to " + $newsoa.RecordData.RetryDelay)}
if ($ExpireLimit) {$newsoa.RecordData.ExpireLimit = New-TimeSpan -Seconds $ExpireLimit
    Write-Verbose $("ExpireLimit changed from " + $oldsoa.RecordData.ExpireLimit + " to " + $newsoa.RecordData.ExpireLimit)}
if ($MinimumTimeToLive) {$newsoa.RecordData.MinimumTimeToLive = New-TimeSpan -Seconds $MinimumTimeToLive
    Write-Verbose $("MinimumTimeToLive changed from " + $oldsoa.RecordData.MinimumTimeToLive + " to " + $newsoa.RecordData.MinimumTimeToLive)}
if ($PrimaryServer) {$newsoa.RecordData.PrimaryServer = $PrimaryServer
    Write-Verbose $("PrimaryServer changed from " + $oldsoa.RecordData.PrimaryServer + " to " + $newsoa.RecordData.PrimaryServer)}
if ($ResponsiblePerson) {$newsoa.RecordData.ResponsiblePerson = $ResponsiblePerson
    Write-Verbose $("ResponsiblePerson changed from " + $oldsoa.RecordData.ResponsiblePerson + " to " + $newsoa.RecordData.ResponsiblePerson)}


Set-DnsServerResourceRecord -OldInputObject $oldsoa -NewInputObject $newsoa -ZoneName $ZoneName -PassThru
}
Export-ModuleMember -Function Set-DNSServerZoneSOARecordData -Alias Set-SOA

