Before and After Collection/Parsing

Collect Parse Differential

Live Monitoring

Watch File System Events · Process
Monitor, etc.

Monitor for ·Not artifact specific Understanding ·High level overview

Monitor for Triggering

·Perform action on a high level event
·Artifact specific

Value
USN_REASON_DATA_EXTEND 0x00000002 USN_REASON_DATA_OVERWRITE 0x00000001 USN_REASON_DATA_TRUNCATION 0x00000004 USN_REASON_FILE_CREATE 0x00000100 USN_REASON_FILE_DELETE 0x00000200 USN_REASON_RENAME_NEW_NAME 0x00002000 USN_REASON_RENAME_OLD_NAME 0x00001000

Meaning
The file or directory is extended (added to).
The data in the file or directory is overwritten.
The file or directory is truncated.
The file or directory is created for the first time.
The file or directory is deleted. A file or directory is renamed, and the file name in the USN_RECORD_V2 structure is the new name. The file or directory is renamed, and the file name in the USN_RECORD_V2 structure is the previous name.

Uses a callback system

Unlike USN listening method

Allows you to use queries for Event filtering (XPath 1.0 query or structured XML query)

Uses a callback system like Windows Events API Allows you to select which Providers and filters to use Complicated system

Artifact USN
MFT
Registry
Windows Events Event Tracing

Windows API DeviceIoControl

Control Code or Filters
FSCTL_READ_USN_JOURNAL

Description
Retrieves the set of update sequence number (USN) change journal records between two specified USN values

DeviceIoControl

FSCTL_GET_NTFS_FILE_RECORD

Retrieves the first file record that is in use and is of a lesser than or equal ordinal value to the requested file reference number

RegNotifyChangeKeyValue REG_NOTIFY_CHANGE_NAME |

Notifies the caller about changes to the attributes or

REG_NOTIFY_CHANGE_ATTRIBUTES | REG_NOTIFY_CHANGE_LAST_SET |

contents of a specified registry key

REG_NOTIFY_CHANGE_SECURITY

EvtSubscribe ...

Query (XPath 1.0 queryor structured XML Creates a subscription that will receive current and

query)

future events from a channel or log file that match

the specified query criteria

OpenTrace ProcessTrace ...

The ProcessTrace function delivers events from one or more event tracing sessions to the consumer

Windows APIs

ETW USN Registry

Mac APIs

fsevents

Linux APIs

inotify

