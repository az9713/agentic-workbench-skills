$ErrorActionPreference = "Stop"

$BundleDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$ClaudeSkillsDir = Join-Path $HOME ".claude\skills"
$WorkspaceDir = Join-Path $HOME "agent-workspace\shared\projects"
$MemoryDir = Join-Path $HOME "agent-workspace\shared\memory"

New-Item -ItemType Directory -Force -Path $ClaudeSkillsDir | Out-Null
New-Item -ItemType Directory -Force -Path $WorkspaceDir | Out-Null
New-Item -ItemType Directory -Force -Path $MemoryDir | Out-Null

Copy-Item -Recurse -Force -Path (Join-Path $BundleDir "skills\*") -Destination $ClaudeSkillsDir

# Seed memory files if missing.
foreach ($file in @("preferences.md", "workflow-defaults.md", "known-frictions.md")) {
    $path = Join-Path $MemoryDir $file
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# Copy project template for reference.
$TemplateDest = Join-Path $WorkspaceDir "_template"
New-Item -ItemType Directory -Force -Path $TemplateDest | Out-Null
Copy-Item -Recurse -Force -Path (Join-Path $BundleDir "workspace-templates\shared\projects\_template\*") -Destination $TemplateDest

Write-Host "Installed Jay E-style Claude Code skills to: $ClaudeSkillsDir"
Write-Host "Created shared workspace at: $WorkspaceDir"
Write-Host "Restart Claude Code if skills are not visible immediately."
