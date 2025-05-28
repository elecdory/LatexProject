%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The MathBook
% LaTeX Class
% Version 1.0 (2024/06/XX)
%
% Based on LegrandOrangeBook.cls
% Authors: Your Name
% License: CC BY-NC-SA 4.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%   CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathbook}[2024/06/01 The MathBook Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

%----------------------------------------------------------------------------------------
%   REQUIRED PACKAGES AND CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{graphicx}
\graphicspath{{Images/}}
\usepackage{float}
\usepackage[usenames, svgnames, table]{xcolor}
\usepackage{calc}
\usepackage{changepage}
\usepackage[toc]{appendix}
\usepackage{etoolbox}
\usepackage{geometry}
\geometry{
    top=3cm,
    bottom=2.5cm,
    inner=3cm,
    outer=3cm,
    headsep=10pt,
    headheight=0.5cm,
    footskip=1.4cm,
    columnsep=1cm,
}

%----------------------------------------------------------------------------------------
%   FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{mathpazo} % Palatino for math
\usepackage{microtype}

%----------------------------------------------------------------------------------------
%   HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection~#1}{}}
\fancyhf{}
\fancyhead[LE, RO]{\sffamily\thepage}
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrulewidth}{0pt}}
\usepackage{emptypage}

%----------------------------------------------------------------------------------------
%   SECTION STYLING
%----------------------------------------------------------------------------------------

\setcounter{secnumdepth}{3}
\usepackage[
    explicit,
    newparttoc,
]{titlesec}

% 색상 정의 (파란색 계열)
\definecolor{mathblue}{RGB}{30, 90, 180}
\definecolor{mathbluebg}{RGB}{230, 240, 255}

% Chapter, Section 등 스타일 (간단화)
\titleformat{\chapter}[block]{\Huge\bfseries\color{mathblue}}{\thechapter.}{1em}{#1}
\titleformat{\section}[block]{\Large\bfseries\color{mathblue}}{\thesection}{1em}{#1}
\titleformat{\subsection}[block]{\large\bfseries\color{mathblue}}{\thesubsection}{1em}{#1}
\titleformat{\subsubsection}[block]{\bfseries\color{mathblue}}{\thesubsubsection}{1em}{#1}

%----------------------------------------------------------------------------------------
%   TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc}
\setcounter{tocdepth}{2}
\contentsmargin{0cm}

%----------------------------------------------------------------------------------------
%   TABLES
%----------------------------------------------------------------------------------------

\usepackage{array}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\usepackage{booktabs}

%----------------------------------------------------------------------------------------
%   LISTS
%----------------------------------------------------------------------------------------

\usepackage{enumitem}
\setlist{nolistsep, noitemsep}
\renewcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\labelenumii}{\alph{enumii}.}
\renewcommand{\labelenumiii}{\roman{enumiii}.}
\renewcommand{\labelitemi}{\raisebox{-2pt}{\Large \textbullet}}
\renewcommand{\labelitemii}{--}
\renewcommand{\labelitemiii}{$\circ$}

%----------------------------------------------------------------------------------------
%   THEOREM STYLES (파란색 계열)
%----------------------------------------------------------------------------------------

\usepackage{amsmath, amsfonts, amssymb, amsthm}
\renewcommand{\qedsymbol}{$\blacksquare$}

% Theorem box 스타일
\usepackage[framemethod=default]{mdframed}

\newtheoremstyle{mathbluenum}
    {6pt}{6pt}{\normalfont}{}{
        \bfseries\color{mathblue}
    }{}{0.25em}{\small\sffamily\bfseries\color{mathblue}\thmname{#1}~\thmnumber{#2}\thmnote{ --- #3.}} 

\theoremstyle{mathbluenum}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{example}{Example}[chapter]
\newtheorem{remark}{Remark}[chapter]
\newtheorem{exercise}{Exercise}[chapter]

% mdframed box for theorem environments
\newmdenv[skipabove=7pt, skipbelow=7pt, backgroundcolor=mathbluebg, linecolor=mathblue, innerleftmargin=5pt, innerrightmargin=5pt, innertopmargin=5pt, innerbottommargin=5pt, leftmargin=0cm, rightmargin=0cm]{thmbox}

% 환경 재정의 (순서 및 문법 수정)
\let\oldtheorem\theorem
\renewenvironment{theorem}{\begin{thmbox}\begin{oldtheorem}}{\end{oldtheorem}\end{thmbox}}
\let\oldproposition\proposition
\renewenvironment{proposition}{\begin{thmbox}\begin{oldproposition}}{\end{oldproposition}\end{thmbox}}
\let\oldlemma\lemma
\renewenvironment{lemma}{\begin{thmbox}\begin{oldlemma}}{\end{oldlemma}\end{thmbox}}
\let\oldcorollary\corollary
\renewenvironment{corollary}{\begin{thmbox}\begin{oldcorollary}}{\end{oldcorollary}\end{thmbox}}
\let\olddefinition\definition
\renewenvironment{definition}{\begin{thmbox}\begin{olddefinition}}{\end{olddefinition}\end{thmbox}}
\let\oldexample\example
\renewenvironment{example}{\begin{thmbox}\begin{oldexample}}{\end{oldexample}\end{thmbox}}
\let\oldremark\remark
\renewenvironment{remark}{\begin{thmbox}\begin{oldremark}}{\end{oldremark}\end{thmbox}}
\let\oldexercise\exercise
\renewenvironment{exercise}{\begin{thmbox}\begin{oldexercise}}{\end{oldexercise}\end{thmbox}}

%----------------------------------------------------------------------------------------
%   LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=mathblue,
    linkcolor=mathblue,
    citecolor=mathblue,
    hyperindex=true,
    linktoc=all,
}

%----------------------------------------------------------------------------------------
%   INDEX
%----------------------------------------------------------------------------------------

\usepackage{makeidx}
\makeindex

%----------------------------------------------------------------------------------------
%   LOAD PACKAGES THAT CLASH WITH OTHER PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{tikz} 