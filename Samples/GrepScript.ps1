filter Grep($keyword)
{
    <#
    .Synopsis
    This function returns items that match the specified keyword.

   .Description
    This function returns items that match the specified keyword.

   .Example
    Get-Alias | Grep get

    Returns those alias with the keyword "get"

   .Example
    Get-ChildItem (Get-Location) -Recurse | Grep .ps1

    Returns a list of ps1 files in the current folder and all subdirectories.

   .Parameter keyword
    The keyword to search for.

   .Notes
    AUTHOR: Doug Hennig

   .Link
    https://doughennig.com
    #>

    if (($_ | Out-String) -like "*$keyword*")
    {
        $_
    }
}
