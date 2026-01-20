# =============================================================================
# Project: <project_name>
# Description: Development environment initialization script (Windows)
# =============================================================================

$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting <project_name> development environment..." -ForegroundColor Cyan

# --- Dependency Installation ---
# Uncomment/modify based on your stack:

# Node.js projects:
# if (Test-Path "package.json") {
#     Write-Host "📦 Installing Node.js dependencies..." -ForegroundColor Yellow
#     npm install
# }

# Python projects:
# if (Test-Path "requirements.txt") {
#     Write-Host "🐍 Installing Python dependencies..." -ForegroundColor Yellow
#     pip install -r requirements.txt
# }

# Rust projects:
# if (Test-Path "Cargo.toml") {
#     Write-Host "🦀 Building Rust project..." -ForegroundColor Yellow
#     cargo build
# }

# .NET projects:
# if (Test-Path "*.csproj") {
#     Write-Host "🔷 Restoring .NET dependencies..." -ForegroundColor Yellow
#     dotnet restore
# }

# --- Install system dependencies via winget (if needed) ---
# Example:
# winget install --id=OpenJS.NodeJS -e --accept-source-agreements --accept-package-agreements

# --- Start Development Server ---
# Modify based on your stack:

# Node.js:
# Start-Process -NoNewWindow npm -ArgumentList "run", "dev"

# Python Flask:
# Start-Process -NoNewWindow python -ArgumentList "-m", "flask", "run"

# .NET:
# Start-Process -NoNewWindow dotnet -ArgumentList "run"

# --- Wait for Server ---
Write-Host "⏳ Waiting for server to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

# --- Health Check ---
# Modify the URL based on your project:
# try {
#     $response = Invoke-WebRequest -Uri "http://localhost:3000/health" -UseBasicParsing -TimeoutSec 5
#     Write-Host "✅ Health check passed!" -ForegroundColor Green
# } catch {
#     Write-Host "⚠️ Health check failed" -ForegroundColor Red
# }

Write-Host ""
Write-Host "✅ Development environment ready!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Quick Reference:" -ForegroundColor Cyan
Write-Host "   - Progress Log: claude-progress.txt"
Write-Host "   - Feature List: feature_list.json"
Write-Host "   - Continue Work: /continue"
