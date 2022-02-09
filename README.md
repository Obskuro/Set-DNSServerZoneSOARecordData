# Set-DNSServerZoneSOARecordData

Comandlet for change RecordData in SOA record.

## For import

```Invoke-WebRequest -OutFile ./Set-SOA.psm1 https://raw.githubusercontent.com/Obskuro/Set-DNSServerZoneSOARecordData/main/Set-SOA.psm1 ; Import-Module ./Set-SOA.psm1; Remove-Item ./Set-SOA.psm1```

## For use

```Set-DNSServerZoneSOARecordData -ZoneName myzone.lo -RefreshInterval 900 -RetryDelay 600 -ExpireLimit 86400 -MinimumTimeToLive 3600 -PrimaryServer addc.myzone.lo -ResponsiblePerson hostmaster.myzone.lo```

*-ZoneName* - mandatory parameter.  
Parameters *-RefreshInterval*, *-RetryDelay*, *-ExpireLimit*, *-MinimumTimeToLive* - in seconds.  
empty parameter(s) - ignored.

You can use parameter *-Verbose* to see changes.
