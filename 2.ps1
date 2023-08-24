$folder_path = "C:\test_folder"

#will get list of *.txt files
$txt_files = Get-ChildItem -Recurse -Path $folder_path -Filter *.txt
#Write-Host $folder_path.FullName
#Write-Host $txt_files.FullName

#for x in y 
foreach($file in $txt_files)
{
    $new_file_name = $file.FullName.Replace(".txt", ".xml")
    Rename-Item -Path $file.FullName -NewName $new_file_name
}
