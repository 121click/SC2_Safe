# Please Stop messing with the cache files, Blizzard!
# Base code from dàgē in china, edited for directory creation by CasterNGO

$CachePath = 'C:\ProgramData\Blizzard Entertainment\Battle.net\Cache'

# Maximum file size in bytes (100KB)
$MaxFileSizeBytes = 100KB

# Get all .s2ml files in the cache folder with size greater than 100KB
Write-Host "Searching for .s2ml files larger than 100KB in the cache folder..."
Get-ChildItem -Path $CachePath -Include *.s2ml -Recurse | Where-Object { $_.Length -gt $MaxFileSizeBytes } | ForEach-Object {
    # Get the directory path
    $directoryPath = Split-Path -Path $_.FullName -Parent

    # Extract the file name (including extension)
    $fileName = Split-Path -Path $_.FullName -Leaf

    # Delete the original file
    Remove-Item -Path $_.FullName -Force
    Write-Host "Original file deleted: $($_.FullName)"

    # Create the directory with the same name as the file (including extension)
    $directoryName = Join-Path -Path $directoryPath -ChildPath $fileName
    New-Item -Path $directoryName -ItemType Directory -Force
    Write-Host "Directory created: $directoryName"
}
Write-Host "I can fix anything!"
