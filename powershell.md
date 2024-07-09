# PowerShell

## Commands Cheat Sheet
| Command | Description |
|---|---|
| `Get-Childitem -Recurse -Include *.config \| Select ResolvedTarget` | To search for files |
| `Get-ChildItem -Recurse \| Select-String "dummy" -List \| Select Path, LineNumber` | To search for files containing certain string using PowerShell |
  
