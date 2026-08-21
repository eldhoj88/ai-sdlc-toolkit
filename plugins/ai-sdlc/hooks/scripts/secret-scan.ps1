# Secret scan hook — runs after Write/Edit; blocks likely secrets from landing in files.
# Exit 2 => finding reported back to Claude for self-correction. Exit 0 => clean/skip.
$ErrorActionPreference = 'SilentlyContinue'

$payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
$filePath = $payload.tool_input.file_path
if (-not $filePath -or -not (Test-Path $filePath)) { exit 0 }

# Skip binary-ish and lock files
if ($filePath -match '\.(png|jpg|jpeg|gif|pdf|zip|dll|exe|lock)$') { exit 0 }

$content = Get-Content -Raw -LiteralPath $filePath
if (-not $content) { exit 0 }

$patterns = @(
    @{ Name = 'Azure DevOps PAT';        Regex = '\b[a-z2-7]{52}\b' },
    @{ Name = 'AWS access key';          Regex = 'AKIA[0-9A-Z]{16}' },
    @{ Name = 'Private key block';       Regex = '-----BEGIN [A-Z ]*PRIVATE KEY-----' },
    @{ Name = 'Generic API key/secret';  Regex = '(?i)(api[_-]?key|client[_-]?secret|password)\s*[:=]\s*["'']?[A-Za-z0-9+/_\-]{16,}' },
    @{ Name = 'Connection string';       Regex = '(?i)(AccountKey|SharedAccessSignature|pwd)\s*=\s*[^;\s"]{12,}' },
    @{ Name = 'Anthropic API key';       Regex = 'sk-ant-[A-Za-z0-9\-_]{20,}' }
)

$findings = @()
foreach ($p in $patterns) {
    if ($content -match $p.Regex) { $findings += $p.Name }
}

if ($findings.Count -gt 0) {
    [Console]::Error.WriteLine("SECRET SCAN: possible secret(s) in ${filePath}: $($findings -join ', '). Remove the value, reference Key Vault or an environment variable instead, and rotate the credential if it was real.")
    exit 2
}
exit 0
