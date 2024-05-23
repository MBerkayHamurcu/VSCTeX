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

This is the IDE that you will use to edit your LaTeX files and interact with the Dev Container. You can download it from the official source <a href="https://code.visualstudio.com/download" target="_blank">here</a>.

### Docker

This is the software that runs the Dev Container. Depending on your operating system, the installation process will vary:

#### Linux

You can find the official installation instructions for Linux <a href="https://docs.docker.com/desktop/install/linux-install/" target="_blank">here</a>.

#### Windows

You can find the official installation instructions for Windows <a href="https://docs.docker.com/desktop/install/windows-install/" target="_blank">here</a>.

#### MacOS

You can find the official installation instructions for MacOS <a href="https://docs.docker.com/desktop/install/mac-install/" target="_blank">here</a>.

### git LFS

Git LFS is a git extension that allows working with large files in git repositories by storing them on a remote server and replacing them with text pointers in the local repository. This way, repository space is saved and cloning and fetching is sped up.

#### Linux

You can find the official installation instructions for Linux <a href="https://github.com/git-lfs/git-lfs?tab=readme-ov-file#on-linux" target="_blank">here</a>.

#### Windows

Git LFS is included in the distribution of *Git for Windows*. If you installed git via another method, you can download git LFS from the official source <a href="https://git-lfs.com" target="_blank">here</a>.

#### MacOS

You can find the official installation instructions for MacOS <a href="https://github.com/git-lfs/git-lfs?tab=readme-ov-file#on-macos" target="_blank">here</a>.

### Bibliography management

Make sure to set the library mode to BibLaTeX when using a bibliography management tool with this template

#### (Optional) JabRef

This is an optional tool for managing your bibliography. If you do not already have a preferred tool for this purpose, you can install JabRef from the official source <a href="https://www.jabref.org/#download" target="_blank">here</a>.



## Setting up the Dev Container

To setup the Dev Container on your host machine, follow these steps:

1. **Clone** this repository by running the **git clone** command. Only downloading the repository from GitHub will cause errors because of unresolved git LFS references.
1. **Install** the `Dev Containers` (ms-vscode-remote.remote-containers) VS Code extension.
1. **Open** the downloaded folder in VS Code. Confirm the "Yes, I trust the authors" option.
1. VS Code will detect the `.devcontainer` folder in the project and prompt you to reopen the folder in a container. Confirm the **Reopen in Container** action. Alternatively, you can use the command palette (Keyboard shortcut: Ctrl+Shift+P) and select **Dev Containers: Reopen in Container**.
1. **Wait** for the Dev Container to build and configure. Starting the Dev Container for the first time (effectively building the container) will take some time depending on your internet connection and computer. It may take a few minutes or longer. Starting the container after this first build process won't take much longer than a few seconds.
1. If the container has **fully started**, you can now edit your LaTeX files and use the features of VSCTeX!
1. Be sure to **continue reading** in order to avoid confusion due to a lack of knowledge about the behavior of this setup.



## Configuring the Dev Container

The Dev Container comes with a minimal setup for this LaTeX template to work. However, you can make customizations and configurations according to your needs. Here are some of the files and folders you can modify:

- `config/packages`: This text file contains the LaTeX packages that are required for the template. You can add packages as you wish and can install your setup running the `Install packages in configuration` recipe with the LaTeX Workshop extension:
<p align="center">
  <img src=".devcontainer/static/runningWorkshopRecipe.png" alt="Running a LaTeX Workshop recipe" width="80%"/>
</p>
- `config/variables.tex`: In this file you can change the values of the document variables, such as the title, author, date, etc. There are also options like the to-do list feature, a watermark and the restriction notice you can turn on or off via this file.
- `config/locales`: This text file contains a selection of locales you can choose one from and is therefore relevant if you want to change the default language of this Dev Container to another. It can also be extended with other valid locales. You can again apply your locales setting in the container by running the `Reapply locales configuration` recipe with the LaTeX Workshop extension. Beware that changing the language could need some configuration like installing further packages, since this Dev Container only loads the basic Tex Live installation schema, or reconfiguring little parts of the template beyond the `config/variables.tex` file
- `.devcontainer/devcontainer.json`: This file contains the configuration of the Dev Container itself, such as the instructions for building the container, extensions, settings, etc. You can change these options too, but only if you know what you are doing. A misconfiguration of this file will cause the Dev Container to fail to start or work correctly.
- The language of the LTeX Language Server is set to de-DE, can be changed via a so called "magic command" like in the example in `abstract.tex` and is automatically changed if you run the "Reapply locales configuration" recipe via the LaTeX Workshop extension. For supported locales of the extension check their documentation: <a href="https://valentjn.github.io/ltex/settings.html#ltexlanguage" target="_blank">LTeX supported languages</a>
- You cannot rename `main.tex` without reprogramming the scripts and recipes this name is hard coded in



## Using the Dev Container

The Dev Container provides some features and tools to help you write and compile your LaTeX documents. Here are some of the things that you can do:

- **Edit your LaTeX files**: You can use VS Code to edit your LaTeX files as you normally would. The Dev Container will automatically import the `.tex` files in the `content` and `appendix` folder in the order they are listed in the file explorer. The built-in spell and grammar checker (LTeX) helps you correcting your mistakes.
- **Compile your LaTeX files**: The Dev Container provides two modes of compilation: fast mode and complete mode. Fast mode automatically sets an `\includeonly` macro to the last saved files and skips the BibLaTeX processing to speed up the compilation. Complete mode processes all steps to produce the final output. Per default the LaTeX Workshop extension runs the fast mode compilation when you save a file. You can also run the recipes manually by clicking the desired recipe. If you encounter any warnings during the compilation, you can view them in the "Problems" tab or the "Output" tab of VS Code. Warnings like "Please (re)run Biber on the file" are expected for the fast mode compilation. These minor issues do not happen with the complete compilation mode.
- **View your PDF files**: You can use the LaTeX Workshop extension to view your PDF files. In the presence of the generated SyncTeX file you can press `control + left mouse key` (on windows) on any text or image in the document preview to automatically be taken to the according code location.
- **Manage your git repository**: You need to use your host machine's git installation, not the Dev Container's. This is because the Dev Container does not have git installed. If you want to use your host machine's git CLI, you can run `Terminal: Create New Integrated Terminal (Local)` form the VS Code command palette.
- **Automatic import** of .tex files in the content and appendix folder in the order they appear in the explorer.



## Template macros

The Dev Container provides some custom macros that you can use in your LaTeX files. In general, try to adhere to the examples in the template for accessing its features (acronyms, tables, images, etc.). Here are some of them:

- `\Chapter`: This macro is a replacement for `\chapter`. It behaves like `\chapter` with the addition of adding the correct entry to your headings and creating a label that can be referenced later via \ref{short chapter title if defined, else chapter title}.
- `\Equation`: This macro is a shortcut for creating an equation with a caption and a label for reference
- `\todo`: This macro is a way to add a todo note to your document. The note will appear in the margin of your document and in the optional To-Do list on the first page. In the examplery content of the template you can see some To-Do notes macros beyond the ones defined in the `todonotes` package by default like \unsure, \change or \info.
- `Itemize`: This environment is a variation of the `itemize` environment. It sets the item separation and the indentation to zero, making the list more compact.

Note that only the `\Chapter` macro has a starred implementation.



## Further notes

- Beware that the LaTeX Workshop is only started and only runs recipes if a `.tex` file is the active file in the editor. The LaTeX Workshop extension is noticably a major part of this Dev Container so check out their work and profiles: <a href="https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop" target="_blank">LaTeX Workshop - Visual Studio Marketplace</a>
- You can safely ignore the "git not found" warning when the Dev Container starts. It only reminds you that the repository contains a `.git` folder (if you `git initialize`d this repository) but the container itself does not have git installed.
- Do not store anything of value in the `auxiliary` folder, it is automatically deleted with every full compilation
- If you want to configure the VS Code user settings of your container you can run `Preferences: Open Remote Settings (JSON)` in the command palette

**You find VSCTeX useful? Give the repo a star :star:**
