#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions ---
print_info() {
    echo -e "\033[34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[32m[SUCCESS]\033[0m $1"
}

print_error() {
    echo -e "\033[31m[ERROR]\033[0m $1" >&2
}

# --- Main Script ---

# 1. Determine project name from directory
project_name=$(basename "$PWD")
package_name=$(echo "$project_name" | tr '[:upper:]' '[:lower:]' | sed 's/-/_/g')

print_info "Detected project name: $project_name"
print_info "Package name will be: $package_name"

# Ask for confirmation
read -p "Is this correct? (y/N): " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    print_error "Please rename the directory to your desired project name and run this script again."
    exit 1
fi

# 2. Rename files and directories
print_info "Renaming project files and directories..."
mv src/project_name "src/$package_name"

# 3. Replace placeholders
print_info "Replacing placeholders in project files..."
sed -i.bak "s/{{PROJECT_NAME}}/$project_name/g" pyproject.toml
sed -i.bak "s/{{PACKAGE_NAME}}/$package_name/g" pyproject.toml
sed -i.bak "s/project_name/$project_name/g" docs/mkdocs.yml
sed -i.bak "s/src.project_name/src.$package_name/g" docs/reference/core.md
sed -i.bak "s/project_name/$package_name/g" main.py
rm pyproject.toml.bak docs/mkdocs.yml.bak docs/reference/core.md.bak main.py.bak
print_success "Placeholder replacement complete."

# 4. Initialize Git
print_info "Initializing new git repository..."
rm -rf .git
git init
git add .
git commit -m "Initial commit for $project_name"
print_success "Git repository initialized."

# 5. Setup Environment and Install Dependencies
print_info "Setting up Python environment with uv..."
if ! command -v uv &> /dev/null
then
    print_error "uv could not be found. Please install it first: https://github.com/astral-sh/uv"
    exit 1
fi
uv venv
source .venv/bin/activate
uv pip install -e ".[dev,docs]"
print_success "Dependencies installed."

# 6. Clean up
print_info "Cleaning up setup files..."
rm -- "$0"
print_success "Setup script removed."

echo ""
print_success "Project '$project_name' is set up and ready to go!"
print_info "A virtual environment has been created in .venv and activated."
print_info "To start working, you can now use your IDE or continue in this shell."
print_info ""
print_info "Available commands:"
print_info "  make run        - Run the main application"
print_info "  make test       - Run tests"
print_info "  make lint       - Run linting"
print_info "  make format     - Format code"
print_info "  make docs-serve - Serve documentation"
print_info "  make help       - Show all available commands"
