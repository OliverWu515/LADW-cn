%%
%% This is file `zhbook.cls',
%%
%% @author andy123t
%% @date 2025/05/08
%% @version v2.6
%% @address https://github.com/andy123t/zhbook
%%

%---------- 定义的新的Class ----------
\ProvidesClass{zhbook}[2025/05/08 v2.6]
\NeedsTeXFormat{LaTeX2e}

%---------- 定义的新的Options ----------
\newif\ifprint
\DeclareOption{print}{\printtrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%---------- 中文字体宏包 ----------
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToClass{fontset=none}{ctexbook}

%---------- 载入Class ----------
\LoadClass[UTF8,a4paper]{ctexbook}
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{zhbook}{ctex >= 2017/01/01 is required ...}{}%
}

%---------- 自定义字体设置 ----------
\setCJKmainfont[Mapping=fullwidth-stop, BoldFont={FandolSong-Bold.otf}, ItalicFont={FandolKai-Regular.otf}]{FandolSong-Regular.otf}
\setCJKsansfont[Mapping=fullwidth-stop, BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\setCJKmonofont[Mapping=fullwidth-stop]{FandolFang-Regular.otf}
\setCJKfamilyfont{zhsong}[Mapping=fullwidth-stop,BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
\setCJKfamilyfont{zhhei}[Mapping=fullwidth-stop,BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\setCJKfamilyfont{zhkai}[Mapping=fullwidth-stop]{FandolKai-Regular.otf}
\setCJKfamilyfont{zhfs}[Mapping=fullwidth-stop]{FandolFang-Regular.otf}
\newcommand*{\songti}{\CJKfamily{zhsong}}
\newcommand*{\heiti}{\CJKfamily{zhhei}}
\newcommand*{\kaishu}{\CJKfamily{zhkai}}
\newcommand*{\fangsong}{\CJKfamily{zhfs}}

%---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{
    left=4.0cm, right=4.0cm,
    top=3.0cm, bottom=3.0cm,
    headheight=15pt, headsep=18pt,
    footskip=28pt
}

%---------- 常用宏包 ----------
\RequirePackage{keyval}
\RequirePackage[leqno]{amsmath}
\RequirePackage{amssymb,amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{imakeidx}
\RequirePackage[totoc,itemlayout=relhang,unbalanced]{idxlayout}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{makecell}
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{anyfontsize}
\RequirePackage{titletoc}
\RequirePackage{pdfpages}
\RequirePackage[numbered]{bookmark}

%---------- 定义文档属性格式 ----------
\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand\subtitle{\gdef\@subtitle}
%\newcommand\institute{\gdef\@institute}
\newcommand\version{\gdef\@version}
\newcommand\extrainfo{\gdef\@extrainfo}
\newcommand\bioinfo[2]{\gdef\@bioinfo{{#1}：#2}}

%------- 重新定义cleardoublepage --------
\renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside
        \ifodd\c@page\else
            \thispagestyle{empty}%
            \hbox{}\newpage
            \if@twocolumn\hbox{}\newpage\fi
        \fi
    \fi
}

%---------- 设置超链接 ----------
\RequirePackage{hyperref}
\ifprint
\hypersetup{hidelinks}
\else
\hypersetup{%
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    filecolor=black,
    urlcolor=black,
    bookmarksdepth=3
}
\fi

%---------- 设置正文前页码为小写罗马数字 ----------
\renewcommand\frontmatter{%
    \ifprint\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}%
}

%---------- 设置正文页码为阿拉伯数字 ----------
\renewcommand\mainmatter{%
    \ifprint\cleardoublepage\else\clearpage\fi
    \pagenumbering{arabic}%
    \@mainmattertrue
}

%---------- 设置图片的路径 ----------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

%---------- 设置章节目录的深度 ----------
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{1}

%---------- 设置章节字号 ----------
\newcommand{\chapfont}{\fontsize{20bp}{28bp}\selectfont}

%---------- 定义章节标题格式 ----------
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\sffamily\heiti\chapfont\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {6pt},
        afterskip = {24pt},
        %pagestyle = main,
    },
    section = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = .\quad,
        beforeskip = {18pt},
        afterskip = {6pt},
    },
    subsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = .\quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    subsubsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = .\quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    },
}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}

%---------- 算法宏包及设置 ----------
\RequirePackage{algorithm,algorithmicx}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

%------------- 设置附录 -----------
%\renewcommand{\appendixname}{附录}

%---------- 定义页眉页脚 ----------
\newcommand{\headstyle}{%
    %\fancyhead[C]{\fangsong\zihao{5} \@title}
    \fancyhead[RO,LE]{\sffamily\zihao{5}$\cdot$\:\thepage\:$\cdot$}
    \fancyhead[LO]{\sffamily\fangsong\zihao{5}\nouppercase{\rightmark}}
    \fancyhead[RE]{\sffamily\fangsong\zihao{5}\nouppercase{\leftmark}}
}

\newcommand{\chapterpagenum}{%
  \begin{tabular}{@{}r@{}}        % 紧凑竖直排布
    \rule{0.6cm}{0.1cm}\\[-0.2ex] % 画横线，可按需调宽
    \zihao{5}\thepage             % 输出页码
  \end{tabular}}

%---------- 设置页脚样式 ----------
\newcommand{\footstyle}{%
    \fancyfoot[R]{\sffamily\chapterpagenum}
    %\fancyfoot[LE]{\zihao{5}\thepage}
    %\fancyfoot[RO]{\zihao{5}\thepage}
}

%---------- 定义plain样式 ----------
\fancypagestyle{plain}{%
    \fancyhf{}
    \footstyle
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

%---------- 定义main样式 ----------
\fancypagestyle{main}{%
    \fancyhf{}
    \headstyle
    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{main}

%---------- 中文段落缩进和行距 ----------
\setlength{\parindent}{2em}
\setlength{\parskip}{4pt plus 1pt minus 1pt}
\linespread{1.35}  % line space setting
%\renewcommand{\baselinestretch}{1.35}
%\topskip=15pt   % 书写区域顶部空白
%\setlength{\baselineskip}{24pt}

%---------- 浮动对象设置 ----------
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%---------- 设置图表格式 ----------
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}

%---------- 设置图片和表格样式 ----------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
%\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
%\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}

%---------- 重新设置图表autoref ----------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

%---------- 定义表格列类型 ----------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

%---------- 设置三线表格式 ----------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}

%---------- 数学定理设置 ----------
\newtheoremstyle{zhbook}{\topsep}{\topsep}%
{\kaishu}{}{\heiti}{\sffamily .}{5pt plus 1pt minus 1pt}%
{\thmname{#1}\thmnumber{\sffamily #2}\thmnote{ \normalfont (#3)}}%%
\theoremstyle{zhbook}
% \theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem*{corollary*}{推论}
\newtheorem{definition}[theorem]{定义}
\newtheorem*{definition*}{定义}
\newtheorem{proposition}[theorem]{命题}
\newtheorem{example}[theorem]{例}
\newtheorem*{example*}{例}
\newtheorem{remark}[theorem]{注}
\newtheorem*{remark*}{注}
\newtheorem*{question*}{问题}
\newtheorem{exercise}{习题}[section]
\newtheorem{assumption}{假设}[section]
\newtheorem{axiom}{公理}[section]
\newtheorem{property}{性质}[section]
\newtheorem{conjecture}{猜想}[section]
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{%
    \par\pushQED{\qed}%
    %\normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep3\p@\@plus3\p@\relax
    \trivlist\item[\hskip\labelsep
    \sffamily #1\@addpunct{:\,}]\ignorespaces
}{%
    \popQED\endtrivlist\@endpefalse
}

%---------- 定义定理的autoref ----------
\renewcommand{\theoremautorefname}{定理}
\newcommand{\lemmaautorefname}{引理}
\newcommand{\corollaryautorefname}{推论}
\newcommand{\definitionautorefname}{定义}
\newcommand{\propositionautorefname}{命题}
\newcommand{\exampleautorefname}{例}
\newcommand{\remarkautorefname}{注}
\newcommand{\exerciseautorefname}{习题}
\newcommand{\assumptionautorefname}{假设}
\newcommand{\axiomautorefname}{公理}
\newcommand{\propertyautorefname}{性质}
\newcommand{\conjectureautorefname}{猜想}

%---------- 数学公式设置 ----------
\allowdisplaybreaks[4]

%---------- 设置公式间距 ----------
\AtBeginDocument{%
    \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
    \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
    %\setlength{\arraycolsep}{2pt}
}

%------- 公式编号带章节 ----------
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}

% 重新设置公式autoref
\renewcommand{\equationautorefname}{公式}

%---------- 列表样式设置 ----------
\RequirePackage{enumitem}
\setlist{nolistsep}

%---------- 设置习题样式 ----------

\newlist{probenumerate}{enumerate}{2} % 最多嵌套2层
\setlist[probenumerate,1]{label={\textsf{\arabic{section}.\arabic*.}},ref={\arabic{section}.\arabic*},leftmargin=2em}
\setlist[probenumerate,2]{label={\alph*)},leftmargin=*}

\newenvironment{problemset}{
  \par
  \vspace{10pt}
  \pdfbookmark[2]{\exerciseautorefname}{problemset-\thechapter-\thesection}
  \noindent{\zihao{4}\bfseries\exerciseautorefname}
  \begin{probenumerate}\zihao{5}}{
  \end{probenumerate}}

%---------- 定义新的标题页面 ----------
\renewcommand{\maketitle}[1][15em]{%
    \clearpage
    \phantomsection
    \pdfbookmark[0]{封~~面}{cover}
    \begin{titlepage}
        \centering

        \vspace*{3.0\baselineskip}%

        \rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}  % thick line
        \rule{\textwidth}{0.5pt}   % thin line

        \vspace*{0.75\baselineskip} % blank space above the title

        \parbox[t]{\linewidth}{\centering\zihao{1}\sffamily\heiti\@title%
        \ifx\@subtitle\undefined{}\else
        \par
        \vspace*{0.25\baselineskip}%
        \zihao{2}\sffamily\heiti\@subtitle
        \fi
        }%

        \vspace*{0.75\baselineskip} % blank space under the title
    
        \rule{\textwidth}{0.5pt}\vspace*{-\baselineskip}\vspace{3.2pt} % thin line
        \rule{\textwidth}{1.6pt}   % thick line

        \vspace*{1\baselineskip}  % blank space after title

        % {\large\kaishu\renewcommand{\arraystretch}{1.2}%
        % \begin{tabular}{c}
        % \ifx\@author\empty{}\else 作者：\@author \\ \fi
        % %\ifx\@institute\undefined{}\else 机构：\@institute \\ \fi
        % % \ifx\@date\empty{}\else 日期：\@date \\ \fi
        % \ifx\@version\undefined{}\else 版本：\@version \\ \fi
        % \ifx\@bioinfo\undefined{}\else \@bioinfo \\ \fi
        % \end{tabular}}
        {\large\kaishu \ifx\@author\empty{}\else 作者：\@author \fi}\\[1ex]
        {\large\kaishu \ifx\@bioinfo\undefined{}\else \@bioinfo \\ \fi}

        \vspace*{\fill}%

        {\large \ifx\@extrainfo\undefined{}\else \@extrainfo \fi}\\ % extra info
        {\large \ifx\@date\empty{}\else \@date \\ \fi}

        \vspace*{0.1\baselineskip}%
    \end{titlepage}
    \ifprint\cleardoublepage\else\clearpage\fi
    \if@openright\cleardoublepage\fi
}

%---------- 定义中英文关键词 ----------
%--- 中文关键词
\newcommand{\cnkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries 关键词:~} #1%
}
%--- 英文关键词
\newcommand{\enkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries Key Words:~} #1%
}

%---------- 中文摘要环境 ----------
\newenvironment{cnabstract}{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{摘~~要}
    \chapter*{摘~~要}
    \chaptermark{摘~~要}
}{%
    \clearpage
}

%---------- 英文摘要环境 ----------
\newenvironment{enabstract}{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \chapter*{Abstract}
    \chaptermark{Abstract}
}{%
    \clearpage
}

%---------- 前言环境 ----------
\newenvironment{preface}[1][前~~言]{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \chaptermark{#1}
}{%
    \clearpage
    \if@openright\cleardoublepage\fi
}

%---------- 目录格式设置 ----------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{10pt plus 2pt minus 2pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapfont}{\sffamily\heiti}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftfigpresnum}{\figurename~}
\renewcommand{\cftsecpresnum}{\S}
\setlength{\cftfigindent}{0pt}
\setlength{\cftfignumwidth}{3.5em}
\renewcommand{\cfttabpresnum}{\tablename~}
\setlength{\cfttabindent}{0pt}
\setlength{\cfttabnumwidth}{3.5em}

%---------- 设置新的生成目录命令 ----------
\newcommand{\maketoc}{%
    % 设置目录hdr和页码选项
    \if@openright\cleardoublepage\else\clearpage\fi
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{\contentsname}
    \tableofcontents%
    \if@openright\cleardoublepage\else\clearpage\fi
}

%---------- 重定义插图清单 ----------
\newcommand\makelof{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}
    \chaptermark{\listfigurename}
    \@starttoc{lof}%
    \clearpage
}

%---------- 重定义表格清单 ----------
\newcommand\makelot{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}
    \chaptermark{\listtablename}
    \@starttoc{lot}%
    \clearpage
}

%---------- 定义主要符号表环境 ----------
\newenvironment{denotation}{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{主要符号表}
    \chapter*{主要符号表}
    \chaptermark{主要符号表}
}{%
    \clearpage
    \if@openright\cleardoublepage\fi
}

%---------- 重新定义附录命令 ----------
% \let\oldappendix\appendix
% \renewcommand{\appendix}[1]{%
%     \clearpage
%     \renewcommand{\theequation}{\Alph{chapter}\arabic{equation}}
%     \renewcommand{\thefigure}{\Alph{chapter}\arabic{figure}}
%     \renewcommand{\thetable}{\Alph{chapter}\arabic{table}}
%     \oldappendix{#1}%
% }

%---------- 重新定义参考文献页 ----------
\renewcommand{\bibname}{参考文献}
%--- 设置新的参考文献命令 ---
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
    % 添加到目录
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \oldbibliography{#1}%
}

% End of file `zhbook.cls'.
