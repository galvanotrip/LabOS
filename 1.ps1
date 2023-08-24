$log_path = "C:\unused_space_log.txt"
$disk_letter = "C:"
$date_time = Get-Date

while($true)
{

	#will get free disk space and totall disk size
	$disk_space = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$disk_letter'" | Select-Object FreeSpace,Size
	
	#will calc percent of free space
	$free_space_percent = (($disk_space.FreeSpace / $disk_space.Size) * 100)
	Write-Host $free_space_percent
	
	#if free_space_percent < 10%
	if($free_space_percent -lt 10)
	{
	    Add-Content -Path $log_path -Value "$date_time - Unused disk space: $free_space_percent%"
	}
#debugging line
#	Add-Content -Path $log_path -Value "$date_time - Unused disk space is: $free_space_percent%"

	Start-Sleep -Seconds 300
}
