%%
%% This is file `examples/hitart/reports/hithesisart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artcls')
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
\ProvidesClass{hithesisart}
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

\DeclareBoolOption[true]{raggedbottom}
\DeclareBoolOption[false]{pifootnote}
\DeclareBoolOption[false]{debug}
\DeclareBoolOption[true]{toc}
\DeclareBoolOption[true]{newtxmath}
\DeclareBoolOption[false]{print}

\DeclareStringOption{fontset}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}
\PassOptionsToPackage{no-math}{fontspec}

\ProcessKeyvalOptions*

\ifhit@bachelor\relax\else
  \ifhit@master\relax\else
    \ifhit@doctor\relax\else
    \ClassError{hithesisart}{%
      \MessageBreak Please specify thesis type in option:
      \MessageBreak type=[bachelor | master | doctor]
    }
    \fi
  \fi
\fi

\ifhit@opening\relax\else
  \ifhit@midterm\relax\else
    \ClassError{hithesisart}{%
      \MessageBreak Please specify stage in option:
      \MessageBreak stage=<opening|midterm>
    }
  \fi
\fi

\ifhit@doctor
  \ifhit@midterm
    \ifhit@shenzhen
      \ClassError{hithesisart}{%
        \MessageBreak This document class does not support midterm report for doctor
        in shenzhen campus.
        \MessageBreak please use \string\documentclass{hithesisartplus}
      }
    \fi
  \fi
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
  \ClassError{hithesis}{Please use: \MessageBreak xelatex}{}
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
\ifhit@newtxmath
  \let\oldencodingdefault\encodingdefault
  \let\oldrmdefault\rmdefault
  \let\oldsfdefault\sfdefault
  \let\oldttdefault\ttdefault
  \def\encodingdefault{T1}
  \renewcommand{\rmdefault}{ntxtlf}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\ttdefault}{ntxtt}
  \RequirePackage{newtxmath}
  \let\encodingdefault\oldencodingdefault
  \let\rmdefault\oldrmdefault
  \let\sfdefault\oldsfdefault
  \let\ttdefault\oldttdefault
\fi

\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}       %使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\ifhit@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifhit@pifootnote
  \RequirePackage{pifont}
\fi
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

\ifhit@debug
  \RequirePackage[showframe]{geometry}
\else
  \RequirePackage{geometry}
\fi
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
\ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} }%
  {
    \ifhit@opening \geometry{headsep=25pt}
    \else \geometry{headsep=17pt}
    \fi
  }
  {}

\ifhit@debug
  \RequirePackage{layout}
  \RequirePackage{layouts}
  \RequirePackage{lineno}
\fi

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

%% 添加字号、行距等设置
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20.50398bp}%
  \abovedisplayskip=8pt
  \abovedisplayshortskip=8pt
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
    format={\heiti\xiaosan[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsection={
    afterindent=true,
    beforeskip={7bp},
    afterskip={7bp},
    format={\heiti\sihao[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsubsection={
    afterindent=true,
    beforeskip={3bp},
    afterskip={3bp},
    format={\heiti\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true
}
\ifboolexpr{bool {hit@shenzhen} and bool {hit@master} }
  {
    \ctexset{
      section={
        beforeskip=25bp,
        afterskip=27pt,
        format=\ifhit@opening\centering\fi\heiti\xiaoer,
        aftername=\quad,
        break=\ifhit@opening \clearpage \else {} \fi
      },
      subsection={
        beforeskip=12pt,
        afterskip=12pt,
        format=\heiti\xiaosan,
        fixskip=true,
        aftername={\ }
      },
      subsubsection={
        beforeskip=18pt,
        afterskip=21pt,
        format=\heiti\sihao,
        fixskip=true,
        aftername={\ }
      }
    }
    \fancypagestyle{hit@shenzhen@headings@main}{%
    \fancyhf{}
    \fancyfoot[C]{\xiaowu\thepage}
    \renewcommand{\headrule}{
        \vskip 1.190132pt
        \hrule\@height2.276208pt\@width\headwidth
        \vskip 0.75pt
        \hrule\@height.75pt\@width\headwidth
      }
      \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（深圳）\ifhit@midterm 中期 \else 硕士学位论文开题 \fi 报告}
      \fancyfoot[C]{-\ \thepage\ -}
    }
    \fancypagestyle{hit@shenzhen@headings@front}{%
      \fancyhf{}
      \renewcommand{\headrule}{
        \vskip 1.190132pt
        \hrule\@height2.276208pt\@width\headwidth
        \vskip 0.75pt
        \hrule\@height.75pt\@width\headwidth
      }
      \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（深圳）硕士学位论文开题报告}
    }
    \ifboolexpr{bool {hit@midterm}}{}{\pagestyle{hit@shenzhen@headings@front}}
  }{}

%% 中文封面
\def\hit@def@term#1{%
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hit@#1\endcsname{##1}
  }
  \csname #1\endcsname{}
}

\hit@def@term{ctitlecover}
\hit@def@term{csubject}
\hit@def@term{cauthor}
\hit@def@term{cstudentid}
\hit@def@term{cclassid}
\hit@def@term{caffil}
\hit@def@term{csupervisor}
\hit@def@term{cdate}

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
    % \kaishu\xiaoer\textbf{\hit@cschoolname\ifhit@shenzhen\hit@shenzhencampus\fi}
    \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} }%
    {\ziju{1/6}}{}\kaishu\xiaoer\textbf{\hit@cschoolname}
  \end{center}
  \vspace{5mm}
  \begin{center}
    \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} and bool {hit@opening} }%
    {\xiaoyi\ziju{1/8}}{\erhao}
    \songti\textbf{\hit@cxuewei\hit@cthesisname
      \ifhit@opening
        \hit@stage@opening
      \else
        \ifhit@midterm
          \hit@stage@midterm
        \fi
      \fi
      \hit@stage@doctype
    }
  \end{center}
  \vspace{10mm}
  \parbox[t][3cm][t]{\textwidth}{
    \begin{center}
      \songti\xiaoer\textbf{\hit@cthesistitleprefix\hit@title@csep\hit@ctitlecover}
    \end{center}
  }
  \parbox[b][3cm][t]{\textwidth}{
    \begin{center}\songti\sanhao
      \renewcommand{\arraystretch}{2.1}
      \begin{tabular}{l@{\ \ }c}
        \textbf{\hit@graduate@caffiltitle} & \underline{\makebox[6.1cm]{\textbf{\hit@caffil}}}\\
        \textbf{\hit@graduate@cmajortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csubject}}}\\
        \textbf{\hit@graduate@supervisor} & \underline{\makebox[6.1cm]{\textbf{\hit@csupervisor}}}\\
        \textbf{\hit@graduate@studenttitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cauthor}}}\\
        \textbf{\hit@graduate@studentid} & \underline{\makebox[6.1cm]{\textbf{\hit@cstudentid}}}\\
        \textbf{\hit@graduate@datetitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cdate}}}\\
      \end{tabular}\renewcommand{\arraystretch}{1}
    \end{center}
  }
  \vfill
  \ifhit@harbin
    \hit@harbin@schoolbottommark
  \else
    \ifhit@shenzhen
      \ifhit@opening
        \hit@shenzhen@master@schoolbottommark
      \fi
    \fi
  \fi
}

\newcommand{\hit@report@titlepage@bachelor}{
  \ifthenelse%
  {\equal{\hit@fontset}{siyuan}}%
  {\xiaosi[1]\vspace*{0.65em}}%
  {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\hit@hi}}}%
  \vspace*{10mm}
  \begin{center}
    \includegraphics[width=6.2cm]{hitlogo}
  \end{center}
  \begin{center}
    \songti\xiaoyi\textbf{\hit@bachelor@cthesisname
      \ifhit@opening
        \hit@stage@opening
      \else
        \ifhit@midterm
          \hit@stage@midterm
        \fi
      \fi
      \hit@stage@doctype
    }
  \end{center}
  \vspace{15mm}
  \parbox[t][6.5cm][t]{\textwidth}{
    \begin{center}
      \songti\xiaoer\textbf{\hit@cthesistitleprefix\hit@title@csep\hit@ctitlecover}
    \end{center}
  }
  \parbox[b][6cm][t]{\textwidth}{
    \begin{center}\songti\sanhao
      \renewcommand{\arraystretch}{2.1}
    \begin{tabular}{l@{\ \ }c}
      \textbf{\hit@bachelor@cmajortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csubject}}}\\
      \textbf{\hit@bachelor@cstudenttitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cauthor}}}\\
      \textbf{\hit@bachelor@cstudentidtitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cstudentid}}}\\
      \ifhit@weihai % 威海校区特有
        \textbf{\hit@bachelor@cclass} & \underline{\makebox[6.1cm]{\textbf{\hit@cclassid}}}\\
      \fi
      \textbf{\hit@bachelor@csupervisortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csupervisor}}}\\
      \textbf{\hit@bachelor@cdatetitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cdate}}}\\
    \end{tabular}\renewcommand{\arraystretch}{1}
  \end{center}
  }
  \vfill
  \ifhit@weihai
    \relax
  \else
    \hit@harbin@bachelor@schoolbottommark
  \fi
}

\newcommand{\hit@report@backpage@bachelor}{
  \thispagestyle{empty}
  \noindent\parbox[t][6.5cm][t]{\textwidth}{\hit@bachelor@teachercomment}
  \noindent\parbox[b][6cm][t]{\textwidth}{\hit@bachelor@teachersign\underline{\makebox[3cm]{}}\hfill\hit@bachelor@checkdate\underline{\makebox[3cm]{}}}
}

\ExplSyntaxOn
\ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} }
{
  % renew \CTEX@toc@width@n,
  % add width of a space to numwidth (stored in \@tempdima)
  \cs_set_protected:Npn \CTEX@toc@width@n #1
  {
    \hbox_set:Nn \l__ctex_tmp_box {#1\,}
    \dim_set:Nn \@tempdima
      {
        \dim_max:nn { \@tempdima }
          { \box_wd:N \l__ctex_tmp_box }
      }
  }
  \RequirePackage[subfigure]{tocloft}
  \renewcommand{\cfttoctitlefont}{\hfill\xiaoer\heiti}
  \renewcommand{\cftaftertoctitle}{\hfill\mbox{}}
  \renewcommand{\cftsecfont}{\heiti}
  \renewcommand{\cftsecpagefont}{}
  \renewcommand{\cftsecdotsep}{\cftdotsep}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
  \renewcommand{\cftdotsep}{1}
  \setlength{\cftaftertoctitleskip}{40pt}
  \setlength{\cftbeforesecskip}{1.2ex}
  \setlength{\cftbeforesubsecskip}{1.2ex}
  \setlength{\cftbeforesubsubsecskip}{1.2ex}
  \setlength{\cftsubsecindent}{1em}
  \setlength{\cftsubsubsecindent}{2em}
  \setlength{\cftsecnumwidth}{1.5em}
  \setlength{\cftsubsecnumwidth}{0em}
  \setlength{\cftsubsubsecnumwidth}{0em}
  \ifboolexpr{bool {hit@midterm}}{\tocloftpagestyle{empty}}{\tocloftpagestyle{hit@shenzhen@headings@front}}
}{
  % \renewcommand\tableofcontents{%
  %     \thispagestyle{empty}
  %     \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} and bool {hit@midterm} }%
  %       {\patchcmd{\l@section}{\bfseries}{\heiti}{}{}}{}
  %     \normalsize\@starttoc{toc}
  %   }
}
\ExplSyntaxOff
\def\makecover{
  \begin{titlepage}
    \ifhit@bachelor
      \hit@report@titlepage@bachelor
    \else
      \hit@report@titlepage@graduate
    \fi
    \clearpage
    \ifhit@print \thispagestyle{empty}\mbox{} \clearpage \fi
    \ifhit@toc
      \tableofcontents
      \clearpage
    \fi
  \end{titlepage}
  \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} }{\pagestyle{hit@shenzhen@headings@main}}{}{}
}
\def\makebackcover{
  \clearpage
  \hit@report@backpage@bachelor
}

%% 引用和参考文献格式
\newcommand\bibstyle@numerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{\hit@inline@sep}}

\citestyle{numerical}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\citestyle{inline}\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewenvironment{thebibliography}[1]{%
  \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} and bool {hit@opening} }%
  {%
    \section*{参考文献}
    \addcontentsline{toc}{section}{参考文献}
  }{}
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
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist\frenchspacing}

%% 杂项
\AtEndOfClass{\input{hithesisart.cfg}}
\AtEndOfClass{\sloppy}

\endinput
%%
%% End of file `examples/hitart/reports/hithesisart.cls'.
