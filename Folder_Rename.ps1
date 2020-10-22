#Assumptions;

#You open powershell in the top directory

#by first item, you mean, first file alphabetically

#if you have folders in folders, this only does the first layer

#duplicate names add '-duplicate' to folder name



$folders =  Get-ChildItem 
foreach ($folder in $folders)
{
    $file = Get-ChildItem -path $folder | Where-Object {! $_.PSIsContainer} | Select-Object -First 1 | ForEach-Object {[system.io.path]::GetFileNameWithoutExtension($_.Name)}
    if (Test-Path $file){
    #folder name exists
    $duplicate = "-duplicate"
    $file = $file + $duplicate
    Rename-Item $folder $file
    }else{
    Rename-Item $folder $file
    }

}