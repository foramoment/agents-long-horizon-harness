#!/bin/bash

# =============================================================================
# Project: <project_name>
# Description: Development environment initialization script
# =============================================================================

set -e

echo "🚀 Starting <project_name> development environment..."

# --- Dependency Installation ---
# Uncomment/modify based on your stack:

# Node.js projects:
# if [ -f "package.json" ]; then
#     echo "📦 Installing Node.js dependencies..."
#     npm install
# fi

# Python projects:
# if [ -f "requirements.txt" ]; then
#     echo "🐍 Installing Python dependencies..."
#     pip install -r requirements.txt
# fi

# Rust projects:
# if [ -f "Cargo.toml" ]; then
#     echo "🦀 Building Rust project..."
#     cargo build
# fi

# --- Start Development Server ---
# Modify based on your stack:

# Node.js:
# npm run dev &

# Python Flask:
# flask run &

# Python FastAPI:
# uvicorn main:app --reload &

# Rust:
# cargo run &

# --- Wait for Server ---
echo "⏳ Waiting for server to start..."
sleep 3

# --- Health Check ---
# Modify the URL based on your project:
# curl -s http://localhost:3000/health || echo "⚠️ Health check failed"

echo "✅ Development environment ready!"
echo ""
echo "📋 Quick Reference:"
echo "   - Progress Log: claude-progress.txt"
echo "   - Feature List: feature_list.json"
echo "   - Continue Work: /continue"
