#!/bin/bash
create_project_structure() {
    mkdir "$project_name"
    cd "$project_name"
    touch README.md
    echo "# $project_name" >> README.md
    echo "Setup instructions and project guide" >> README.md
}
setup_python_project() {
    create_project_structure
    python3 -m venv venv
    source venv/bin/activate
    echo "Python project setup complete."
    while true; do
        read -p "Enter a Python library (or 'q' to quit): " library
        if [[ $library == "q" ]]; then
            break
        fi
        echo "$library" >> requirements.txt
        echo "Added $library to requirements.txt."
    done

    echo "All Python libraries added to requirements.txt."
}

setup_bash_project() {
    create_project_structure
    echo "To run scripts without execution permissions, use the following command:" >> README.md
    echo "bash <script_name>.sh" >> README.md
    echo "" >> README.md
    echo "To run scripts with execution permissions, use the following command:" >> README.md
    echo "./<script_name>.sh" >> README.md

    echo "Bash project setup complete."
}
select_project_type() {
    while true; do
        echo "Select the project type:"
        echo "1. Python"
        echo "2. Bash"
        echo "3. Quit"
        read -p "Enter your choice: " choice

        case $choice in
            1)
                setup_python_project
                ;;
            2)
                setup_bash_project
                ;;
            3)
                echo "Exiting project setup script."
                exit 0
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

if [[ "$(pwd)" == "$HOME/bin" ]]; then
    echo "Script is already in ~/bin directory."
else
    echo "Script is not in ~/bin directory. Creating ~/bin directory..."
    mkdir -p "$HOME/bin"
    echo "Moving script to ~/bin directory..."
    mv "$0" "$HOME/bin/init_project.sh"
    echo "Reloading shell profile..."
    source "$HOME/.bashrc"
fi
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "Adding ~/bin to the PATH..."
    echo "export PATH=$HOME/bin:\$PATH" >> "$HOME/.bashrc"
    echo "Reloading shell profile..."
    source "$HOME/.bashrc"
fi
chmod +x "$HOME/bin/init_project.sh"
if [[ $# -eq 0 ]]; then
    read -p "Enter the project name: " project_name
else
    if [[ $1 == "--name" && -n $2 ]]; then
        project_name=$2
    else
        echo "Invalid argument. Usage: init_project.sh --name <project_name>"
        exit 1
    fi
fi
select_project_type