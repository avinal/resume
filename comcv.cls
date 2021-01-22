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
\hypersetup{
    pdfauthor={}
    colorlinks=true,
    allcolors=linktext
}

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



