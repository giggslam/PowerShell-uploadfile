$WatinPath = 'C:\Temp\WatiN-2.1.0.1196\bin\net40\WatiN.Core.dll'	#path with downloaded assembly
$watin     = [Reflection.Assembly]::LoadFrom( $WatinPath )

$file2upload = "C:\temp\File2Upload.jpg"

#Set the URL we want to navigate to
$url = "http://www.chatbot.hk/System/fileupload/upload.html" 

$ie = new-object WatiN.Core.IE($url)
$file1 = $ie.FileUpload('fileToUpload')	#id of the input
$file1.set($file2upload)				# path to the file

# and now just find the button and click on it
#$o = $ie.Button | ? { $_.GetAttributeValue("name") -eq 'submit' }
$o = $ie.Button('submit') #send is id of the submit button

$o.Click()