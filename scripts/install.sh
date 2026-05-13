#!/usr/bin/env bash
set -euo pipefail

BUNDLE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
WORKSPACE_DIR="$HOME/agent-workspace/shared/projects"
MEMORY_DIR="$HOME/agent-workspace/shared/memory"

mkdir -p "$CLAUDE_SKILLS_DIR"
mkdir -p "$WORKSPACE_DIR"
mkdir -p "$MEMORY_DIR"

cp -R "$BUNDLE_DIR/skills/"* "$CLAUDE_SKILLS_DIR/"

# Seed memory files if missing.
touch "$MEMORY_DIR/preferences.md"
touch "$MEMORY_DIR/workflow-defaults.md"
touch "$MEMORY_DIR/known-frictions.md"

# Copy project template for reference.
mkdir -p "$WORKSPACE_DIR/_template"
cp -R "$BUNDLE_DIR/workspace-templates/shared/projects/_template/"* "$WORKSPACE_DIR/_template/"

echo "Installed Jay E-style Claude Code skills to: $CLAUDE_SKILLS_DIR"
echo "Created shared workspace at: $WORKSPACE_DIR"
echo "Restart Claude Code if skills are not visible immediately."
