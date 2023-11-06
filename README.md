#Documentation
**Objective:**
Create a Unix shell script that sets up a new local project environment, tailored for Python or Bash projects, complete with virtual environment setup for Python and execution instructions for Bash. This script should be executable from any location by the user.

**Requirements:**

1. The script allows the user to choose the project type (Python or Bash).
2. It includes an option for naming the project, which will also be used for naming directories and files.
3. For Python projects, use `pip` to create a virtual environment.
4. For Bash projects, provide a README with instructions for running scripts with and without execution permissions.
5. The README should include a setup and quick start guide for the project, regardless of type.
6. The script should be placed in a directory that's part of the user's `PATH`.

**Script Features:**

1. **Project Name:**
    - Prompt the user for the project name and use it to create a directory structure.
2. **Project Type:**
    - Create a Python or Bash starter file inside the project directory.
    - For Python, set up a virtual environment using `pip`.
    - For Bash, generate a README with run instructions, using the project's snake_case name.
3. **README Guide:**
    - Always generate a README file with setup instructions and a guide on how to start working with the project.
4. **Global Accessibility:**
    - Ensure the script is accessible from any directory within the user's environment.
    
    - 

**Advanced Exercise Steps:**

1. Write the `init_project.sh` script following the initial guidelines.
2. Include parsing for a 'name' option that specifies the project name.
3. Implement logic for setting up a Python project with a virtual environment if that option is chosen.
4. If Bash is selected as the project type, create a README that includes instructions for running Bash scripts, using the project’s snake_case name for examples.
5. Regardless of the project type, include a general setup guide in the README.
6. Make the script globally accessible:
    - Suggest creating a `~/bin` directory.
    - Add `~/bin` to the user's `PATH`.
    - Move the script to `~/bin` and make it executable.
    - Provide steps to reload the shell profile.
7. Write detailed documentation and usage instructions within the script.
8. Instruct the user to test the script from various locations in their system.

**Testing:**

- Test creating both Python and Bash projects.
- Verify the correct creation of a virtual environment for Python projects.
- Check that the README for Bash projects includes correct execution instructions.
- Confirm the script's global accessibility.
