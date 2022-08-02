ATT&CK coverage assessment  from a data perspective

PS C:\> whoami

Olaf Hartong Blue Team Specialist Leader
Currently having fun @

ABOUT ME
12+ years in Info Security Consulted at banks, educational institutions and governmental organizations
· Built and/or led Security Operations Centers · Threat hunting, IR and Compromise assessment engagements · SOC Maturity engagements Documentary photographer
@olafhartong github.com/olafhartong ohartong@deloitte.nl medium.com/@olafhartong

MITRE ATT&CK

Current coverage

Toolkit

+

=

Toolkit

· Reference workbook · Weights workbook · Rating workbook

PowerShell script

function Get-ATTACKdata { <# .SYNOPSIS Downloads the MITRE ATT&CK Enterprise JSON file #>
function Invoke-ATTACK-UpdateExcel { <# .SYNOPSIS Generates MITRE ATT&CK relevant fields into a table and creates or updates a worksheet in an Excel sheet Requires module ImportExcel, Install it like this PS C:\> Install-Module ImportExcel #>

function Request-ATTACKjson { <# .SYNOPSIS Generates a JSON file to be imported into the ATT&CK Navigator. Based on a template and a filled Excel sheet Requires module ImportExcel, Install it like this PS C:\> Install-Module ImportExcel #>

ATT&CK Caveats
· Be aware that you will NOT be able to cover all techniques with an alerting use case, basically you can dissect them into 3 categories of use; · Alerting · Hunting · Incident Response & Forensics

Sysmon potential coverage
Mind you, this is purely based on its potential. In practice this will be less due to performance reasons and current configuration limitations.



Sysmon actual coverage

Roadmap

Technique applicability Use case scoring
Detection Bypassed weights
Detection rating

Thank you

@olafhartong github.com/olafhartong ohartong@deloitte.nl

Questions?

