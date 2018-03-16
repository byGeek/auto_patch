Clear-Host

$bc_path = "C:\Program Files (x86)\Beyond Compare 4\BCompare.exe"
$directory = "D:\05_temp\server_file"
$bc_script_name = "bc_auto.txt"

Write-Host ("you set beyond compare install path is: " + $bc_path)
Write-Host ("you set folder path is: " + $directory)

$files = get-childitem $directory  -filter v*.zip | where  { $_.Attributes -eq "Archive"}

$maxVersion = 0
$latestFile = 0
$curVersion = 0;

$files | foreach-object {
    #write-host $_.Name
    $curVersion =  [int]($_.Name.Substring(1).Split('.')[0])
    #write-host $curVersion
    if($curVersion -gt $maxVersion)
    {
        $maxVersion = $curVersion
        $latestFile = $_
    }
}

Write-Host ("current max version is: " + $maxVersion)
Write-Host ("current latest version archive is: " + $latestFile.Name)

$files | ForEach-Object {
    if($_.Name -eq $latestFile.Name){
        continue
    }

    $patchName = "patch" + $_.Name.Split('.')[0] + $latestFile.Name.Split('.')[0] + ".zip"
    Write-Host ("start generated patch..." + $patchName)

    $process = ( start-process -PassThru -FilePath $bc_path -WorkingDirectory $directory  `
    -ArgumentList "/silent",("@" + $bc_script_name), $_.Name, $latestFile.Name , $patchName)

    if($process){
        $process.WaitForExit()
    }

    Write-Host "patch generated."

}

Write-Host "all done."
