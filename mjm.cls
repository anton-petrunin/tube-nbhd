%%
%% LaTeX Style for 'Muenster Journal of Mathematics'
%%
%% Thorsten Dikmann, 2008
%% thorsten >at< dikmann >dot< de
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{mjm}[2008/05/28 MJM style file by Thorsten Dikmann]

\newcommand{\mjmbaselayout}{amsart}
%\newcommand{\mjmbaselayout}{JGTart}


%\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\LoadClassWithOptions{\mjmbaselayout}
\LoadClassWithOptions{amsart}
%\ExecuteOptions
%\ProcessOptions\relax

%\AtEndDocument{\cleardoublepage}

% MJM Paper
\setlength\paperheight {240mm}%
\setlength\paperwidth  {170mm}%

% Crop Marks
%\usepackage[cam,width=17truecm,height=24truecm]{crop}

% Margins
\usepackage[top=50pt,bottom=94pt,left=80pt,right=64pt,twoside]{geometry}
%\usepackage[margin=1in,top=0.7in]{geometry}
%\setlength{\textheight}{538pt}

% http://www.uni-koblenz.de/~mbmann/latex_skript/skript_pdf5.pdf
\usepackage{calc}
% LaTeX Tipps & Tricks 2.�9 S.51
\usepackage{fp}

% For the title page
\usepackage{tabularx}

% % Inhaltsverzeichnis richtig ausrichten
% %
% \newbox\TwoNumbers
% \setbox\TwoNumbers\hbox{00}%
% \makeatletter
% \renewcommand{\tocsection}[3]{%
%   \indentlabel{\@ifnotempty{#2}{\ignorespaces
%       #1\hbox to\wd\TwoNumbers{\hss #2.}\quad }}#3}%
% \makeatother





\newcommand{\headauthor}[1]{
	\newcommand{\tmpheadauthor}{#1}
}
\newcommand{\headtitle}[1]{
	\newcommand{\tmpheadtitle}{#1}
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  LK - toc global 
% \newwrite\mjmtocfile
% \immediate\openout\mjmtocfile=\jobname.mjm
% %\newcommand{\mjmtocauthor}[1]{}
% %\newcommand{\mjmtoctitle}[1]{}
% \def\mjmtocentry#1#2{\@bsphack
%   \protected@write\mjmtocfile{}{\string\mjmdotocentry{#1}{#2}}
%   \@esphack}
% \newcommand\tocentry[2]{\mjmtocentry{#1}{#2}}
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %\newcommand{\tocentry}[2]{
% %}
% \newcommand{\mjmdotocentry}[2]{
% 	% Zugegeben: Es mit \section und anschliessend mit dviselect zu machen ist sicher keine elegante Moeglichkeit, aber \addcontentsline{toc}{chapter}{\textsc{#1}\\#2} hat einfach nicht funktioniert :(
% 	\newpage
% 	\section{\protect{\textsc{#1}\\#2}}
% 	\newpage
% }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\urndoi#1#2{\def\@doi{\parbox[t][0pt]{6cm}{DOI #2\\#1}}} %\\URN #1}}}
% \def\doi#1#2{\def\@doi{}}
\urndoi{}{}

\copyrightinfo{\mjmyear}{\mjmabbr}

%/-- TD
\def\commby#1{\def\@commby{\small{(Communicated by #1)}}}
% --/

\def\ps@firstpage{\ps@plain
	%/-- TD
  \def\@oddfoot{}%
  % Old:
  %\def\@oddfoot{\normalfont\scriptsize \hfil\thepage\hfil
  %   \global\topskip\normaltopskip}%
  % --/
  \let\@evenfoot\@oddfoot
  \def\@oddhead{\@serieslogo\hss}%
  \let\@evenhead\@oddhead % in case an article starts on a left-hand page
}

\def\@settitle{\begin{center}%
% 
 \baselineskip18\p@\relax
    %/-- TD
	\textbf{\@title}
% Old:
%\uppercasenonmath\@title
%  \@title
	% --/
  \end{center}%
}

\def\@setauthors{%
  \begingroup
  \def\thanks{\protect\thanks@warning}%
  \trivlist
  % /-- TD
  \centering\large \@topsep30\p@\relax
  %\centering\footnotesize \@topsep30\p@\relax
  % --/
  \advance\@topsep by -\baselineskip
  \item\relax
  \author@andify\authors
  \def\\{\protect\linebreak}%
  % /-- TD
  	\authors
  % Old:
  %\MakeUppercase{\authors}%
  % --/
  \ifx\@empty\contribs
  \else
    ,\penalty-3 \space \@setcontribs
    \@closetoccontribs
  \fi
  \endtrivlist
  \endgroup
}

\def\@maketitle{%
	%/-- TD
	\setlength{\parindent}{0mm}%
	\footnotesize{\begin{tabularx}{\textwidth}{@{}lXr@{}}%
			\mjmabbr~\textbf{\mjmvolume}~(\mjmyear),~\mjmfirstpage--\mjmlastpage
			&
				\hfill
			&
			\bfseries{\mjm} \\%
			\@doi
			&
				\hfill
			&
			\textcopyright~\copyrightholder~\copyrightyear\\
		\end{tabularx}
	}
	\vspace{5em}
	% --/
	
	%/-- TD
  \normalfont\LARGE
  %\normalfont\normalsize
  % --/
  \@adminfootnotes
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
  \global\topskip42\p@\relax % 5.5pc   "   "   "     "     "
  \@settitle
  \ifx\@empty\authors \else \@setauthors \fi
  % /-- TD
  \ifx\@empty\@commby \else  \begin{center}\vspace{1em}\@commby\end{center}\fi  %%\--LK \vspace{2em} \fi
  % --/
  % /-- LK
  \ifx\@empty\@dedicatory \else  \begin{center}\vspace{1em}\small\it\@dedicatory\end{center}\fi
  %
  \@setabstract
  \normalsize
  \if@titlepage
    \newpage
  \else
    \dimen@34\p@ \advance\dimen@-\baselineskip
    \vskip\dimen@\relax
  \fi
} % end \@maketitle

%
%%\-- LK abstract so geaendert, dass der Text nicht eingerueckt wird.
%
\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle\space in AMS document classes; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont\Small
    \list{}{\labelwidth\z@
      \leftmargin0pc \rightmargin\leftmargin
      \listparindent\normalparindent \itemindent\z@
      \parsep\z@ \@plus\p@
      \let\fullwidthdisplay\relax
    }%
    \item[\hskip\labelsep\bfseries\abstractname.]%
}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}

%
%%\-- LK \received{...} eingefuehrt
%

\newcommand{\@received}{}
\newcommand{\received}[2][]{\renewcommand{\@received}{\small Received #2}}% 

%
%%\-- LK received wird am Ende des Textes gedruckt
%

\def\enddoc@text{\setlength{\parindent}{0mm}%
\par\addvspace\bigskipamount\indent \@received
  \ifx\@empty\addresses \else\@setaddresses\fi}

%
%%\-- LK adress erlaubt \\ fuer Zeilenumbrueche, email und url geaendert
%
\def\curraddrname{{\itshape Current address}}
\def\emailaddrname{{E-mail}}
\def\urladdrname{{URL}}
\def\@setaddresses{\setlength{\parindent}{0mm}\par
  \nobreak \begingroup
\footnotesize
  \def\author##1{\nobreak\addvspace\bigskipamount}%
  %\def\\{\unskip, \ignorespaces}%
  \interlinepenalty\@M
  \def\address##1##2{\begingroup
    \par\addvspace\bigskipamount\indent
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    {\ignorespaces##2}\par\endgroup}%
  \def\curraddr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent\curraddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      ##2\par}\endgroup}%
  \def\email##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent\emailaddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \def\urladdr##1##2{\begingroup
    \def~{\char`\~}%
    \@ifnotempty{##2}{\nobreak\indent\urladdrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \addresses
  \endgroup
}

\endinput


