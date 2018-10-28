function Invoke-WrappedSqlCmd  { 
[CmdletBinding()] 
param ( 
[string] $ServerInstance, 
[Parameter(Mandatory=$false)] 
[string] $Database, 
[Parameter(Mandatory=$false)] 
[string] $EncryptConnection, 
[Parameter(Mandatory=$false)] 
[string] $Username, 
[Parameter(Mandatory=$false)] 
[string] $Password, 
[Parameter(Mandatory=$false)] 
[string] $Query, 
[Parameter(Mandatory=$false)] 
[Int32] $QueryTimeout, 
[Parameter(Mandatory=$false)] 
[Int32] $ConnectionTimeout, 
[Parameter(Mandatory=$false)] 
[Int32] $ErrorLevel, 
[Parameter(Mandatory=$false)] 
[Int32] $SeverityLevel, 
[Parameter(Mandatory=$false)] 
[Int32] $MaxCharLength, 
[Parameter(Mandatory=$false)] 
[Int32] $MaxBinaryLength, 
[Parameter(Mandatory=$false)] 
[switch] $AbortOnError, 
[Parameter(Mandatory=$false)] 
[switch] $DedicatedAdministratorConnection, 
[Parameter(Mandatory=$false)] 
[switch] $DisableVariables, 
[Parameter(Mandatory=$false)] 
[switch] $DisableCommands, 
[Parameter(Mandatory=$false)] 
[string] $HostName, 
[Parameter(Mandatory=$false)] 
[string] $NewPassword, 
[Parameter(Mandatory=$false)] 
[string[]] $Variable, 
[Parameter(Mandatory=$false)] 
[string] $InputFile, 
[Parameter(Mandatory=$false)] 
[bool] $OutputSqlErrors, 
[Parameter(Mandatory=$false)] 
[switch] $IncludeSqlUserErrors, 
[Parameter(Mandatory=$false)] 
[switch] $SuppressProviderContextWarning, 
[Parameter(Mandatory=$false)] 
[switch] $IgnoreProviderContext, 
[Parameter(Mandatory=$false)] 
[Microsoft.SqlServer.Management.PowerShell.OutputType] $OutputAs, 
[Parameter(Mandatory=$false)] 
[string] $ConnectionString 
) 
try  { 
# Locking on some random type that should be available everywhere.. 
[System.Threading.Monitor]::Enter([guid]) 
$ReturnValue = Invoke-Sqlcmd @PSBoundParameters 
} 
catch  { 
$ErrorMessage = "Error during Invoke-WrappedSqlCmd:$([System.Environment]::NewLine)$_" 
throw $ErrorMessage 
} 
finally  { 
# Exiting the lock 
[System.Threading.Monitor]::Exit([guid]) 
} 

return $ReturnValue 
}
