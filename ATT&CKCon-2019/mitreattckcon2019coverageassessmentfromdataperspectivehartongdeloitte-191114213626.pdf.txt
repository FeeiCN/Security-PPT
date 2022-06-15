ATT&CK coverage assessment from a data perspective

[T1033] Whoami

Olaf Hartong
Blue Team Specialist Leader
Currently having fun @

ABOUT ME
13+ years in Info Security Consulted at banks, educational institutions and governmental organizations
·Built and/or led Security Operations Centers ·Threat hunting, IR and Compromise assessment engagements ·SOC Maturity engagements Documentary photographer Dad of 2 boys
@olafhartong github.com/olafhartong ohartong@deloitte.nl

MITRE ATT&CK

Current coverage

Toolkit

+

=

Toolkit

· Reference workbook · Weights workbook · Rating workbook

Data source weights workbook

Rating workbook

PowerShell module

function Get-ATTACKdata {
<# .SYNOPSIS Downloads the MITRE ATT&CK Enterprise JSON file #>
function Invoke-ATTACKUpdateExcel {
<# .SYNOPSIS Generates MITRE ATT&CK relevant fields into a table and creates or updates a worksheet in an Excel file #>
function Request-ATTACKjson {
<# .SYNOPSIS Generates a JSON file to be imported into the ATT&CK Navigator. Based on a template and a filled Excel file #>

function Request-ApplicationJSON {
<# .SYNOPSIS Generates a technique applicability JSON file to be imported into the ATT&CK Navigator. #>
function Request-DefenseJSON {
<# .SYNOPSIS Generates a Defense Bypassed rating JSON file to be imported into the ATT&CK Navigator. #>

Demo

ATT&CK Caveats
· Be aware that you will NOT be able to cover all techniques with an alerting use case, basically you can dissect them into 3 categories of use;
· Alerting · Hunting · Incident Response & Forensics

ATT&CK Caveats
Alerting

Hunting

Forensics

Technique application workbook

Sysmon potential coverage
Mind you, this is purely based on its potential. In practice this will be less due to performance reasons and current configuration limitations.

Sysmon actual coverage

Defense Mitigation workbook

Roadmap

[Alpha] Graph modeled assessment

Thank you
github.com/olafhartong/ATTACKdatamap
Questions?
@olafhartong github.com/olafhartong ohartong@deloitte.nl

