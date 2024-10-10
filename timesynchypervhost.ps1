# Define NTP servers for the host to sync with (external NTP servers)
$NtpServers = "0.pool.ntp.org,1.pool.ntp.org,2.pool.ntp.org,3.pool.ntp.org"

# Set the Hyper-V host to sync with external NTP servers
w32tm /config /manualpeerlist:$NtpServers /syncfromflags:manual /reliable:YES /update

# Enable the NTP service to act as a server for the network
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer" -Name "Enabled" -Value 1

# Set other recommended NTP client settings for the host
w32tm /config /reliable:YES
w32tm /config /update

# Restart the Windows Time service for changes to take effect
Restart-Service w32time

# Force synchronization with the NTP servers to verify the configuration
w32tm /resync

# Output the current time settings to verify configuration
w32tm /query /status
