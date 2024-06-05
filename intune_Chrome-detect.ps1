# Get the current version of Google Chrome
    $currentVersion = (Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo.Productversion
 
 
    # Get the latest version of Google Chrome
    $latestVersion = (Invoke-RestMethod -Uri "https://chromiumdash.appspot.com/fetch_releases?channel=Stable&platform=Windows&num=1").version
 
   #Checked the version on the device and on the website.
 if ($currentVersion -lt $latestVersion) {
        Write-Host "Old version of Chrome is installed."
		Exit 1
 
      
    } else {
        Write-Host "Google Chrome is already up to date."
		
		Exit 0
    }
 

else {
    Write-Host "Google Chrome is not installed."
	
	Exit 0
}
