#!/usr/bin/env bash
# ==============================================================================
# Google Cloud Architecture Diagram Skill - Antigravity Installer
# ==============================================================================
# Usage:
#   ./install.sh                Install skill globally in Antigravity (Symlink mode)
#   ./install.sh --copy         Install skill globally using File Copy mode
#   ./install.sh -w /path/project Install skill locally into a specific project workspace
#   ./install.sh --uninstall    Remove installed skill from global Antigravity folders
# ==============================================================================

set -e

# Color Palette Tokens
BOLD='\033[1m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

SKILL_NAME="google-cloud-architecture-diagram"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SKILL_DIR="${SCRIPT_DIR}/.agents/skills/${SKILL_NAME}"

# Default Settings
MODE="symlink"
TARGET_WORKSPACE=""
UNINSTALL=false

# Print Banner
echo -e "${BOLD}${BLUE}====================================================================${NC}"
echo -e "${BOLD}${BLUE}  Google Cloud Architecture Diagram Skill - Antigravity Installer   ${NC}"
echo -e "${BOLD}${BLUE}====================================================================${NC}"

# Parse Command Line Arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --copy)
      MODE="copy"
      shift
      ;;
    -w|--workspace)
      TARGET_WORKSPACE="$2"
      shift 2
      ;;
    -u|--uninstall)
      UNINSTALL=true
      shift
      ;;
    -h|--help)
      echo -e "Usage: ./install.sh [OPTIONS]"
      echo -e ""
      echo -e "Options:"
      echo -e "  (default)           Install globally into Antigravity using symlink"
      echo -e "  --copy              Install globally into Antigravity using file copy"
      echo -e "  -w, --workspace DIR Install skill into specified target project workspace"
      echo -e "  -u, --uninstall     Remove skill from Antigravity directories"
      echo -e "  -h, --help          Show this help message"
      exit 0
      ;;
    *)
      echo -e "${RED}Error: Unknown argument '$1'${NC}"
      echo -e "Run './install.sh --help' for usage instructions."
      exit 1
      ;;
  esac
done

# Validate Source Skill Directory
if [[ "$UNINSTALL" = false ]]; then
  if [[ ! -d "$SOURCE_SKILL_DIR" ]]; then
    echo -e "${RED}Error: Could not find skill source at '${SOURCE_SKILL_DIR}'${NC}"
    exit 1
  fi
fi

# Target Directories for Antigravity Global Installations
GLOBAL_TARGET_DIRS=(
  "${HOME}/.gemini/config/skills"
  "${HOME}/.gemini/antigravity/skills"
  "${HOME}/.gemini/antigravity-cli/skills"
)

# ------------------------------------------------------------------------------
# Uninstall Routine
# ------------------------------------------------------------------------------
if [[ "$UNINSTALL" = true ]]; then
  echo -e "${YELLOW}Uninstalling '${SKILL_NAME}' skill...${NC}"
  
  if [[ -n "$TARGET_WORKSPACE" ]]; then
    DEST="${TARGET_WORKSPACE}/.agents/skills/${SKILL_NAME}"
    if [[ -e "$DEST" || -L "$DEST" ]]; then
      rm -rf "$DEST"
      echo -e "${GREEN}✓ Removed workspace skill at '${DEST}'${NC}"
    else
      echo -e "${YELLOW}Workspace skill not found at '${DEST}'${NC}"
    fi
  else
    for DIR in "${GLOBAL_TARGET_DIRS[@]}"; do
      DEST="${DIR}/${SKILL_NAME}"
      if [[ -e "$DEST" || -L "$DEST" ]]; then
        rm -rf "$DEST"
        echo -e "${GREEN}✓ Removed global skill at '${DEST}'${NC}"
      fi
    done
  fi
  
  echo -e "${BOLD}${GREEN}Uninstall complete!${NC}"
  exit 0
fi

# ------------------------------------------------------------------------------
# Workspace Specific Installation
# ------------------------------------------------------------------------------
if [[ -n "$TARGET_WORKSPACE" ]]; then
  if [[ ! -d "$TARGET_WORKSPACE" ]]; then
    echo -e "${RED}Error: Target workspace directory '${TARGET_WORKSPACE}' does not exist.${NC}"
    exit 1
  fi

  DEST_DIR="${TARGET_WORKSPACE}/.agents/skills/${SKILL_NAME}"
  mkdir -p "${TARGET_WORKSPACE}/.agents/skills"

  if [[ -e "$DEST_DIR" || -L "$DEST_DIR" ]]; then
    echo -e "${YELLOW}Existing installation found at '${DEST_DIR}'. Overwriting...${NC}"
    rm -rf "$DEST_DIR"
  fi

  if [[ "$MODE" == "symlink" ]]; then
    ln -s "$SOURCE_SKILL_DIR" "$DEST_DIR"
    echo -e "${GREEN}✓ Symlinked skill into workspace: '${DEST_DIR}'${NC}"
  else
    cp -R "$SOURCE_SKILL_DIR" "$DEST_DIR"
    echo -e "${GREEN}✓ Copied skill into workspace: '${DEST_DIR}'${NC}"
  fi

  echo -e "\n${BOLD}${GREEN}Successfully installed skill into workspace!${NC}"
  echo -e "Open '${TARGET_WORKSPACE}' in Google Antigravity to use '${SKILL_NAME}'."
  exit 0
fi

# ------------------------------------------------------------------------------
# Global Antigravity Installation
# ------------------------------------------------------------------------------
echo -e "${BLUE}Installing '${SKILL_NAME}' globally across Antigravity directories...${NC}"

INSTALLED_COUNT=0

for BASE_DIR in "${GLOBAL_TARGET_DIRS[@]}"; do
  # Create parent directory if parent exists or if config dir
  PARENT="$(dirname "$BASE_DIR")"
  if [[ -d "$PARENT" || "$BASE_DIR" == "${HOME}/.gemini/config/skills" || "$BASE_DIR" == "${HOME}/.gemini/antigravity/skills" ]]; then
    mkdir -p "$BASE_DIR"
    DEST="${BASE_DIR}/${SKILL_NAME}"

    if [[ -e "$DEST" || -L "$DEST" ]]; then
      rm -rf "$DEST"
    fi

    if [[ "$MODE" == "symlink" ]]; then
      ln -s "$SOURCE_SKILL_DIR" "$DEST"
      echo -e "${GREEN}✓ Symlinked to '${DEST}'${NC}"
    else
      cp -R "$SOURCE_SKILL_DIR" "$DEST"
      echo -e "${GREEN}✓ Copied to '${DEST}'${NC}"
    fi
    ((INSTALLED_COUNT++))
  fi
done

echo -e "\n${BOLD}${GREEN}====================================================================${NC}"
echo -e "${BOLD}${GREEN}  Installation Successful! (${INSTALLED_COUNT} target directories configured) ${NC}"
echo -e "${BOLD}${GREEN}====================================================================${NC}"
echo -e "The skill '${BOLD}${SKILL_NAME}${NC}' is now available in Google Antigravity!"
echo -e ""
echo -e "${BOLD}Quick Verification:${NC}"
echo -e "1. Open Google Antigravity (IDE, App, or 'agy' CLI)."
echo -e "2. Ask Antigravity: ${BLUE}\"Draw a multi-tenant GCP architecture diagram for my agentic AI system.\"${NC}"
echo -e "3. Or explicitly trigger: ${BLUE}\"\$google-cloud-architecture-diagram draw ...\"${NC}"
echo -e ""
