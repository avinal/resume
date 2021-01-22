%% comcv.cls
%% Copyright 2021 Avinal Kumar

% Based on Adaptive CV by Alessandro Rossini

% class options 
\NeedsTexFormat{LaTeX2e}
\ProvidesClass{comcv}[2021/01/21 Compact CV]

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% required packages - put more packages here
\RequirePackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % Change Horizontal and Vertical margins
\RequirePackage{fontawesome} % fontawesomr icons
\RequirePackages{xcolor} % custom colors
\RequirePackage{hyperref} % for links and 
\RequirePackage{fontspec} % custom fonts
\RequirePackage{array}
\RequirePackage{totpages} % counts total pages
\RequirePackage{fancyhdr} 

% define your colors here
\definecolor{white}{HTML}{FFFFFF} % color white
\definecolor{lightgray}{HTML}{999999} % color light gray
\definecolor{gray}{HTML}{555555} % color gray
\definecolor{paynegray}{HTML}{353E49} % color payne gray
\definecolor{black}{HTML}{000000} % color black
\definecolor{colorpink}{HTML}{FF706C} % color coral pink, ever seen a real coral, huh 

% provide colors to your elements
\colorlet{regulartext}{gray}
\colorlet{headertext}{white}
\colorlet{headerfill}{paynegray}
\colorlet{linktext}{coralpink}
\colorlet{lighttext}{lightgray}

% hyperref options for generating pdf, metadata
\hypersetup{
    pdfauthor={\comcv@firstname~\adcv@lastname}, % author of the file
    pdftitle={\comcv@firstname~\adcv@lastname}, % title for the generated pdf
    pdfsubject={Resume},
    pdfpagemode=UseOutlines,
    bookmarksopen=true,
    pdfstartview=Fit,
    colorlinks=true,
    allcolors=linktext
}

% font options
\setmainfont[
    Path=fonts/,
    BoldFont=Roboto-Bold.ttf,
    ItalicFont=Roboto-Italic.ttf,
    BoldItalicFont=Roboto-BoldItalic.ttf,
    Color=regulartext
]{Roboto-Light.ttf}

\newfontfamily\regular[
    Path = fonts/, 
    Color=regulartext
]{Roboto-Regular.ttf}

\newfontfamily\light[
    Path = fonts/, 
    Color=regulartext
]{Roboto-Light.ttf}

\newfontfamily\thin[
    Path = fonts/, 
    Color=regulartext
]{Roboto-Thin.ttf}

\newfontfamily\regularheader[
    Path = fonts/, 
    Color=headertext
]{Roboto-Regular.ttf}

\newfontfamily\thinheader[
    Path = fonts/, 
    Color=headertext
]{Roboto-Thin.ttf}

% define document commands/variables
\newcommand*{\fullname}[3]{\def\comcv@firstname{#1}\def\cpmcv@middlename{#2}\def\comcv@lastname{#3}} % full name
\newcommand*{\cvtitle}[1]{\def\comcv@title{#1}} % title of the document
\newcommand*{\email}[1]{\def\comcv@mailid{#1}} % email id and email text
\def\comcv@email{\faEnvelop~\href{mailto:\comcv@mailid}{\comcv@mailid}}

\newcommand*{\website}[2]{\def\comcv@websiteurl{#1}\def\comcv@websitetext{#2}} % website and website text
\ifdefined\comcv@websiteurl
    \ifx\comcv@websiteurl\empty
        \def\comcv@website{}
    \else
        \def\comcv@website{\faGlobe~\href{\comcv@websiteurl}{\comcv@websitetext}}
    \fi
\else
    \def\comcv@website{}
\fi

\newcommand*{\github}[2]{\def\comcv@githuburl{#1}\def\comcv@githubtext{#2}} % github
\ifdefined\comcv@githuburl
    \ifx\comcv@githuburl\empty
        \def\comcv@github{}
    \else
        \def\comcv@github{\faGithub~\href{\comcv@githuburl}{\comcv@githubtext}}
    \fi
\else
    \def\comcv@github{}
\fi

\newcommand*{\linkedin}[2]{\def\comcv@linkedinurl{#1}\def\comcv@linkedintext{#2}} % linkedin
\ifdefined\comcv@linkedinurl
    \ifx\comcv@linkedinurl\empty
        \def\comcv@linkedin{}
    \else
        \def\comcv@linkedin{\faLinkedin~\href{\comcv@linkedinurl}{\comcv@linkedintext}}
    \fi
\else
    \def\comcv@linkedin{}
\fi
% add more variables here

% redefining some commands
\def\@sectioncolor#1#2#3{{\addfontfeatures{Color=linktext}#1#2#3}}

\renewcommand{\section}[1]{{\Large\bfseries\@sectioncolor #1}}

\renewcommand{\subsection}[2]{\large\bfseries #2}

% header
\AtBeginDocument{
    \begin{tikzpicture}[remember picture, overlay]
        \node [rectangle, fill=headerfill, minimum width=\paperwidth, minimum height=8em, anchor=north] (box) at (current page.north) {};
        \node [text=headertext, anchor=center] (name) at (box) {{\Huge\thinheader\comcv@firstname~\thinheader\comcv@middlename~\regularheader\comcv@lastname}
        };
        \node [text=headertext, anchor=north] at (name.south) {\Large\thinheader\comcv@title};
    \end{tikzpicture}
}

\vspace{\baselineskip}

\begin{center}
    \comcv@email~~\comcv@website~~\comcv@github~~\comcv@linkedin
\end{center}

% footer
\newcommand*{\currentdate}[1]{\def\comcv@date{#1}}
\def\comcv@totpages{~/~\ref{TotPages}}
\def\comcv@page{\comcv@pagekey~\thepage\comcv@totpages}

\AtBeginDocument{
    \pagestyle{fancy}
    \fancyhead{}
    \fancyfoot[C]{\footnotesize\light\comcv@date}
    \fancyfoot[R]{\raggedleft\footnotesize\light\comcv@page}
    \renewcommand{\headrulewidth}{0em}
    \setlength\footskip{\baselineskip}
}
