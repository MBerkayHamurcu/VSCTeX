# VSCTeX

**An easy-to-use, feature-rich Visual Studio Code Dev Container with a ready-to-use thesis style template for typesetting in LaTeX**

A Dev Container is a way to create a consistent and isolated development environment that runs inside a Docker container. This helps you avoid the hassle of installing and configuring the required tools and packages on your local machine.



## Features

- An extensive thesis styled LaTeX template without document warnings
- Linux, Windows and MacOS compatibility
- Fully containerized: No configuration on your host machine needed
- Major compilation time decrease: Custom LaTeX Workshop recipe that only updates the bibliography references when explicitly selected 
- Spell and grammar checker via an automatically configured language server
- Automatic import of `.tex` files in the `content` folder
- Online collaboration feature via the VS Code live-share extension
- Bibliography via BibLaTeX
- To-do notes feature
- Acronyms package
- Ready to use git version control setup
- Auxiliary files are hidden in a subfolder



## Prerequisites

Before you start, you need to install the following software on your host machine:

### Visual Studio Code

This is the code editor that you will use to edit your LaTeX files and interact with the Dev Container. You can download it from the official source [here](https://code.visualstudio.com/download).

### Docker

This is the software that runs the Dev Container. Depending on your operating system, the installation process will vary:

#### Linux

You can find the official installation instructions for Linux [here](https://docs.docker.com/desktop/install/linux-install/).

#### Windows

You can find the official installation instructions for Windows [here](https://docs.docker.com/desktop/install/windows-install/).

#### MacOS

You can find the official installation instructions for MacOS [here](https://docs.docker.com/desktop/install/mac-install/).

### git LFS

Git LFS is a git extension that allows working with large files in git repositories by storing them on a remote server and replacing them with text pointers in the local repository. This way, repository space is saved and cloning and fetching is sped up.

#### Linux

You can find the official installation instructions for Linux [here](https://github.com/git-lfs/git-lfs?tab=readme-ov-file#on-linux).

#### Windows

Git LFS is included in the distribution of *Git for Windows*. If you installed git via another method, you can download git LFS from the official source [here](https://git-lfs.com).

#### MacOS

You can find the official installation instructions for MacOS [here](https://github.com/git-lfs/git-lfs?tab=readme-ov-file#on-macos).

### Bibliography management

Make sure to set the library mode to BibLaTeX when using a bibliography management tool with this template

#### (Optional) JabRef

This is an optional tool for managing your bibliography. If you do not already have a preferred tool for this purpose, you can install JabRef from the official source [here](https://www.jabref.org/#download).



## Setup the Dev Container

To setup the Dev Container on your host machine, follow these steps:

1. **Download** this repository
1. **Open** the downloaded **folder** in VS Code. Confirm the "Yes, I trust the authors" option.
1. VS Code will detect the `.devcontainer` folder in the project and prompt you to reopen the folder in a container. Confirm the **Reopen in Container** action. Alternatively, you can use the command palette (Keyboard shortcut: Ctrl+Shift+P) and select **Dev Containers: Reopen in Container**.
1. **Wait** for the Dev Container to build **and** configure. Starting the Dev Container for the first time (effectively building the container) will take some time depending on your internet connection and computer. 10 minutes and more are possible. Starting the container after this first build process will take less than a minute.
1. If the **container** has **fully started**, which is indicated by the absence of any loading indicators, continue with the next step
1. **Open** a **.tex file**, go to the LaTeX Workshop extension and run the recipe **"Generate document" (not the fastrun recipe!)**. If the compilation is finished, continue with the next step.
1. You can now edit your LaTeX files and use the features of VSCTeX
1. Be sure to **continue reading** in order to avoid confusion due to a lack of knowledge about the behavior of this setup



## Configuring the Dev Container

The Dev Container comes with a minimal setup for this LaTeX template to work. However, you can make customizations and configurations according to your needs. Here are some of the files and folders you can modify:

- `config/packages`: This text file contains the LaTeX packages that are required for the template. You can add packages as you wish and can install your setup running the `Install packages in configuration` recipe with the LaTeX Workshop extension.
- `config/variables.tex`: In this file you can change the values of the document variables, such as the title, author, date, etc. There are also options like the to-do list feature, a watermark and the restriction notice you can turn on or off via this file.
- `config/locales`: This text file contains a selection of locales you can choose one from and is therefore relevant if you want to change the default language of this Dev Container to another. It can also be extended with other valid locales. You can again apply your locales setting in the container by running the `Reapply locales configuration` recipe with the LaTeX Workshop extension. Beware that changing the language could need some configuration like installing further packages, since this Dev Container only loads the basic Tex Live installation schema, or reconfiguring little parts of the template beyond the `config/variables.tex` file
- `.devcontainer/devcontainer.json`: This file contains the configuration of the Dev Container itself, such as the name, image, extensions, settings, etc. You can change these options too, but only if you know what you are doing. A misconfiguration of this file will cause the Dev Container to fail to start or work correctly.
- The language of the LTex Language Server is set to de-DE, can be changed via a so called "magic command" like in the example in `abstract.tex` and is automatically changed if you run the "Reapply locales configuration" recipe via the LaTeX Workshop extension. For supported locales of the extension check their documentation: [Ltex supported languages](https://valentjn.github.io/ltex/settings.html#ltexlanguage)
- You cannot rename `main.tex` without reprogramming the scripts and recipes this name is hard coded in



## Using the Dev Container

The Dev Container provides some features and tools to help you write and compile your LaTeX documents. Here are some of the things that you can do:

- **Edit your LaTeX files**: You can use VS Code to edit your LaTeX files as you normally would. The Dev Container will automatically import the `.tex` files in the `content` folder if their file name starts with a number, which also determines the order of the import. The built-in spell and grammar checker (LTeX) helps you correcting your mistakes.
- **Compile your LaTeX files**: The Dev Container provides two modes of compilation: fast mode and normal mode. Fast mode skips the BibLaTeX processing to speed up the compilation. Normal mode performs all the steps to produce the final output. Per default the LaTeX Workshop extension runs the fast mode compilation when you save a file. You can also run the recipes manually by clicking the desired recipe. If you encounter any errors or warnings during the compilation, you can view them in the "Problems" tab or the "Output" tab. If there are for example "unreferenced labels", just rerun the fast mode. These minor issues do not happen with the normal compilation mode.
- **View your PDF files**: You can use the LaTeX Workshop extension to view your PDF files. In the presence of the generated SyncTeX file you can press `control + left mouse key` (on windows) on any text or image in the document preview to automatically be taken to the appropriate code location
- **Manage your git repository**: You need to use your host machine's git installation, not the Dev Container's. This is because the Dev Container does not have git installed. To use your host machine's git CLI, you need to run `Terminal: Create New Integrated Terminal (Local)` form the VS Code command palette to start a new local/native terminal.
- **Automatic import** of .tex files in the content folder if it start with a number, which also resembles the order it should be imported in



## Template macros

The Dev Container provides some custom macros that you can use in your LaTeX files. Here are some of them:

- `\Chapter`: This macro is a replacement for `\chapter`. It behaves like `\chapter` with the addition of adding the correct entry to your headings and creating a label that can be referenced later via \ref{short chapter title if defined, else chapter title}.
- `\Equation`: This macro is a shortcut for creating an equation with a caption and a label for reference
- `\todo`: This macro is a way to add a todo note to your document. The note will appear in the margin of your document and in the optional To-Do list on the first page. In the examplery content of the template you can see some To-Do notes macros beyond the ones defined in the `todonotes` package by default like \unsure, \change or \info.
- `Itemize`: This environment is a variation of the `itemize` environment. It sets the item separation and the indentation to zero, making the list more compact.
- In general, try to adhere to the examples in the template for accessing its features (acronyms, tables, images, etc.)

Note that only the `\Chapter` macro has a starred implementation.



## Further notes

- Beware that the LaTeX Workshop is only started and only runs recipes if a `.tex` file is the active file in the editor. The LaTeX Workshop extension is noticably a major part of this Dev Container so check out their work and profiles: [LaTeX Workshop - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- You can safely ignore the "git not found" warning when the Dev Container starts. It only reminds you that the repository contains a `.git` folder (if you `git initialize`d this repository) but the container itself does not have git installed.
- If you want to configure the VS Code user settings of your container you can run `Preferences: Open Remote Settings (JSON)` in the command palette
