# Get the current version of Firefox
    $currentVersion = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Mozilla\Mozilla Firefox' | Select 'CurrentVersion').CurrentVersion
 
 
    # Get the latest version of Firefox
    $latestVersion = ( Invoke-WebRequest  "https://product-details.mozilla.org/1.0/firefox_versions.json" -UseBasicParsing | ConvertFrom-Json ).LATEST_FIREFOX_VERSION
 
   #Checked the version on the device and on the website.
 if ($currentVersion -lt $latestVersion) {
        Write-Host "Old version of Firefox is installed."
		Exit 1
 
      
    } else {
        Write-Host "Firefox is already up to date."
		
		Exit 0
    }
 

else {
    Write-Host "Firefox is not installed."
	
	Exit 0
}
