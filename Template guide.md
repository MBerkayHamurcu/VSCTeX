# LaTeX template guide

This document provides concise instructions on how to use this LaTeX template. Reading them at least once before starting to write is recommended.

## Configuring the Dev Container and template

The Dev Container comes with a minimal setup for this LaTeX template to work. However, you can make customizations and configurations according to your needs. Here are some of the files and folders you can modify:

- `config/packages`: This text file contains the LaTeX packages that are required for the template. You can add packages as you wish and can install your setup running the `Install packages in configuration` recipe with the LaTeX Workshop extension:

<p align="center">
  <img src=".devcontainer/static/runningWorkshopRecipe.png" alt="Running a LaTeX Workshop recipe" height="480px"/>
</p>

- `config/variables.tex`: In this file you can change the values of the document variables, such as the title, author, date, etc. There are also options like the to-do list feature, a second logo on the front page, a watermark and the restriction notice you can turn on or off via this file.
- `config/locales`: This text file contains a selection of locales you can choose one from and is therefore relevant if you want to change the default language of this Dev Container to another. It can also be extended with other valid locales. You can again apply your locales setting in the container by running the `Reapply locales configuration` recipe with the LaTeX Workshop extension. Beware that changing the language could need some configuration like installing further packages, since this Dev Container only loads the basic Tex Live installation schema, or reconfiguring little parts of the template beyond the `config/variables.tex` file
- `.devcontainer/devcontainer.json`: This file contains the configuration of the Dev Container itself, such as the instructions for building the container, extensions, settings, etc. You can change these options too, but only if you know what you are doing. A misconfiguration of this file will cause the Dev Container to fail to start or work correctly.
- The language of the LTeX Language Server is set to de-DE, can be changed via a so called "magic command" like in the example in `abstract.tex` and is automatically changed if you run the "Reapply locales configuration" recipe via the LaTeX Workshop extension. For supported locales of the extension check their documentation: [LTeX supported languages](https://valentjn.github.io/ltex/settings.html#ltexlanguage "LTeX supported languages")
- You cannot rename `main.tex` without reprogramming the scripts and recipes this name is hard coded in

## Using the Dev Container

The Dev Container provides some features and tools to help you write and compile your LaTeX documents. Here are some of the things that you can do:

- **Edit your LaTeX files**: You can use VS Code to edit your LaTeX files as you normally would. The Dev Container will automatically import the `.tex` files in the `content` and `appendix` folder in the order they are listed in the file explorer. The built-in spell and grammar checker (LTeX) helps you correcting your mistakes.
- **Compile your LaTeX files**: The Dev Container provides two modes of compilation: fast mode and complete mode. Fast mode automatically sets an `\includeonly` macro to the last saved files and skips the BibLaTeX processing to speed up the compilation. Complete mode processes all steps to produce the final output. Per default the LaTeX Workshop extension runs the fast mode compilation when you save a file. You can also run the recipes manually by clicking the desired recipe. If you encounter any warnings during the compilation, you can view them in the "Problems" tab or the "Output" tab of VS Code. Warnings like "Please (re)run Biber on the file" are expected for the fast mode compilation. These minor issues do not happen with the complete compilation mode.
- **View your PDF files**: You can use the LaTeX Workshop extension to view your PDF files. In the presence of the generated SyncTeX file you can press `control + left mouse key` (on windows) on any text or image in the document preview to automatically be taken to the according code location.
- **Manage your git repository**: You need to use your host machine's git installation, not the Dev Container's. This is because the Dev Container does not have git installed. If you want to use your host machine's git CLI, you can run `Terminal: Create New Integrated Terminal (Local)` form the VS Code command palette.
- **Automatic import** of .tex files in the content and appendix folder in the order they appear in the explorer.

## LaTeX Workshop recipes

By clicking the LaTeX Workshop extension activity bar item (TEX-symbol on the VS Code activity bar) you will find various recipes custom to this Dev Container that you can run. Beware that the LaTeX Workshop is started and runs recipes only if a `.tex` file is the active file in the editor.

<p align="center">
  <img src=".devcontainer/static/latexWorkshopRecipes.png" alt="LaTeX Workshop recipes" height="420px"/>
</p>

> [!NOTE]
>
> * In Generate document - **fast mode**, only the `To-Do-notes list` and the `.tex` files that were saved last will be compiled and therefore visible
> * In Generate document - **complete mode**, the whole document will be compiled

## Template macros

The Dev Container provides some custom macros that you can use in your LaTeX files. In general, try to adhere to the examples in the template for accessing its features (acronyms, tables, images, etc.). Here are some of them:

- `\Chapter`: This macro is a replacement for `\chapter`. It behaves like `\chapter` with the addition of adding the correct entry to your headings and creating a label that can be referenced later via \autoref{short chapter title if defined, else chapter title}.
- `\Equation`: This macro is a shortcut for creating an equation that is listed in the list of equations with a caption and a label for reference
- `\todo`: This macro is a way to add a todo note to your document. The note will appear in the margin of your document and in the optional To-Do list on the first page. In the examplery content of the template you can see some To-Do notes macros beyond the ones defined in the `todonotes` package by default like \unsure, \change or \info.
- `Itemize`: This environment is a variation of the `itemize` environment. It sets the item separation and the indentation to zero, making the list more compact.

Note that only the `\Chapter` macro has a starred implementation.

## Further notes

- The LaTeX Workshop extension is noticably a major part of this Dev Container so check out their work and profiles: [LaTeX Workshop - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop "LaTeX Workshop - Visual Studio Marketplace")
- You can safely ignore the "git not found" warning when the Dev Container starts. It only reminds you that the repository contains a `.git` folder (if you `git initialize`d this repository) but the container itself does not have git installed.
- Do not store anything of value in the `auxiliary` folder, it is automatically deleted with every full compilation
- If you want to configure the VS Code user settings of your container you can run `Preferences: Open Remote Settings (JSON)` in the command palette

## Creating chapters and sections

```latex
\Chapter{Chapter}
\section{subchapter}
\subsection{SubSubchapter}
```

## Inserting ...

### Images

#### single Image

The following is an example of the embedding of a single image in this Latex-template.

```latex
\begin{figure}[H]
  \centering

  \includegraphics[width=1\textwidth]{media/RED.jpg}

  \captionsetup{width=0.8\textwidth}
  \caption[Short description]{More detailed description with a reference \cite[S.~9]{Siemens}}

  \label{fig:platzhalterx}
\end{fig:figure}
```

The short description is optional, as is every macro argument passed via square brackets. If a short description is given, the image will be listed in the list of figures with its short description.

<p align="center">
  <img src=".devcontainer/static/figureExample.png" alt="Figure example" height="420px"/>
</p>

#### two Images

In this example, two images are integrated into one graphic.

Two images divided vertically. The format of the two images in relation to each other is relevant, the subfigure widths must be adjusted accordingly.

```latex
\begin{figure}[H]
  \centering

  \hfill
  \begin{subfigure}[t]{0.65\textwidth}
    \includegraphics[width=1\textwidth]{media/exampleA1.jpg}
  \end{subfigure}
  \hfill
  \begin{subfigure}[t]{0.3\textwidth}
    \includegraphics[width=1\textwidth]{media/exampleA2.jpg}
  \end{subfigure}
  \hfill

  \captionsetup{width=0.8\textwidth}
  \caption[Projektierung]{Projektierung einer Antriebseinheit}

  \label{fig:antrieb1}
\end{figure}
```

<p align="center">
  <img src=".devcontainer/static/twoImagesExample.png" alt="Two images in one figure example" height="330px"/>
</p>

#### four Images

In this example, 4 images are integrated into one graphic.

Four images divided vertically and horizontally. The format of the two images in relation to each other is relevant, the subfigure widths must be adjusted accordingly.

```latex
\begin{figure}[H]
  \centering

  \hfill
  \begin{subfigure}[t]{0.49\textwidth}
    \includegraphics[width=1\textwidth]{media/RED.jpg}
  \end{subfigure}
  \hfill
  \begin{subfigure}[t]{0.49\textwidth}
    \includegraphics[width=1\textwidth]{media/RED.jpg}
  \end{subfigure}
  \hfill

  \vspace{0.01\textwidth}

  \hfill
  \begin{subfigure}[b]{0.49\textwidth}
    \includegraphics[width=1\textwidth]{media/RED.jpg}
  \end{subfigure}
  \hfill
  \begin{subfigure}[b]{0.49\textwidth}
    \missingfigure[figwidth=7.7cm,figcolor=white]{Vergleich des Aufwands}
  \end{subfigure}
  \hfill

  \captionsetup{width=0.8\textwidth}
  \caption[Vergleich Arbeitsspeicherbelegung - Rechenoperationen]{Vergleich Simulationsaufwand (Arbeitsspeicherbelegung) - Menge der Rechenoperationen}

  \label{fig:vergleich1dot5}
\end{figure}
```

<p align="center">
  <img src=".devcontainer/static/fourImagesExample.png" alt="Two images in one figure example" height="420px"/>
</p>

### Tables

This template uses the longtabular environment with the tabularray package.

* **table 1**

```latex
\begin{longtblr}[
  theme=matchingCaption,
  caption={Testergebnis - Referenzprojekt},
  entry={Referenzprojekt},
  label={tab:erg2-ref}
  ]{
  colspec={Q[1,c,m]Q[1,c,m]},
  rowsep=2pt,
  hlines={black, 0.5pt},
  vlines={black, 0.5pt},
  rowhead=1,
  row{odd}={tableContrast},
  row{1}={blue9,font=\bfseries}
  }
  Messwert                      & Durchschnitt \\
  Prozessorauslastung (\%)      & 29,6         \\
  \ac{sps}-Zykluszeit (ms)      & 1,0154       \\
  Simulationslast (\%)          & 5,8          \\
  Simulationslast okay (\%)     & 99,98        \\
  Simulationslast kritisch (\%) & 0,016        \\
  Simulationslast überlast (\%) & 0,004        \\
  Prozessorauslastung (\%)      & 29,6         \\
  Weitere Einträge              & 1,0154       \\
  Weitere Einträge              & 9,8          \\
  Weitere Einträge              & 9,1          \\
\end{longtblr}
```

<p align="center">
  <img src=".devcontainer/static/tableExample1.png" alt="Table example 1" height="420px"/>
</p>

<p align="center">
  <img src=".devcontainer/static/tableExample11.png" alt="Table example 1.1" height="219px"/>
</p>

* **table 2**

A more neutral table:

```latex
\begin{longtblr}[
  theme=matchingCaption,
  caption={Testergebnis - Rechenoperationen},
  entry={Rechenoperationen},
  label={tab:erg1-rech}
  ]{
  width=1\linewidth,
  colspec={Q[1,c,m]Q[1,c,m]Q[1,c,m]Q[1,c,m]},
  rowsep=2pt,
  hlines={black, 0.1pt},
  vlines={black, 0.1pt},
  rowhead=1
  }
  Instanz                               & Privilegierte \ac{cpu} Zeit (\%) & Working Set MB & Private Bytes MB \\
  Siemens Automation. Portal            & 17,2                             & 3823           & 4379             \\
  Siemens. Simatic-Simulation. Instance & 6,1                              & 707            & 2143             \\
  SIMIT-CS                              & 77,5                             & 163            & 39               \\
\end{longtblr}
```

<p align="center">
  <img src=".devcontainer/static/tableExample2.png" alt="Table example 2" height="320px"/>
</p>

### Equations

Here are some examples of the integration of equations in this template.

#### with caption (listed in the list of equations)

```latex
\Equation{Boolesche Ungleichung}{
  \begin{equation}
    P(\bigcup_{n=1}^n A_n) \leq \sum_{n=1}^n P(A_n)
  \end{equation}
}
```

<p align="center">
  <img src=".devcontainer/static/captionedEquation.png" alt="Listed and captioned equation" height="160px"/>
</p>

#### without caption

```latex
\begin{equation}\label{pythTheorem}
  a^2+b^2=c^2
\end{equation}
```

<p align="center">
  <img src=".devcontainer/static/unlistedEquation.png" alt="Not listed equation" height="42px"/>
</p>

#### Inline math

```latex
$\int_2^3 x^2 \, dx=\frac{3^3}{3}-\frac{2^3}{3}=\frac{19}{3}$
```
<p align="center">
  <img src=".devcontainer/static/inlineMath.png" alt="Inline math" height="100px"/>
</p>

### Source Code

```latex
\begin{lstlisting}[
  style=customCStyle,
  caption={[Die kurze Beschreibung]Die lange Beschreibung}
]
#include <stdio.h>

// Einfaches
int main(int argc, char **argv) {
  printf("Hello World!");

  return 0;
}
\end{lstlisting}
```

You can create new `style`s based on the `customCStyle` example from the `frame/preamble.tex` file, f.i. if you need syntax highlighting rules of a different language.

<p align="center">
  <img src=".devcontainer/static/sourceCode.png" alt="Source Code" height="240px"/>
</p>

### Itemization

```latex
\begin{Itemize}
  \item Formulierung quantitativer Leistungskennzahlen
  \newline
  Definition quantitativer KPIs ist von Bedeutung, um die Leistungsfähigkeit der
  verschiedenen Simulationssystem-Architekturen objektiv zu bewerten.
  \item Aufbau des Testmodells
  \newline
  Die Entwicklung des konfigurierbaren Testmodells bildet die Grundlage für die Durchführung von
  Tests an verschiedenen Simulationssystem-Architekturen.
\end{Itemize}
```

<p align="center">
  <img src=".devcontainer/static/bulletList.png" alt="Itemization/Bullet list" height="240px"/>
</p>

## Use of quotation marks in German

Here is a simple example of how to use the German quotation marks.

```latex
\glqq tipps+tricks \grqq{} Beispiel
```

„tipps+tricks“ Beispiel

[Source](https://www.heise.de/tipps-tricks/LaTeX-Anfuehrungszeichen-einfuegen-so-geht-s-4351643.html "LaTeX: Anführungszeichen einfügen - so geht's")

### Acronyms

You can use the following example to use abbreviations.

```latex
The first use of an abbreviation is written out:
\newline
\ac{cpu} und \ac{sps}
\newline
Erneut:
\newline
\ac{cpu} und \ac{sps}
```

<p align="center">
  <img src=".devcontainer/static/acronyms.png" alt="Using acronyms" height="140px"/>
</p>

To add a new abbreviation, you must add your entry in `frame/acronyms.tex` like so:

```latex
\DeclareAcronym{cpu}{
  short = {CPU},
  long  = {Central Processing Unit},
  tag = {abbrev},
}
```

#### Additional information for usage

```latex
1. \ac{TS} % First use
2. \ac{TS}
3. \acp{TS}
4. \acl{TS}
5. \aclp{TS}.
```

*Results in:*

1. Temperature Sensor (TS)
2. TS
3. TSs
4. Temperature Sensor
5. Temperature Sensors.

## Citation

Use the following commands for quoting:

```latex
Inhalt\ldots Quellbeispiel: \cite[S.~2]{Plenk2019}.
Weiteres Quellbeispiel: \cite[S.~30ff.]{Siemens}.
```

<p align="center">
  <img src=".devcontainer/static/citation.png" alt="Citation" height="130px"/>
</p>

General syntax / usage:

```latex
\cite[p.~"page"]{"source from .bib"}
```

## Referencing

### Chapter - all different types of chapters

This small example shows different ways of referencing chapters.

```latex
\Chapter{Konzeption der Schaltung}

Chapter \ref{Konzeption der Schaltung} respectively \nameref{Konzeption der Schaltung}.
```

<p align="center">
  <img src=".devcontainer/static/chapterReference.png" alt="Referencing chapters" height="140px"/>
</p>

### Images and tables

Referencing can be done either with `\ref` *or* `\autoref`, as shown in this example. The objects to be referenced are described in `\autoref`.

```latex
und ein abschließendes Beispiel zur Referenzierung von Tabellen (\ref{erg1-rech} / \autoref{erg1-rech}) und Bildern (\ref{platzhalterx} / \autoref{platzhalterx}).
```

<p align="center">
  <img src=".devcontainer/static/imageAndTableReferences.png" alt="Referencing images, tables etc." height="70px"/>
</p>

### Equations

```latex
Wenn die Ereignisse $A_n$ disjunkt sind, dann wird die Ungleichung
in Gleichung \autoref{Boolesche Ungleichung} 
```

<p align="center">
  <img src=".devcontainer/static/equationReference.png" alt="Referencing equations" height="50px"/>
</p>

### Sourcecode

```latex
und Referenzierung des Quellcode-Beispiels im Folgetext \autoref{quellcodebeispiel}
```

<p align="center">
  <img src=".devcontainer/static/sourceCodeReference.png" alt="Referencing Source Code" height="60px"/>
</p>

## Using of todonotes package

Following definitions are made in `frame/preamble.tex`:

```latex
\usepackage[colorinlistoftodos,textsize=tiny,ngerman,\toDosDisabler]{todonotes}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}
```

Example of using the \change function in todonotes:

```latex
Beispielhafter Import einer Grafik \change{Das hier ändern}
```

<p align="center">
  <img src=".devcontainer/static/toDoNotes.png" alt="Using the To-Do notes package" height="40px"/>
</p>

You can use the following macros: `\unsure`, `\change`, `\info`, `\improvement`, `\thiswillnotshow`

[Source - Information - todonotes – Marking things to do in a LaTeX document](https://ctan.org/pkg/xcolor "todonotes – Marking things to do in a LaTeX document")

## Using of textboxes

```latex
Mit Inhalten, die mithilfe von Textboxen \colorbox{yellowdark}{markiert} werden sollen \ldots
```

<p align="center">
  <img src=".devcontainer/static/textHighlighting.png" alt="Color highlighting of text" height="40px"/>
</p>

Definitions of colors in `frame/preamble.tex`:

```latex
% Colors für using \colorbox from package xcolor
\definecolor{green1}{cmyk}{0.61, 0, 0.59, 0.38}
\definecolor{orange1}{cmyk}{0, 0.43, 0.94, 0.26}
% used for with transparency of the \colourbox
\definecolor{green2}{cmyk}{0.51, 0, 0.49, 0.28}
\definecolor{orange2}{cmyk}{0, 0.33, 0.84, 0.16}
\definecolor{bluebright}{cmyk}{1, 0.17, 0, 0.20}
\definecolor{yellowdark}{cmyk}{0, 0.16, 1, 0.24}
```

[Source - Information - xcolor – Driver-independent color extensions for LaTeX and pdfLaTeX](https://ctan.org/pkg/xcolor "xcolor – Driver-independent color extensions for LaTeX and pdfLaTeX")

## Blank spaces in LaTeX

- ``\,`` inserts a narrow space (0.16667em) in text or math mode.
- ``\:`` inserts a normal space of 0.2222em in text or math mode.
- ``\enspace`` inserts a space of 0.5em in text or math mode.
- ``\quad`` inserts a space of length 1em in text or math mode.
- ``\qquad`` inserts a space of length 2em in text or math mode.
- ``\hspace`` {“length”} inserts a space of selected “length” in text or math mode.

<p align="center">
  <img src=".devcontainer/static/blankSpaces.png" alt="Blank spaces" height="200px"/>
</p>

[Source](https://www.heise.de/tipps-tricks/LaTeX-Leerzeichen-einfuegen-so-klappt-s-4405481.html "LaTeX: Leerzeichen einfügen - so klappt's - Heise")

Further information on spaces:

- ``\,`` is used to create thin space.
- ``\:`` is used to create medium space.
- ``\>`` is used to create alternate medium space.
- ``\;`` is used to create thick space.

[Source](https://www.tutorialspoint.com/tex_commands/misc.htm)
