# best answer https://stackoverflow.com/questions/12368142/powershell-retrieving-a-variable-from-a-text-file
$var_file = ".\sample-vars.txt"
# parse file and initialize new variables by name and assign values. This works, but is sensitive to blank lines in vars file, need break if $var[0]=''
$vars = Get-Content $var_file | Foreach-Object {
    $var = $_.Split('=')
    New-Variable -Name $var[0] -Value $var[1]
} 

# test import from file
Write-Host "# New imported vars"
$foo
$bar
$my_object

# my object. in vars file, json needs to be one line else won't import correctly.
Write-Host "# my object. in vars file, json needs to be one line else won't import correctly"
$imported_object = $my_object | ConvertFrom-Json
$imported_object

# #prints complete json as string
Write-Host "# prints object as string"
Write-Host $imported_object

#prints object table
Write-Host "# prints object table"
$imported_object.user

<#
# #selects first object value
Write-Host "# prints first object value"
$imported_object.user.name[0]

# iterate through object and print specific value
Write-Host "# iterate through object and print specific value"
$imported_object.user | ForEach-Object {
    Write-Host $_.name
}

# get-member
#from NoteProperty MemberType we get the first level of the object
Write-Host "# NoteProperty MemberType we get the first level of the object"
$imported_object | Get-Member

#from NoteProperty MemberType we get the second level properties of the first level object first entry as example
Write-Host "# from NoteProperty MemberType we get the second level properties of the first level object first entry as example"
$imported_object.user | Get-Member
#>