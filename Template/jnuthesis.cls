% -*- coding: utf-8 -*-
% ----------------------------------------------------------------------------
% Author:  Jianrui Lyu <tolvjr@163.com>
% Website: https://lvjr.bitbucket.io/jnuthesis.html
% License: The LaTeX Project Public License 1.3
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jnuthesis}[2018/11/12 v0.5 A thesis class for Jinan University]

\newif\ifsourcehan  \sourcehanfalse  % 切换思源字体

\DeclareOption{sourcehan}{\sourcehantrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}} %其它选项

\ProcessOptions %不可省略

% 四号    小四号    五号      小五号
% 14bp    12bp      10.5bp    9bp
\LoadClass[cs4size,UTF8,noindent,openany]{ctexbook}
\AtBeginDocument{\zihao{4}}

\RequirePackage[a4paper,left=25mm,right=25mm,top=25mm,bottom=25mm]{geometry}

\RequirePackage{tabu}
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{comment}
\RequirePackage{environ}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}

\RequirePackage{hyperref}
\hypersetup{
   pdfstartview={FitH},
   colorlinks,
   citecolor=blue,
   filecolor=blue,
   linkcolor=black,
   urlcolor=black,
   bookmarksnumbered,
   unicode=true % 避免用CJK时书签乱码
}

\setlength{\parindent}{2em}
\setlength{\lineskiplimit}{3pt}
\setlength{\lineskip}{3pt}

\renewcommand{\title}{A thesis class for Jinan University}
\newcommand{\biaoti}{暨南大学本科生论文模板}
\newcommand{\xueyuan}{信息科学技术学院}
\newcommand{\zhuanye}{信息与计算科学}
\newcommand{\xingming}{暨小小}
\newcommand{\xuehao}{2018059999}
\newcommand{\daoshi}{暨大大}

\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0.4pt}%
  \fancyhf{}
  \chead{\small\biaoti}
  \cfoot{\small\thepage}
}

\fancypagestyle{main}{
  \renewcommand{\headrulewidth}{0.4pt}%
  \fancyhf{}
  \chead{\small\biaoti}
  \cfoot{\small\thepage}
}

\pagestyle{main}

\newcommand{\underspace}[1]{\kern0pt\underline{\hspace{#1}}\kern0pt\relax}
\newcommand{\underbox}[2]{\kern0pt\underline{\makebox[#1]{#2}}\kern0pt\relax}
\newcommand{\underparbox}[2]{\kern0pt\underline{\parbox[b]{#1}{#2}}\kern0pt\relax}
\newcommand{\ulinefill}[1]{\xleaders\hbox{\underline{\vphantom{#1}\kern1pt}}\hfill\kern0pt}
\newcommand{\fillout}[1]{\ulinefill{#1}\underline{#1}\ulinefill{#1}}

\CTEXoptions[today=big]

\renewcommand{\titlepage}{%
  \thispagestyle{empty}
  \centerline{\includegraphics[width=4cm,height=4cm]{jnulogo}}
  \begin{center}
  \zihao{-0}\heiti
  暨\ 南\ 大\ 学 \\ 本\ 科\ 生\ 毕\ 业\ 论\ 文
  \end{center}
  \vfill
  \noindent 论文题目：\fillout{\biaoti}
  \vfill
  \begin{center}
  学\qquad 院：\underbox{11em}{\xueyuan}\\[0.6em]
  专\qquad 业：\underbox{11em}{\zhuanye}\\[0.6em]
  姓\qquad 名：\underbox{11em}{\xingming}\\[0.6em]
  学\qquad 号：\underbox{11em}{\xuehao}\\[0.6em]
  指导教师：\underbox{11em}{\daoshi}
  \end{center}
  \vspace{2em}
  \centerline{\today}
  \newpage
}

\newcommand{\statement}{%
  \thispagestyle{plain}
  \begingroup
  \kaishu%\vspace{1.5cm}%
  \centerline{\zihao{2}诚\ 信\ 声\ 明}%
  \vspace{2.5cm}\zihao{-3}
  我声明，所呈交的毕业论文是本人在老师指导下进行的研究工作及取得的研究成果。
  据我查证，除了文中特别加以标注和致谢的地方外，
  论文中不包含其他人已经发表或撰写过的研究成果，
  也不包含为获得其他教育机构的学位或证书而使用过的材料。
  我承诺，论文中的所有内容均真实、可信。
  \par\vspace{5.5cm}%
  \noindent 毕业论文作者签名：\hfill 签名日期：\qquad 年\quad 月\quad 日
  \par
  \endgroup
  \newpage
}

\newenvironment{zhabstract}{%
  \thispagestyle{plain}
  \begin{center}
    \zihao{-2}\bfseries\biaoti
  \end{center}
}{\newpage}

\newenvironment{enabstract}{%
  \thispagestyle{plain}
  \begin{center}
    \zihao{-2}\bfseries\title
  \end{center}
}{\newpage}

\newcommand{\zhaiyao}{
  \vspace{0.5cm}\noindent\textbf{[摘要]\quad}
}
\newcommand{\guanjianci}{
  \par\vspace{1cm}\noindent\textbf{[关键词]\quad}
}

\newcommand{\abstract}{
  \vspace{0.5cm}\noindent\textbf{Abstract:\quad}
}
\newcommand{\keywords}{
  \par\vspace{1cm}\noindent\textbf{Keywords:\quad}
}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3} % 默认 subsubsection 不显示编号

\renewcommand{\contentsname}{\hfill 目\quad 录\hfill}

\RequirePackage{titletoc}
%\titlecontents{标题层次}[左间距]{上间距和整体格式}{标题序号}{标题内容}{指引线和页码}[下间距]
\titlecontents{chapter}[1em]{\addvspace{.3em}\bfseries}{\contentslabel{1em}}{}
                            {\ \titlerule*[5pt]{$\cdot$}\contentspage}[\addvspace{.3em}]
\titlecontents{section}[2.8em]{}{\contentslabel{1.8em}}{}{\ \titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4.6em]{}{\contentslabel{2.6em}}{}{\ \titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[6.4em]{}{\contentslabel{3.4em}}{}{\ \titlerule*[5pt]{$\cdot$}\contentspage}

\CTEXsetup[name={,},number={\arabic{chapter}},
           format={\huge\bfseries\raggedright},nameformat={\huge\bfseries},aftername={\ }]{chapter}
\CTEXsetup[name={,},number={\arabic{chapter}.\arabic{section}},
           format={\Large\bfseries\raggedright},nameformat={\Large\bfseries},aftername={\ }]{section}
\CTEXsetup[name={,},number={\arabic{chapter}.\arabic{section}.\arabic{subsection}},
           format={\large\bfseries\raggedright},nameformat={\large\bfseries},aftername={\ }]{subsection}
\CTEXsetup[name={,},number={\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
           format={\bfseries\raggedright},nameformat={\bfseries},aftername={\ }]{subsubsection}

\newcommand\ignorepars{\@ifnextchar\par{\expandafter\ignorepars\@gobble}{}}

\InputIfFileExists{jnuthesis.cfg}{}{}

\newcommand{\my@set@sourcehan}{
  \setCJKmainfont[BoldFont=Source Han Sans SC]{Source Han Serif SC}
  \setCJKsansfont{Source Han Sans SC}
  % 用中文字体名时 LuaTeX 找不到该字体，XeTeX 正常
  %\setCJKmainfont[BoldFont=思源黑体]{思源宋体}
  %\setCJKsansfont{思源黑体}
}

\ifbool{sourcehan}{
  \RequirePackage{iftex}
  % https://sourceforge.net/p/xetex/code/ci/master/tree/source/texk/web2c/xetexdir/NEWS
  \ifbool{XeTeX}{ % TeXLive 2015
    \ifdimless{\the\XeTeXversion\XeTeXrevision pt}{0.99992pt}{}{\my@set@sourcehan}
  }{}
  \ifbool{LuaTeX}{\my@set@sourcehan}{}
}{}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{4pt minus 2pt}
  \setlength{\belowdisplayskip}{4pt minus 2pt}
  \setlength{\abovedisplayshortskip}{2pt}
  \setlength{\belowdisplayshortskip}{2pt}
}

\setlength\arraycolsep{4pt}

\RequirePackage{CJKfntef}
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{relsize}
\newcommand{\Int}{\mathop{\mathlarger{\int}}}

\newcommand{\e}{\mathrm{e}}
\newcommand{\limit}{\lim\limits}
\newcommand{\R}{\mathbb{R}}

\DeclareMathOperator{\Corr}{\rho}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\grad}{grad}
\DeclareMathOperator{\Prj}{Prj}
\DeclareMathOperator{\Var}{Var}

\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\dx}{\diff x}
\newcommand{\dy}{\diff y}
\def\dz{\diff z} % 不确定命令是否已经定义
\newcommand{\du}{\diff u}
\newcommand{\dv}{\diff v}
\newcommand{\dr}{\diff r}
\newcommand{\ds}{\diff s}
\newcommand{\dt}{\diff t}
\newcommand{\dS}{\diff S}
% 有些宏包比如 hyperref 会修改 \d 的定义，所以放在 document 开始处
% 利用 etoolbox 将 \d 定义为健壮命令，以避免在 align 等环境中错误地展开
\AtBeginDocument{%
  \let\oldd=\d
  \renewrobustcmd{\d}{\ifbool{mmode}{\diff}{\oldd}}%
}

\newcommand{\va}{\vec{a\vphantom{b}}}
\newcommand{\vb}{\vec{b}}
\newcommand{\vc}{\vec{c\vphantom{b}}}
\newcommand{\vd}{\vec{d}}
\newcommand{\ve}{\vec{e}}
\newcommand{\vi}{\vec{i}}
\newcommand{\vj}{\vec{j}}
\newcommand{\vk}{\vec{k}}
\newcommand{\vn}{\vec{n}}
\newcommand{\vs}{\vec{s}}
\newcommand{\vv}{\vec{v}}

\let\ov=\overrightarrow

\let\lb=\{
\let\rb=\}

\def\T{\mathrm{T}\kern-.5pt}

\newrobustcmd{\wfrac}[3][2pt]{%
  {\begingroup\hspace{#1}#2\hspace{#1}\endgroup\over\hspace{#1}#3\hspace{#1}}%
}

