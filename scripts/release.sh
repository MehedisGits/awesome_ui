#!/bin/bash

# Release Management Script for awesome_ui
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Starting Release Process for awesome_ui${NC}"

# Check if we're on main branch
if [ "$(git branch --show-current)" != "main" ]; then
    echo -e "${RED}❌ Error: Must be on main branch to create release${NC}"
    exit 1
fi

# Check if working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}❌ Error: Working directory is not clean${NC}"
    echo -e "${YELLOW}Please commit or stash your changes first${NC}"
    exit 1
fi

# Pull latest changes
echo -e "${YELLOW}📥 Pulling latest changes...${NC}"
git pull origin main

# Get version from pubspec.yaml
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //')
echo -e "${YELLOW}📋 Current version: $VERSION${NC}"

# Confirm release
read -p "Do you want to create release v$VERSION? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Release cancelled${NC}"
    exit 0
fi

# Run tests
echo -e "${YELLOW}🧪 Running tests...${NC}"
flutter test

# Run analysis
echo -e "${YELLOW}🔍 Running analysis...${NC}"
flutter analyze

# Build for all platforms
echo -e "${YELLOW}🏗️  Building for all platforms...${NC}"
flutter build web --release
flutter build apk --release

# Create git tag
echo -e "${YELLOW}🏷️  Creating git tag v$VERSION...${NC}"
git tag -a "v$VERSION" -m "Release version $VERSION

## What's Changed
- New features and improvements
- Bug fixes and optimizations
- Documentation updates

## Installation
\`\`\`yaml
dependencies:
  awesome_ui: ^$VERSION
\`\`\`"

# Push changes and tags
echo -e "${YELLOW}📤 Pushing changes and tags...${NC}"
git push origin main
git push origin "v$VERSION"

echo -e "${GREEN}✅ Release v$VERSION completed successfully!${NC}"
echo -e "${GREEN}🔗 View release: https://github.com/MehedisGits/awesome_ui/releases/tag/v$VERSION${NC}"
echo -e "${BLUE}📝 Next steps:${NC}"
echo -e "${BLUE}   1. Update CHANGELOG.md${NC}"
echo -e "${BLUE}   2. Create release notes${NC}"
echo -e "${BLUE}   3. Announce the release${NC}"
