<h1 align="center">VSCTeX</h1>

<p align="center">
  <em>An easy-to-use, feature-rich Visual Studio Code Dev Container
    <br>with a ready-to-use thesis style template for typesetting in LaTeX.</em>
  <br>
</p>

A Dev Container is a way to create a consistent and isolated development environment that runs inside a Docker container. This helps you avoid the hassle of installing and configuring the required tools and packages on your local machine.

<hr>

## Features

- An extensive thesis styled LaTeX template free of errors and warnings
- Fully containerized: No setup or configuration on your host machine needed (except for docker)
- Works fully offline, after the initial setup
- Major compilation time decrease: Custom LaTeX Workshop recipes that only compile the content you are currently working on and only update the bibliography references when explicitly selected.
- Spelling and grammar checking via the automatically configured LTeX language server
- Automatic import of `.tex` files from the `content` and `appendix` folder
- Bibliography via BibLaTeX
- Ready to use git version control setup
- To-do notes feature
- Acronyms package
- Online collaboration feature via the VS Code live-share extension
- Auxiliary files are hidden in a subfolder
- Linux, Windows and MacOS compatibility

## Setting up the Dev Container

In order to clone and run the Dev Container, you need to run the following operations on your host machine:

### 0. Install git

#### Linux and MacOS

- You can find the official installation instructions for Linux and MacOS [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "git for Linux and MacOS")

#### Windows

- You can find the official installer for Windows [here](https://git-scm.com/download/win "git for windows - Download")

### 1. Install git LFS

#### Linux and MacOS

- You can find the official installation instructions for Linux and MacOS [here](https://github.com/git-lfs/git-lfs?tab=readme-ov-file#from-binary "git LFS for Linux and MacOS - Download")

#### Windows

Git LFS is included in the distribution of *Git for Windows*. If you installed git via another method, you can download git LFS from the official source [here](https://git-lfs.com "git LFS for Windows - Download")

### 2. Clone this repository

- **Clone** this repository by running `git clone https://github.com/MBerkayHamurcu/VSCTeX.git`. **Only downloading** the repository from GitHub **will cause errors** because of unresolved git LFS references.

### 3. Install Visual Studio Code

- This is the IDE that you will use to edit your LaTeX files and interact with the Dev Container. You can download it from the official source [here](https://code.visualstudio.com/download "Visual Studio Code - Download")

### 3.1 Install VS Code extension

- Install the `Dev Containers` (ms-vscode-remote.remote-containers) VS Code extension

### 3.2 (Windows only) Configure WSL

- If you are on **Windows**, run the `setWSLConfig.bat` file from the `.devcontainer` folder:
<p align="center">
  <img src=".devcontainer/static/settingWSLConfig.png" alt="Windows only: Setting a WSL config" width="90%"/>
</p>

It will add a `.wslconfig` file to your user directory if one does not already exist.

### 4. Docker

This is the software that runs the Dev Container. Depending on your operating system, the installation process will vary:

#### Linux

- You can find the official installation instructions for Linux [here](https://docs.docker.com/desktop/install/linux-install/ "Docker for Linux - Download")

#### Windows

- You can download the official installer for Windows [here](https://docs.docker.com/desktop/install/windows-install/ "Docker for Windows - Download")

#### MacOS

- You can find the official installation instructions for MacOS [here](https://docs.docker.com/desktop/install/mac-install/ "Docker for MacOs - Download")

### 5. Open the folder

- Open the downloaded folder in VS Code. Confirm the "Yes, I trust the authors" option.

### 6. Reopen folder in container

- VS Code will detect the `.devcontainer` folder in the project and prompt you to reopen the folder in a container. Confirm the **Reopen in Container** action. Alternatively, you can use the command palette (Keyboard shortcut: Ctrl+Shift+P) and select **Dev Containers: Reopen in Container**.

<br>

Wait for the Dev Container to build and configure. Starting the Dev Container for the first time (effectively building the container) will take some time depending on your internet connection and computer. It may take a few minutes or longer. Starting the container after this first build process won't take much longer than a few seconds.

If the container has **fully started**, you can now edit your LaTeX files and use the features of VSCTeX!

Be sure to **continue reading** the [template guide](Template%20guide.md) in order to avoid confusion due to a lack of knowledge about the behavior of this setup.

### Bibliography management

Make sure to set the library mode to **BibLaTeX** when using a bibliography management tool with this template

> [!TIP]
> You can use the bibliography management tool JabRef for managing the `literature.bib` file. It makes it easier to document and maintain your literature. You can install JabRef from the official source [here](https://www.jabref.org/#download "Jabref - Download")

**You find VSCTeX useful? Give the repo a star ⭐️**
