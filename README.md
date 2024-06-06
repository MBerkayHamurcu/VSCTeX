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

## Prerequisites

Before you start, you need to install the following software on your host machine:

### Visual Studio Code

This is the IDE that you will use to edit your LaTeX files and interact with the Dev Container. You can download it from the official source [here](https://code.visualstudio.com/download "Visual Studio Code - Download")

### Docker

This is the software that runs the Dev Container. Depending on your operating system, the installation process will vary:

#### Linux

You can find the official installation instructions for Linux [here](https://docs.docker.com/desktop/install/linux-install/ "Docker for Linux - Download")

#### Windows

You can find the official installation instructions for Windows [here](https://docs.docker.com/desktop/install/windows-install/ "Docker for Windows - Download")

#### MacOS

You can find the official installation instructions for MacOS [here](https://docs.docker.com/desktop/install/mac-install/ "Docker for MacOs - Download")

### git LFS

Git LFS is a git extension that allows working with large files in git repositories by storing them on a remote server and replacing them with text pointers in the local repository. This way, repository space is saved and cloning and fetching is sped up.

#### Linux and MacOS

You can find the official installation instructions for Linux and MacOS [here](https://github.com/git-lfs/git-lfs?tab=readme-ov-file#from-binary "git LFS for Linux and MacOS - Download")

#### Windows

Git LFS is included in the distribution of *Git for Windows*. **If** you installed git via another method, you can download git LFS from the official source [here](https://git-lfs.com "git LFS for Windows - Download")

### Bibliography management

Make sure to set the library mode to **BibLaTeX** when using a bibliography management tool with this template

> [!TIP]
> Optional: You can use JabRef for managing the `literature.bib` file. The bibliography management tool makes it therefore easier to document and maintain your literature.
> You can install JabRef from the official source [here](https://www.jabref.org/#download "Jabref - Download")

## Setting up the Dev Container

To setup the Dev Container on your host machine, follow these steps:

1. **Clone** this repository by running the **git clone** command. Only downloading the repository from GitHub will cause errors because of unresolved git LFS references.
2. If you are using **windows**, run the `setWSLConfig.bat` file from the `.devcontainer` folder:
<p align="center">
  <img src=".devcontainer/static/settingWSLConfig.png" alt="Windows only: Setting a WSL config" width="80%"/>
</p>

3. **Install** the `Dev Containers` (ms-vscode-remote.remote-containers) VS Code extension.
4. **Open** the downloaded folder in VS Code. Confirm the "Yes, I trust the authors" option.
5. VS Code will detect the `.devcontainer` folder in the project and prompt you to reopen the folder in a container. Confirm the **Reopen in Container** action. Alternatively, you can use the command palette (Keyboard shortcut: Ctrl+Shift+P) and select **Dev Containers: Reopen in Container**.
6. **Wait** for the Dev Container to build and configure. Starting the Dev Container for the first time (effectively building the container) will take some time depending on your internet connection and computer. It may take a few minutes or longer. Starting the container after this first build process won't take much longer than a few seconds.
7. If the container has **fully started**, you can now edit your LaTeX files and use the features of VSCTeX!
8. Be sure to **continue reading** the [template guide](Template%20guide.md) in order to avoid confusion due to a lack of knowledge about the behavior of this setup.

**You find VSCTeX useful? Give the repo a star ⭐️**
