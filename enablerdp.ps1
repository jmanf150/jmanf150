# Enable Remote Desktop
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\' -Name "fDenyTSConnections" -Value 0

# Enable the RDP firewall rule for TCP port 3389
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Optional: Restart RDP service to apply changes (uncomment if needed)
# Restart-Service -Name TermService -Force

# Verify RDP status
$rdpStatus = Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\' -Name "fDenyTSConnections"
if ($rdpStatus.fDenyTSConnections -eq 0) {
    Write-Host "Remote Desktop is enabled."
} else {
    Write-Host "Failed to enable Remote Desktop."
}
