%%
%% This is file `examples/hitart/reportplus/hithesisartplus.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artpluscls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2017-2024 by Chu Yanshuo <yanshuoc@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hithesisartplus}
[2023/04/16 v3.1c Harbin Institute of Technology Thesis Template]

%% 处理文档类选项
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=hit,
  prefix=hit@,
  setkeys=\kvsetkeys
}

\newif\ifhit@bachelor
\newif\ifhit@master
\newif\ifhit@doctor
\define@key{hit}{type}{%
  \hit@bachelorfalse
  \hit@masterfalse
  \hit@doctorfalse
  \expandafter\csname hit@#1true\endcsname
}

\newif\ifhit@shenzhen
\newif\ifhit@weihai
\newif\ifhit@harbin
\define@key{hit}{campus}{%
  \hit@shenzhenfalse
  \hit@weihaifalse
  \hit@harbinfalse
  \expandafter\csname hit@#1true\endcsname
}
\ifhit@weihai\relax\else
  \ifhit@shenzhen\relax\else
    \hit@harbintrue
  \fi
\fi

\newif\ifhit@opening
\newif\ifhit@midterm
\define@key{hit}{stage}{%
  \hit@openingfalse
  \hit@midtermfalse
  \expandafter\csname hit@#1true\endcsname
}

\DeclareStringOption{fontset}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}
\PassOptionsToPackage{no-math}{fontspec}

\ProcessKeyvalOptions*

\ifhit@bachelor\relax\else
  \ifhit@master\relax\else
    \ifhit@doctor\relax\else
      \ClassError{hithesisartplus}{%
        \MessageBreak Please specify thesis type in option:
        \MessageBreak type=[bachelor | master | doctor]
      }
    \fi
  \fi
\fi

\ifhit@opening\relax\else
  \ifhit@midterm\relax\else
    \ClassError{hithesisartplus}{%
      \MessageBreak Please specify stage in option:
      \MessageBreak stage=<opening|midterm>
    }
    \fi
\fi

\ifhit@doctor
  \ifhit@midterm
    \ifhit@shenzhen
      \relax
    \else
      \ClassError{hithesisartplus}{%
        \MessageBreak This document class only support midterm report for doctor
        in shenzhen campus
      }
    \fi
  \else
    \ClassError{hithesisartplus}{%
      \MessageBreak This document class only support midterm report for doctor
      in shenzhen campus
    }
  \fi
\else
  \ClassError{hithesisartplus}{%
    \MessageBreak This document class only support midterm report for doctor
    in shenzhen campus
  }
\fi

\RequirePackage{ifthen}
\ifthenelse
{\equal{\hit@fontset}{}}%
{%
  \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
}%
{%
  \ifthenelse
  {\equal{\hit@fontset}{siyuan}}%
  {\relax}%
  {%
    \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
  }%
  \PassOptionsToClass{fontset=\hit@fontset}{ctexart}
}%
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain]{ctexart}

%% 各种宏包
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\ifxetex
\else
  \ClassError{hithesis}{Please use: \MessageBreak xelatex}
\fi
\RequirePackage{xparse}

\RequirePackage{amsmath}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{amssymb}
\setmainfont{TeXGyreTermesX}[
  UprightFont = *-Regular ,
  BoldFont = *-Bold ,
  ItalicFont = *-Italic ,
  BoldItalicFont = *-BoldItalic ,
  Extension = .otf ,
  ]
\setsansfont{texgyreheros}[
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  Extension = .otf ,
  ]
\setmonofont{texgyrecursor}[
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  Extension = .otf ,
]

\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}       %使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\RequirePackage[perpage,hang]{footmisc}
\RequirePackage{xeCJKfntef}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\heavyrulewidth=1.5pt
\lightrulewidth=1pt
\cmidrulewidth=0.5pt

\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage{hyperref}
\hypersetup{%
  CJKbookmarks=true,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0
}
\urlstyle{same}

\RequirePackage{geometry}
\geometry{%根据PlutoThesis 原版定义而来
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar,
  centering,
  text={150true mm,236true mm},
  left=30true mm,
  head=5true mm,
  headsep=2true mm,
  footskip=0true mm,
  foot=5.2true mm
}

\RequirePackage{tikzpagenodes}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{varwidth}
\RequirePackage{changepage}
\RequirePackage{multicol}
\RequirePackage[below]{placeins}%允许上一个section的浮动图形出现在下一个section的开始部分,还提供\FloatBarrier命令,使所有未处理的浮动图形立即被处理
\RequirePackage{flafter}       % 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{multirow}       %使用Multirow宏包，使得表格可以合并多个row格
\RequirePackage{subfigure}%支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption} %支持双语标题

\RequirePackage{lipsum}%random text

%% 添加字号、行距等设置
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{15bp}%
  \abovedisplayskip=6pt
  \abovedisplayshortskip=6pt
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip
}
\def\hit@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont
  }
}
\hit@def@fontsize{dachu}{58bp}
\hit@def@fontsize{chuhao}{42bp}
\hit@def@fontsize{xiaochu}{36bp}
\hit@def@fontsize{yihao}{26bp}
\hit@def@fontsize{xiaoyi}{24bp}
\hit@def@fontsize{erhao}{22bp}
\hit@def@fontsize{xiaoer}{18bp}
\hit@def@fontsize{sanhao}{16bp}
\hit@def@fontsize{xiaosan}{15bp}
\hit@def@fontsize{sihao}{14bp}
\hit@def@fontsize{banxiaosi}{13bp}
\hit@def@fontsize{xiaosi}{12bp}
\hit@def@fontsize{dawu}{11bp}
\hit@def@fontsize{wuhao}{10.5bp}
\hit@def@fontsize{xiaowu}{9bp}
\hit@def@fontsize{liuhao}{7.5bp}
\hit@def@fontsize{xiaoliu}{6.5bp}
\hit@def@fontsize{qihao}{5.5bp}
\hit@def@fontsize{bahao}{5bp}

%% 进行字号、行距等设置
\ctexset{%
  section={
    afterindent=true,
    beforeskip={7.5bp},%上下空0.5行
    afterskip={7.5bp},
    format={\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsection={
    afterindent=true,
    beforeskip={7bp},
    afterskip={7bp},
    format={\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsubsection={
    afterindent=true,
    beforeskip={3bp},
    afterskip={3bp},
    format={\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true
}

\let\hit@section\section
\RenewDocumentCommand\section{s o m s}{%
  \IfBooleanF{#4}{\noindent\tikz[overlay] \draw (-5mm,0mm) -- (155mm,0mm);}%
  \IfBooleanTF{#1}%
  {% if \section*
    \IfNoValueTF{#2}%
    {\hit@section*{#3}}%
    {\hit@section*[#2]{#3}}%
  }%
  {% if \section
    \IfNoValueTF{#2}%
    {\hit@section{#3}}%
    {\hit@section[#2]{#3}}%
  }
}

%% 中文封面
\def\hit@def@term#1{%
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hit@#1\endcsname{##1}
  }
  \csname #1\endcsname{}
}

\hit@def@term{ctitlecover}
\hit@def@term{ctitleone}
\hit@def@term{ctitletwo}
\hit@def@term{csubject}
\hit@def@term{cauthor}
\hit@def@term{cstudentid}
\hit@def@term{cclassid}
\hit@def@term{caffil}
\hit@def@term{csupervisor}
\hit@def@term{cdate}
\hit@def@term{cenrolldate}

\def\hit@parse@keywords#1{
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname hit@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname hit@#1\endcsname\@empty\else
      \expandafter\g@addto@macro\csname hit@#1\endcsname{%
        \ignorespaces\csname hit@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
      \expandafter\csname hit@#1\expandafter\endcsname\expandafter{\reserved@a}
    }
  }
}

\def\hitsetup{\kvsetkeys{hit}}

\newcommand{\hit@report@titlepage@graduate}{
  \ifthenelse
  {\equal{\hit@fontset}{siyuan}}%
  {\xiaosi[1]\vspace*{0.65em}}%
  {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\hit@hi}}}%
  \vspace*{10mm}
  \begin{center}
    \songti\erhao\textbf{\hit@cschoolname\ifhit@shenzhen\hit@shenzhencampus\fi}
  \end{center}
  \begin{center}
    \songti\erhao\textbf{\hit@cthesismidtermcheck}
  \end{center}
  \vspace{66bp}
  \parbox[b][3cm][t]{\textwidth}{
    \begin{center}\songti\sihao
      \renewcommand{\arraystretch}{1.67}
      \begin{tabular}{l@{\ \ }c}
        \textbf{\hit@graduate@studenttitle} & \textbf{\hit@cauthor}\\
        \hline
        \textbf{\hit@graduate@enrolldate} & \textbf{\hit@cenrolldate}\\
        \hline
        \textbf{\hit@graduate@thesistitle} & \textbf{\hit@ctitleone}\\
        \hline
        &\textbf{\hit@ctitletwo}\\
        \hline
        \textbf{\hit@graduate@cafflimajor} & \textbf{\hit@csubject}\\
        \hline
        \textbf{\hit@graduate@datetitle} & \textbf{\hit@cdate}\\
        \hline
        \textbf{\hit@graduate@supervisor} & \textbf{\hit@csupervisor}\\
        \hline
      \end{tabular}\renewcommand{\arraystretch}{1}
    \end{center}
  }
}

\def\makecover{
  \begin{titlepage}
    \hit@report@titlepage@graduate
    \clearpage
    \hit@shenzhen@doctor@midterm@note
  \end{titlepage}
  \AddToShipoutPicture{%
    \begin{tikzpicture}[remember picture,overlay]
      \draw ($(current page text area.south west)+(-5mm,0mm)$) rectangle ($(current page text area.north east)+(5mm,2mm)$);
    \end{tikzpicture}
  }
  \pagestyle{fancy}
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\xiaowu-~\thepage~-}
}

%% 引用和参考文献格式
\newcommand\bibstyle@numerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{\hit@inline@sep}}

\citestyle{numerical}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\citestyle{inline}\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite

\renewenvironment{thebibliography}[1]{%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\renewcommand{\makelabel}[1]{##1\hfill}
    \settowidth{\labelwidth}{\@biblabel{#1}}
    \setlength{\labelsep}{0.5em}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelsep+\labelwidth}
    \addtolength{\itemsep}{-0.8em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \clubpenalty0
  \@clubpenalty \clubpenalty
  \widowpenalty0%
  \interlinepenalty-50%
  \sfcode`\.\@m
}

%% 杂项
\AtEndOfClass{\input{hithesisart.cfg}}
\AtEndOfClass{\sloppy}

\endinput
%%
%% End of file `examples/hitart/reportplus/hithesisartplus.cls'.
