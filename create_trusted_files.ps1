Param(
    [string]$in,
    [string]$out
)

$xml = @'
<?xml version="1.0" encoding="UTF-8"?>
<KAV-WSEE-Settings xmlns="urn:kaspersky.com/products/wsee/8.0/export/settings">
  <ProductInfo>
    <ProductName>WSEE</ProductName>
    <ProductVersion>8.0.0.0</ProductVersion>
  </ProductInfo>
  <Settings>
    <TrustedZone>
      <__VersionInfo>
        <element>1</element>
        <element>1</element>
      </__VersionInfo>
      <TrustedProcessesEnabled>no</TrustedProcessesEnabled>
      <TrustedProcesses>
      </TrustedProcesses>
      <TrustAllBackupReadOperations>yes</TrustAllBackupReadOperations>
      <ExclutionRules>
'@
$xml | out-file $out -encoding utf8
foreach($line in Get-Content $in)
{  $xml = "<element>
    <__VersionInfo>
      <element>1</element>
      <element>4</element>
    </__VersionInfo>
    <Enabled>yes</Enabled>
    <UseObjects>yes</UseObjects>
    <Objects>
      <element>
        <__VersionInfo>
          <element>1</element>
          <element>0</element>
        </__VersionInfo>
        <Type>4</Type>
        <Path>$line</Path>
      </element>
    </Objects>
    <UseThreatNameMasks>no</UseThreatNameMasks>
    <ThreatNameMasks>
    </ThreatNameMasks>
    <ApplyForFileMonitor>yes</ApplyForFileMonitor>
    <ApplyForOnDemandScan>yes</ApplyForOnDemandScan>
    <ApplyForScriptChecker>no</ApplyForScriptChecker>
    <Description>$line</Description>
    <ApplyForNetAppMonitor>yes</ApplyForNetAppMonitor>
    <ApplyForICAPScanner>no</ApplyForICAPScanner>
  </element>"
  $xml | out-file $out -encoding utf8 -Append
}

$xml = @'
</ExclutionRules>
</TrustedZone>
</Settings>
</KAV-WSEE-Settings>
'@
$xml | out-file $out -encoding utf8 -Append
