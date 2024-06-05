# Instructions for use - how to do

In this description you will find small instructions on how to use the latex template, **please read them carefully complete** at least once before using it for the first time.

## blankspaces in latex

* ``\,`` inserts a narrow space (0.16667em) in text or math mode.
* ``\:`` inserts a normal space of 0.2222em in text or math mode.
* ``\enspace`` inserts a space of 0.5em in text or math mode.
* ``\quad`` inserts a space of length 1em in text or math mode.
* ``\qquad`` inserts a space of length 2em in text or math mode.
* ``\hspace`` {“length”} inserts a space of selected “length” in text or math mode.

![1717249826915](image/Instructionsforuse-howtodo/1717249826915.png)

[Source](https://www.heise.de/tipps-tricks/LaTeX-Leerzeichen-einfuegen-so-klappt-s-4405481.html "LaTeX: Leerzeichen einfügen - so klappt's - Heise")

further information:

``\,`` is used to create thin space.
``\:`` is used to create medium space.
``\>`` is used to create alternate medium space.
``\;`` is used to create thick space.

[Source](https://www.tutorialspoint.com/tex_commands/misc.htm)

> [!IMPORTANT]
> Important after ``\texttrademark`` or other characters in the text ``\`` apply for the **correct/adjusted** space

## Use of quotation marks in German

Here is a simple example of how to use the German quotation marks in this Latex-template.

```latex
\glqq tipps+tricks \grqq{} Beispiel
```

„tipps+tricks“ Beispiel

[Source](https://www.heise.de/tipps-tricks/LaTeX-Anfuehrungszeichen-einfuegen-so-geht-s-4351643.html "LaTeX: Anführungszeichen einfügen - so geht's")

## Creation of chapters

```latex
\Chapter{kap:Chapter}
\section{kap:subchapter}
\subsection{kap:Sub-sub-chapter}
```

## Insertion of ...

### Images

#### single Image

The following is an example of the embedding of a single image in this Latex-template.

```latex
\begin{figure}[H]
  \centering

  \includegraphics[width=1\textwidth]{media/RED.jpg}

  \captionsetup{width=0.8\textwidth}
  \caption[Kurze Bildbeschreibung]{Ein Bild mit Quellenangabe \cite[S.~9]{Siemens}}

  \label{fig:platzhalterx}
\end{fig:figure}
```

![1717274293037](image/Instructionsforuse-howtodo/1717274293037.png)

#### two Images

In this example, two images are integrated into one graphic.

Two images divided vertically. The format of the two images in relation to each other is relevant, the subfigure widths must be adjusted accordingly!

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

![1717276005142](image/Instructionsforuse-howtodo/1717276005142.png)

#### four Images

In this example, 4 images are integrated into one graphic.

Four images divided vertically and horizontally. The format of the two images in relation to each other is relevant, the subfigure widths must be adjusted accordingly!

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

![1717276320499](image/Instructionsforuse-howtodo/1717276320499.png)

### Tables

In the following 2 examples for the use of tables in this Latex-template are shown. The longtblr environment is used in this template.

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

![1717516361682](image/Instructionsforuse-howtodo/1717516361682.png)

![1717516147408](image/Instructionsforuse-howtodo/1717516147408.png)

* **table 2**

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
  hlines={black, 0.5pt},
  vlines={black, 0.5pt},
  rowhead=1,
  row{odd}={tableContrast},
  row{1}={blue9,font=\bfseries}
  }
  Instanz                               & Privilegierte \ac{cpu} Zeit (\%) & Working Set MB & Private Bytes MB \\
  Siemens Automation. Portal            & 17,2                             & 3823           & 4379             \\
  Siemens. Simatic-Simulation. Instance & 6,1                              & 707            & 2143             \\
  SIMIT-CS                              & 77,5                             & 163            & 39               \\
\end{longtblr}
```

![1717516407310](image/Instructionsforuse-howtodo/1717516407310.png)

### Equations

Here are some examples of the integration of equations in this Latex-template.

#### with caption

```latex
\Equation[Boolesche Ungleichung]{
  \begin{equation}
    P(\bigcup_{n=1}^n A_n) \leq \sum_{n=1}^n P(A_n)
  \end{equation}
}
```

![1717516472274](image/Instructionsforuse-howtodo/1717516472274.png)

#### without caption

```latex
\begin{equation}
  a^2+b^2=c^2
\end{equation}
```

![1717276927425](image/Instructionsforuse-howtodo/1717276927425.png)

#### Inline Math

Here is an example of Inline Math, which can be used normally

```latex
$t_{sim} >> t_{real}$
```

![1717275728573](image/Instructionsforuse-howtodo/1717275728573.png)

### Sourcecode

Here is a small example of the integration of source code in in this Latex-template.

```latex
\begin{lstlisting}[style=customCStyle,caption={[Die kurze Beschreibung]Die lange Beschreibung}]
#include <stdio.h>

// Einfaches
int main(int argc, char **argv) {
  printf("Hello World!");

  return 0;
}
\end{lstlisting}
```

Definitions of `style` in `/workspaces/VSCTeX/frame/preamble.tex`, of course you can customize these according to your programming language and preferences.
In this example, the `customCStyle` is used.

![1717274653597](image/Instructionsforuse-howtodo/1717274653597.png)

### Itemization

Here is a small example of how to use listings in this Latex-template.

```latex
\begin{Itemize}
  \item Formulierung quantitativer Leistungskennzahlen
  \newline
  Definition quantitativer KPIs ist von Bedeutung, um die Leistungsfähigkeit der
  verschiedenen Simulationssystem-Architekturen objektiv zu bewerten. Dieses Teilziel
  beinhaltet die Identifizierung geeigneter KPIs und die Entwicklung von Metriken zur Messung
  der Simulationskapazität
  \item Aufbau des Testmodells
  \newline
  Die Entwicklung des konfigurierbaren Testmodells bildet die Grundlage für die Durchführung von
  Tests an verschiedenen Simulationssystem-Architekturen. Hierbei gilt es, die Plattform so zu gestalten,
  dass sie flexibel an verschiedene Simulationsszenarien anpassbar ist
\end{Itemize}
```

![1717275409944](image/Instructionsforuse-howtodo/1717275409944.png)

### Acronyms

You can use the following example to use abbreviations in your text.

```latex
Die jeweils ersten Erwähnungen werden immer ausgeschrieben:
\newline
\ac{cpu} und \ac{sps}
\newline
Erneut:
\newline
\ac{cpu} und \ac{sps}
```

![1717271140492](image/Instructionsforuse-howtodo/1717271140492.png)

To do this, you must add your entry in x in `VSCTeX/frame/acronyms.tex`

```latex
\DeclareAcronym{sps}{
  short = {SPS},
  long  = {Speicherprogrammierbare Steuerung},
  tag = {abbrev},
}

\DeclareAcronym{cpu}{
  short = {CPU},
  long  = {Central Processing Unit},
  tag = {abbrev},
}
```

#### Additional information for usage

With the following commands, you can achieve the following output:

```latex
1. \ac{TS} %(the second time)
2. and \ac{TS}
3. and \acp{TS}
4. and \acl{TS}
5. and \aclp{TS}.
```

*Output:*

1. Temperature Sensor (TS)
2. and TS (the second time)
3. and TSs
4. and Temperature Sensor
5. and Temperature Sensors.

## Citation (using biblatex / csquotes)

Please use the following commands for quoting:

```latex
Inhalt\ldots Quellbeispiel: \cite[S.~2]{Plenk2019}.
Weiteres Quellbeispiel: \cite[S.~30ff.]{Siemens}.
```

![1717250550734](image/Instructionsforuse-howtodo/1717250550734.png)

General syntax / usage:

```latex
\cite[p.~"page"]{"source from .bib"}
```

## Referencing

### Chapter - all different types of chapters

This small example shows all possible ways of referencing chapters.

```latex
Kapitel \ref{kap:Konzeption_der_Schaltung}\,\nameref{kap:Konzeption_der_Schaltung} detailliert dargelegt.
```

![1704895665487](image/Instructionsforuse-howtodo/1704895665487.png)

### Images and tables

Referencing can be done either with `\ref` *or* `\autoref`, as shown in this example. The objects to be referenced are described in `\autoref`.

```latex
und ein abschließendes Beispiel zur Referenzierung von Tabellen (\ref{erg1-rech} / \autoref{erg1-rech}) und Bildern (\ref{platzhalterx} / \autoref{platzhalterx}).
```

![1717253997121](image/Instructionsforuse-howtodo/1717253997121.png)

### Equations

```latex
Wenn die Ereignisse $A_n$ disjunkt sind, dann wird die Ungleichung
in Gleichung \autoref{Boolesche Ungleichung} 
```

![1717517029329](image/Instructionsforuse-howtodo/1717517029329.png)

### Sourcecode

```latex
und Referenzierung des Quellcode-Beispiels im Folgetext \autoref{quellcodebeispiel}
```

![1717517905826](image/Instructionsforuse-howtodo/1717517905826.png)

## Using of todonotes package

Definitions in `/workspaces/VSCTeX/frame/preamble.tex`

```latex
\usepackage[colorinlistoftodos,textsize=tiny,ngerman,\toDosDisabler]{todonotes}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}
```

Example of using the \change function in todonotes.

```latex
Beispielhafter Import einer Grafik \change{Das hier ändern}
```

![1717270634305](image/Instructionsforuse-howtodo/1717270634305.png)

You can use the following functions: `\unsure`, `\change`, `\info`, `\improvement`, `\thiswillnotshow`

[Source - Information - todonotes – Marking things to do in a LATEX document](https://ctan.org/pkg/xcolor "todonotes – Marking things to do in a LATEX document")

## Using of textboxes

Here is a small application example for colorboxes.

```latex
Mit Inhalten, die mithilfe von Textboxen \colorbox{yellowdark}{markiert} werden sollen \ldots
```

![1717255112790](image/Instructionsforuse-howtodo/1717255112790.png)

Definitions of colors for `\colorbox` in `/workspaces/VSCTeX/frame/preamble.tex`

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

[Source - Information - xcolor – Driver-independent color extensions for LATEX and pdfLATEX](https://ctan.org/pkg/xcolor "xcolor – Driver-independent color extensions for LATEX and pdfLATEX")

## LaTeX Workshop recipe

In the LaTeX Workshop recipe you will find various recipes with which you can easily use the Latex template.

![1717517768260](image/Instructionsforuse-howtodo/1717517768260.png)

> [!NOTE]
>
> * In Generate document - **fast mode**, only the To-Do-note page and the .tex file that is currently open and being edited will be compiled
> * In Generate document - **complete mode**, the complete document will be compiled
