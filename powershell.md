# PowerShell

## Commands Cheat Sheet
| Command | Description |
|---|---|
| `Get-Childitem -Recurse -Include *.config \| Select ResolvedTarget` | To search for files |
| `Get-ChildItem -Recurse \| Select-String "dummy" -List \| Select Path, LineNumber` | To search for files containing certain string using PowerShell |
| `Get-Content (Get-PSReadlineOption).HistorySavePath` | To get history of PowerShell commands executed. Alternatively, you can run `(Get-PSReadlineOption).HistorySavePath` and look at the history file directly as well |
