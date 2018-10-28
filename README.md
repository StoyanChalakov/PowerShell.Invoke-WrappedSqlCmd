# PowerShell.Invoke-WrappedSqlCmd
This PowerShell function can be used in SMA as a replacement of the Invoke-Sqlcmd cmdlet for automating SQL related operations. When used by multiple runbooks or scripts (SMA 2016) the Invoke-Sqlcmd cmdlet is known to fail, because it is not "thread safe".
