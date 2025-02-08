Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Sleep 15000  ' Wait for 15 seconds before sending the key
WshShell.SendKeys "n{ENTER}"