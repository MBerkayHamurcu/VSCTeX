<h1 align="center">VSCTeX</h1>

<p align="center">
  <img height="24px" alt="GitHub License" src="https://img.shields.io/github/license/MBerkayHamurcu/VSCTeX?style=for-the-badge">
  &nbsp;
  <img height="24px" alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/MBerkayHamurcu/VSCTeX/build-check.yml?branch=main&style=for-the-badge">
</p>

<p align="center">
  <em>An easy-to-use, feature-rich Visual Studio Code Dev Container
    <br>with a ready-to-use thesis style template for typesetting in LaTeX</em>
  <br>
</p>

A Dev Container is a way to create a consistent and isolated development environment that runs inside a Docker container. This helps you avoid the hassle of installing and configuring the required tools and packages on your host machine.

<hr>

## Features

- An extensive thesis styled LaTeX template free of errors and warnings
- No setup or configuration on your host machine needed except for docker
- Works fully offline after the initial setup
- Major compilation time decrease: Custom LaTeX Workshop recipes that only compile the content you are currently working on and only update bibliography references when explicitly requested
- Spelling and grammar checking via the automatically configured LTeX language server
- Automatic import of `.tex` files from the `content` and `appendix` folder
- Bibliography via BibLaTeX
- To-do notes, acronyms and many more features
- Ready-to-use git version control setup
- Online collaboration via the VS Code live-share extension
- Auxiliary files are hidden in a subfolder
- Linux, Windows and MacOS compatible

## Setting up VSCTeX

In order to use the Dev Container, you need to run the following operations on your host machine:

### 1. Install Visual Studio Code

This is the IDE that you will use to edit your LaTeX files and interact with the Dev Container. You can download it from the official source [here](https://code.visualstudio.com/download "Visual Studio Code - Download")

### 1.1 Install VS Code extension

Install the `Dev Containers` (ms-vscode-remote.remote-containers) VS Code extension

### 2. Download VSCTeX

Download this repository [here](https://github.com/MBerkayHamurcu/VSCTeX/archive/refs/heads/main.zip "VSCTeX - Download") and extract it into a folder.

### 2.1 (Windows only) Configure WSL

If you are on **Windows**, run the `setWSLConfig.bat` file from the `.devcontainer` folder:
<p align="center">
  <img src=".devcontainer/static/settingWSLConfig.png" alt="Windows only: Setting a WSL config" width="90%"/>
</p>

It will add a `.wslconfig` file to your user directory if one does not already exist.

### 3. Docker

This is the software that runs the Dev Container. Depending on your operating system, the installation process will vary:

#### Linux

You can find the official installation instructions for Linux [here](https://docs.docker.com/desktop/install/linux-install/ "Docker for Linux - Download")

#### Windows

You can download the official installer for Windows [here](https://docs.docker.com/desktop/install/windows-install/ "Docker for Windows - Download")

#### MacOS

You can find the official installation instructions for MacOS [here](https://docs.docker.com/desktop/install/mac-install/ "Docker for MacOs - Download")

### 4. Open the folder

Open the downloaded VSCTeX folder in VS Code. Confirm the "Yes, I trust the authors" option.

### 5. Reopen folder in container

VS Code will detect the `.devcontainer` folder in the project and prompt you to reopen the folder in a container. Confirm the **Reopen in Container** action. Alternatively, you can use the command palette (Keyboard shortcut: Ctrl+Shift+P) and select **Dev Containers: Reopen in Container**.

Wait for the Dev Container to build and configure. Starting the Dev Container for the first time (building the container) will take some time depending on your internet connection and computer. It may take a few minutes or longer. Starting the container after this first build process will only take a few seconds.

After the container has fully started, you can now edit your LaTeX files and use the features of VSCTeX!

Be sure to **continue reading** the [template guide](Template%20guide.md) to avoid confusion due to a lack of knowledge about the behavior of this setup.

**You find VSCTeX useful? Give the repo a star ⭐️**
