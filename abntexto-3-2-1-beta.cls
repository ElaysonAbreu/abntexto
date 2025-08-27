%! Public Domain Software
%! 2024-12-29
%! 3.2.1-beta
%! Elayson Abreu
%! abntexto.classe@gmail.com

%! RECOMENDAÇÕES
%! PRÉ-CONFIGURAÇÕES
%! FONTES
%! LAYOUT
%! SUMÁRIO
%! SECIONAMEMTO
%! CITAÇÕES
%! ALÍNEAS
%! TABELAS
%! ÁREAS DE LEGENDA
%! NOTAS DE RODAPÉ
%! IDENTIFICAÇÃO DO TRABALHO
%! A VÍRGULA COMO SEPARADOR DECIMAL
%! INICIALIZAÇÃO

% \sec RECOMENDAÇÕES

% Macros internas não devem ser modificadas ou usadas diretamente. Isso é porque essas macros podem ser redefinidas ou até renomeadas em futuras versões desta classe. Por macros internas entende-se aquelas com o prefixo do pacote em questão, neste caso, |tnba@|. Se você precisa de algum comando interno, defina outro sem anexar o prefixo.

% \sec PRÉ-CONFIGURAÇÕES

% Identificação do formato \TeX\ e da classe, carregando a classe |article| e os únicos pacotes do |abntexto|.

% \begin{code}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{abntexto}[2024-12-29 3.2.1-beta Preparation of works in ABNT standards]

\LoadClass{article}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{csquotes}
% \end{code}

% Um atalho para |\ClassError|.

% \begin{code}
\def\tnba@error#1{\ClassError{abntexto}{#1}{}}
% \end{code}

% Condicionais para identificação da extensão TeX.

% \begin{code}
\newif \iftnba@PDFTEX
\newif \iftnba@XETEX
\newif \iftnba@LUATEX

\ifx\directlua\undefined \ifx\XeTeXversion\undefined
	\tnba@PDFTEXtrue \else
	\tnba@XETEXtrue  \fi \else
	\tnba@LUATEXtrue     \fi
% \end{code}

% \sec FONTE TIPOGRÁFICA

% O tamanho 12\,pt foi definido ao final deste manual e é o tamanho padrão da classe. Com ele foi definido um tamanho menor |\small|.

% \begin{code}
\def\sizedef#1#2#3#4{\DeclareRobustCommand#1{\fontsize{#2}{#3}\selectfont#4\relax}}

\def\spacing#1{\def\currspacing{#1}%
	\@tempdima=\f@size pt \baselineskip=#1\@tempdima \ignorespaces
}

\AddToHook{begindocument}{%
	\@tempdima=\f@size pt \baselineskip=\currspacing\@tempdima \relax
}

\def\singlesp{\baselineskip=\normalbaselineskip}
\def\onehalfsp{\spacing{1.5}}
\def\doublesp{\spacing{2}}
% \end{code}

% \sec \emph{LAYOUT}

% O estilo de página |\pretextual| omite a numeração de página e desliga o modo |twoside| porque os elementos pré-textuais que compreendem as folhas da capa à do sumário, devem constar no anverso da página, ou seja, na “frente” da folha.

% A instrução |\textual| põe a numeração de página no topo direito nas páginas ímpares e no topo esquerdo em páginas pares. Além disso, |twoside| vai espelhar as margens horizontais.

% Ambos |\pretextual| e |\textual| são iniciados automaticamente.

% O comando |\eletroniclayout| é útil para leitura do trabalho em {\em display} digital.

% Por algum motivo, |\newgeometry| reseta |\baselineskip| e |\parindent|, então temos de repetir estas instruções.

% \begin{code}
\def\onesidelayout{%
	\newgeometry{
		twoside=false,
		left   = 3cm,
		top    = 3cm,
		right  = 2cm,
		bottom = 2cm
	}
}
\def\twosidelayout{%
	\newgeometry{
		twoside=true,
		left   = 3cm,
		top    = 3cm,
		right  = 2cm,
		bottom = 2cm
	}%
}
\def\eletroniclayout{%
	\newgeometry{
		twoside=false,
		left   = 2.5cm,
		top    = 3cm,
		right  = 2.5cm,
		bottom = 2cm
	}%
}

\def\pretextual{%
	\onesidelayout
	\spacing{1.5}%
	\let\@oddhead=\empty
	\let\@evenhead=\empty
	\let\@oddfoot=\empty
	\let\@evenfoot=\empty
}
\def\textual{%
	\twosidelayout
	\spacing{1.5}%
	\parindent=1.5cm
	\def\@oddhead{\hfil\small\thepage}%
	\def\@evenhead{\small\thepage\hfil}%
}
% \end{code}

% \sec SUMÁRIO

% Aqui, a macro |\extline| foi baseada em |\@dottedtocline|, do kernel do LaTeX. Ela não é uma instrução privada, ou seja, com prefixo interno, porque existe a chance de o leitor querer redefiní-la.

% \begin{code}
\def\extpagenumwidth{1.55em}
\def\extrightmargin{2.55em}

\def\extline#1#2#3#4#5{%
	\begingroup
		\parindent=0pt \leftskip=#1\relax
		\rightskip=\extrightmargin\relax \parfillskip=-\rightskip
		#3{\global\advance\leftskip#2\relax \hskip-#2\relax #4}%
		\nobreak\extleaders\nobreak
		\hbox to\extpagenumwidth{\hfil #5\kern-1pt\kern1pt}\nbpar
	\endgroup
	\global\leftskip=0pt
}
\def\extleaders{\leaders\hbox{$\mathsurround=0pt \mkern4.5mu\hbox{.}\mkern4.5mu$}\hfill}

\def \l@part          {\addpenalty{-300}\addvspace{2.25em plus1pt}%
                       \extline{0pt}{\toclabelwidth}{\def\extleaders{\hfil}\tocpartfont}}
\def \l@chapter       {\addpenalty{-300}\addvspace{1em plus1pt}%
                       \extline{0cm}{\toclabelwidth}{\def\extleaders{\hfil}\tocchapterfont}}
\def \l@section       {\addpenalty{-300}\addvspace{1em plus1pt}%
                       \extline{0pt}{\toclabelwidth}{\def\extleaders{\hfil}\tocsectionfont}}
\def \l@subsection    {\vskip0pt plus.2pt
                       \extline{0pt}{\toclabelwidth}{\tocsubsectionfont}}
\def \l@subsubsection {\vskip0pt plus.2pt
                       \extline{0pt}{\toclabelwidth}{\tocsubsubsectionfont}}
\def \l@paragraph     {\vskip0pt plus.2pt
                       \extline{0pt}{\toclabelwidth}{\tocparagraphfont}}
\def \l@subparagraph  {\vskip0pt plus.2pt
                       \extline{0pt}{\toclabelwidth}{\tocsubparagraphfont}}

\def\toclabelbox#1{\hbox to\toclabelwidth{#1\hss}}
% \end{code}

% \sec SECIONAMENTO

% Nesta parte estão definidos os comandos secionais. Nenhum destes comandos são internos, caso o leitor queira redefiní-los.

% O comando |\hangfrom| é oriundo do kernel. Ele vai ser útil na formatação das seções.

% A ideia de usar |\nonum| e |\notoc| ao invés de * vem do Op\TeX\ (muitas outras implementações aqui foram inspiradas nele).

% \begin{code}
\newif\ifnotoc
\newif\ifnonum

\let\hangfrom=\@hangfrom
\def\nbpar{{\interlinepenalty=10000\par}}
\def\trytextual{\textual \let\textual=\relax}
\def\nonum{\global\nonumtrue}
\def\notoc{\global\notoctrue}
\def\resetnonumnotoc{\global\notocfalse \global\nonumfalse}

\newcount\countseclevel

\newcount\countpart
\newcount\countchapter
\newcount\countsection
\newcount\countsubsection
\newcount\countsubsubsection
\newcount\countparagraph
\newcount\countsubparagraph

\def\thepart{\@Roman\countpart}
\def\thechapter{\the\countchapter}
\def\thesection{\the\countsection}
\def\thesubsection{\thesection .\the\countsubsection}
\def\thesubsubsection{\thesubsection .\the\countsubsubsection}
\def\theparagraph{\thesubsubsection .\the\countparagraph}
\def\thesubparagraph{\theparagraph .\the\countsubparagraph}

\def\recountchapter       {\countsection=0 \recountsection}
\def\recountsection       {\countsubsection=0 \recountsubsection}
\def\recountsubsection    {\countsubsubsection=0 \recountsubsubsection}
\def\recountsubsubsection {\countparagraph=0 \recountparagraph}
\def\recountparagraph     {\countsubparagraph=0 }

\def\printpart#1{%
	\begingroup
		\centering\huge\bfseries Parte \thepart
		\vskip20pt
		\Huge\bfseries #1\nbpar
	\endgroup
}

\def\printchapter#1{%
	\begingroup
		\raggedright\huge\bfseries
		\ifnonum \else Capítulo \thechapter \vskip20pt \fi
		\Huge\bfseries #1\nbpar
	\endgroup
}
\def\printnonumchapter#1{{\centering\Huge\bfseries{#1}\par}}

\def\printsection#1{{%
	\hangfrom{\sectionfont\thesection\quad}%
	\sectionfont{#1}\nbpar
}}
\def\printnonumsection#1{{\centering\sectionfont{#1}\par}}

\def\printsubsection#1{{%
	\hangfrom{\subsectionfont\thesubsection\quad}%
	\subsectionfont{#1}\nbpar
}}
\def\printsubsubsection#1{{%
	\hangfrom{\subsubsectionfont\thesubsubsection\quad}%
	\subsubsectionfont{#1}\nbpar
}}
\def\printparagraph#1{{%
	\hangfrom{\paragraphfont\theparagraph\quad}%
	\paragraphfont{#1}\nbpar
}}
\def\printsubparagraph#1{{%
	\hangfrom{\subparagraphfont\thesubparagraph\quad}%
	\subparagraphfont{#1}\nbpar
}}
% \end{code}

% A instrução |\setlabel| ensina a forma como |\label|'s devem ser referenciados. O comando |\setlabel| será útil em outros contextos.

% As referências cruzadas (\emph{cross ref}) serão impressas por meio de |\ref| conforme |\cfpart|, |\cfchapter| etc. O leitor pode querer redefiní-los.

% \begin{code}
\def\setlabel#1{\def\@currentlabel{#1}}

\def\cfpart          {parte\,\thepart}
\def\cfchapter       {capítulo\,\thechapter}
\def\cfsection       {secão\,\thesection}
\def\cfsubsection    {subseção\,\thesubsection}
\def\cfsubsubsection {subseçao\,\thesubsubsection}
\def\cfparagraph     {subseçao\,\theparagraph}
\def\cfsubparagraph  {subseçao\,\thesubparagraph}
% \end{code}

% Por meio de |\trytextual|, a instrução |\textual| é iniciada automaticamente na primeira chamada de |\section|, |\chapter| ou |\part|, conforme o nível secional principal.

% É mais provável que o usuário queira redefinir comandos como |\printsection|, |\printsubsection| ao invés de seus invólucros maiores, neste caso, |\section| e |\subsection|.

% \begin{code}
\def\partlevel          {-1}
\def\chapterlevel       {0}
\def\sectionlevel       {1}
\def\subsectionlevel    {2}
\def\subsubsectionlevel {3}
\def\paragraphlevel     {4}
\def\subparagraphlevel  {5}

\def\part#1{\ifnonum\else\cleardoublepage\fi \ifnonum\else\trytextual\fi
	\leavevmode\vfil
	\ifnonum \else
		\global\advance\countpart by1
	\fi
	\countseclevel=\partlevel\relax \ifnonum \else \setlabel\cfpart \fi
	\ifnotoc \else
		\addtoext{toc}{part}{\ifnonum \else \protect\toclabelbox{\thepart}\fi #1}%
	\fi
	\printpart{#1}%
	\markpart{#1}%
	\resetnonumnotoc
	\newpage
}
\def\chapter#1{\ifnonum\else\cleardoublepage\fi \ifnonum\else\trytextual\fi
	\leavevmode\vskip\abovechapter\relax
	\ifnonum \else
		\global\advance\countchapter by1 {\globaldefs=1 \recountchapter}%
	\fi
	\countseclevel=\chapterlevel\relax \ifnonum \else \setlabel\cfchapter \fi
	\ifnotoc \else
		\addtoext{toc}{chapter}{\ifnonum \else \protect\toclabelbox{\thechapter}\fi #1}%
	\fi
	\ifnonum
		\printnonumchapter{#1}\else
		\printchapter{#1}%
	\fi
	\markchapter{#1}%
	\resetnonumnotoc
	\par\nobreak \vskip\belowchapter\relax
}
\def\section#1{\ifnonum\else\trytextual\fi \addpenalty{-300}\addvspace\abovesection
	\ifnonum \else
		\global\advance\countsection by1 {\globaldefs=1 \recountsection}%
	\fi
	\countseclevel=\sectionlevel\relax \ifnonum \else \setlabel\cfsection \fi
	\ifnotoc \else
		\addtoext{toc}{section}{\ifnonum \else \protect\toclabelbox{\thesection}\fi #1}%
	\fi
	\ifnonum
		\printnonumsection{#1}\else
		\printsection{#1}%
	\fi
	\marksection{#1}%
	\resetnonumnotoc
	\par\nobreak \vskip\belowsection\relax % Esse \par é necessário.
}
\def\subsection#1{\addpenalty{-300}\addvspace\abovesubsection
	\global\advance\countsubsection by1 {\globaldefs=1 \recountsubsection}%
	\countseclevel=\subsectionlevel\relax \setlabel\cfsubsection
	\addtoext{toc}{subsection}{\protect\toclabelbox{\thesubsection}#1}%
	\printsubsection{#1}%
	\marksubsection{#1}%
	\par\nobreak \vskip\belowsubsection\relax
}
\def\subsubsection#1{\addpenalty{-300}\addvspace\abovesubsubsection
	\global\advance\countsubsubsection by1 {\globaldefs=1 \recountsubsubsection}%
	\countseclevel=\subsubsectionlevel\relax \setlabel\cfsubsubsection
	\addtoext{toc}{subsubsection}{\protect\toclabelbox{\thesubsubsection}#1}%
	\printsubsubsection{#1}%
	\par\nobreak \vskip\belowsubsubsection\relax
}
\def\paragraph#1{\addpenalty{-300}\addvspace\aboveparagraph
	\global\advance\countparagraph by1 {\globaldefs=1 \recountparagraph}%
	\countseclevel=\paragraphlevel\relax \setlabel\cfparagraph
	\addtoext{toc}{paragraph}{\protect\toclabelbox{\theparagraph}#1}%
	\printparagraph{#1}%
	\par\nobreak \vskip\belowparagraph\relax
}
\def\subparagraph#1{\addpenalty{-300}\addvspace\abovesubparagraph
	\global\advance\countsubparagraph by1 {\globaldefs=1 \recountsubparagraph}%
	\countseclevel=\subparagraphlevel\relax \setlabel\cfsubparagraph
	\addtoext{toc}{subparagraph}{\protect\toclabelbox{\thesubparagraph}#1}%
	\printsubparagraph{#1}%
	\par\nobreak \vskip\belowsubparagraph\relax
}
% \end{code}

% O |\@starttoc| pode ser usado não apenas para criar sumários, mas também listas em geral, como listas de figuras, tabelas etc. as quais são armazenadas em arquivos de extensão predefinida, a saber, |.toc|, |.lof|, |.lot| entre outros. Portanto, |\makeext| parece ter mais valor semântico.

% Comandos como |\printbibliography| e |\printglossaries| já vêm com título embutido. Mas este título precisa estar inserido na macro secional principal, |\section| ou |\chapter|, dependendo de |\usechapters|/|\useparts| estar ativado ou não. Por este motivo foi definido o ambiente |corrprint|.

% \begin{code}
\def\makeext#1{\@starttoc{#1}}
\def\maketoc{\makeext{toc}}

\def\corrprint{\begingroup
	\def\tmp{section}%
	\ifx\mainsecname\tmp
		\let\origsection=\section
		\def\chapter##1##2{\nonum \origsection {##2}}%
		\def\section##1##2{\nonum \origsection {##2}}%
	\else
		\edef\mainsecname{orig\mainsecname}%
		\let\origchapter=\chapter
		\let\origsection=\section
		\def\chapter##1##2{\nonum \csname\mainsecname\endcsname {##2}}%
		\def\section##1##2{\nonum \csname\mainsecname\endcsname {##2}}%
	\fi
}
\def\endcorrprint{\par\endgroup}

\def\mainsecname{section}
\def\mainseclevel{\sectionlevel}
\def\maintocfont{\tocsectionfont}

\def\usechapters{%
	\def\l@section{\extline{0pt}{\toclabelwidth}{\tocsectionfont}}%
	\def\thesection{\thechapter.\the\countsection}%
	\def\mainsecname{chapter}%
	\def\mainseclevel{\chapterlevel}%
	\def\maintocfont{\tocchapterfont}%
}
\def\useparts{\usechapters
	\def \l@chapter {\addpenalty{-300}\addvspace{1em plus1pt}%
	                 \extline{0pt}{\toclabelwidth}{\tocchapterfont}}%
}
% \end{code}

% Quando |\usechapters| está ativo, o LaTeX, por algum motivo, exige a criação do contador |\c@chapter|.

% \begin{code}
\newcount\c@chapter

\AddToHook{begindocument}{%
	\pdfstringdefDisableCommands{\def\toclabelbox#1{#1 }}%
}

\def\markpart#1{}
\def\markchapter#1{}
\def\marksection#1{\markboth
	{\MakeUppercase{\thesection\quad #1}}%
	{}%
}
\def\marksubsection#1{\markright{\MakeUppercase{\thesubsection\quad #1}}}
% \end{code}

% Os comandos a seguir são usados pelo |hyperref.sty| na criação de \emph{bookmarks} em PDFs.

% \begin{code}
\def\toclevel@part          {\partlevel}
\def\toclevel@chapter       {\chapterlevel}
\def\toclevel@section       {\sectionlevel}
\def\toclevel@subsection    {\subsectionlevel}
\def\toclevel@subsubsection {\subsubsectionlevel}
\def\toclevel@paragraph     {\paragraphlevel}
\def\toclevel@subparagraph  {\subparagraphlevel}

\def\toclevel@appendix {\mainseclevel}
\def\toclevel@annex    {\mainseclevel}
% \end{code}

% A definição de |\addtoext| depende de o |hyperref.sty| estar presente ou não.

% \begin{code}
\def\addtoext#1#2#3{\noindent % Esse \noindent é necessário.
	\setcounter{section@level}{\countseclevel}%
	\NR@gettitle{#3}%
	\Hy@MakeCurrentHrefAuto{section*}%
	\setlength{\Hy@SectionHShift}{0pt}%
	\Hy@SectionAnchorHref{\@currentHref}%
	\addcontentsline{#1}{#2}{#3}%
}

\AddToHook{begindocument/before}{%
	\@ifpackageloaded{hyperref}{}{%
		\def\addtoext#1#2#3{\addcontentsline{#1}{#2}{#3}}%
		\let\pdfstringdefDisableCommands=\@gobble
	}%
}
% \end{code}

% Aqui estão definidos |\appendix| e |\annex|.

% \begin{code}
\newcount\countappendix
\newcount\countannex

\def\theappendix{\@Alph\countappendix}
\def\theannex{\@Alph\countannex}

\def\appendixlabelbox#1{\hbox to\appendixlabelwidth{Apêndice~#1~---\hss}}
\def\annexlabelbox#1{\hbox to\annexlabelwidth{Anexo~#1~---\hss}}

\AddToHook{begindocument}{\pdfstringdefDisableCommands{%
	\def\appendixlabelbox#1{Apêndice #1 }%
	\def\annexlabelbox#1{Anexo #1 }%
}}

\def \l@appendix {\addpenalty{-300}\addvspace{1em plus1pt}%
                  \extline{0pt}{\appendixlabelwidth}{\def\extleaders{\hfil}\maintocfont}}
\def \l@annex    {\addpenalty{-300}\addvspace{1em plus1pt}%
                  \extline{0pt}{\annexlabelwidth}{\def\extleaders{\hfil}\maintocfont}}

\def\cfappendix{Apêndice~\theappendix}
\def\cfannex{Anexo~\theannex}

\def\appendix#1{\newpage \global\advance\countappendix by1
	\addtoext{toc}{appendix}{\protect\appendixlabelbox{\theappendix}#1}%
	\setlabel\cfappendix
	\par\nointerlineskip
	\begingroup
		\def\abovesection{0pt}%
		\nonum\notoc \csname\mainsecname\endcsname {Apêndice~\theappendix~---~#1}%
	\endgroup
}
\def\annex#1{\newpage \global\advance\countannex by1
	\addtoext{toc}{annex}{\protect\annexlabelbox{\theannex}#1}%
	\setlabel\cfannex
	\par\nointerlineskip
	\begingroup
		\def\abovesection{0pt}%
		\nonum\notoc \csname\mainsecname\endcsname {Anexo~\theannex~---~#1}%
	\endgroup
}
% \end{code}

% \sec CITAÇÕES

% O comando |\enquote| é fornecido pelo pacote |csquotes|, carregado pela classe.

% \begin{code}
\long\def\Enquote#1{\par\ifdim\lastskip>0pt \vskip-\lastskip \fi
	\vskip\baselineskip
	{\noindent\leftskip=4cm \small \ignorespaces#1\unskip \par}%
	\vskip\baselineskip
}
% \end{code}

% \sec ALÍNEAS

% Estas linhas não foram baseadas no ambiente |list| do LaTeX, portanto não podem ser personalizadas por pacotes como |enumitem|, por exemplo.

% \begin{code}
\newcount\counttopicsdepth
\newcount\counttopics
\newcount\countsubtopics

\def\thetopics{\@alph\counttopics}
\def\thesubtopics{\the\countsubtopics}

\def\topicslabeli{\thetopics)}
\def\topicslabelii{---}

\def\cftopics{alínea~\thetopics)}
\def\cfsubtopics{subalínea~\thetopics\thesubtopics}

\def\topics{\par \advance\counttopicsdepth by1
	\ifnum\counttopicsdepth=1 \advance\leftskip\parindent \fi
	\advance\leftskip\topicslabelwidth
	\edef\topicsmakelabel{\expandafter\noexpand
		\csname topicslabel\romannumeral\counttopicsdepth\endcsname}%
	\let\item=\topicsitem
	\expandafter\def \expandafter\@esphack \expandafter{\@esphack\ignorespaces}%
}
\def\endtopics{\par}

\def\topicsitem{\par
	\ifnum\counttopicsdepth=1
		\advance\counttopics by1 \setlabel\cftopics
	\else
		\advance\countsubtopics by1 \setlabel\cfsubtopics
	\fi
	\noindent \kern-\topicslabelwidth
	\hbox to\topicslabelwidth{\topicsmakelabel\hfil}%
	\ignorespaces
}
% \end{code}

% \sec ÁREAS DE LEGENDA

% \begin{code}
\def\@nameedef#1{\expandafter\edef\csname#1\endcsname}

\def\definelegendplace#1#2#3#4{\expandafter\newcount\csname count#1\endcsname
	\@namedef{#1name}{#2}%
	\@nameedef{the#1}{\noexpand\the\csname count#1\endcsname}%
	\@nameedef{cf#1}{\unexpanded{#3}\expandafter\noexpand\csname the#1\endcsname}%
	\@namedef{#1ext}{#4}%
	\@nameedef{l@#4i}{\noexpand\extline{0pt}%
		{\expandafter\noexpand\csname #4labelwidth\endcsname}%
		{\expandafter\noexpand\csname #4ifont\endcsname}}%
	\@namedef{#4labelwidth}{5.4em}%
	\@nameedef{#4labelbox}##1{\hbox to\expandafter\noexpand\csname #4labelwidth\endcsname{#2~##1~---\hss}}%
	\AddToHook{begindocument}{%
		\pdfstringdefDisableCommands{\@namedef{#4labelbox}##1{##1 }}%
	}%
	\@namedef{#4ifont}{\maintocfont}%
	\@namedef{make#4}{\makeext{#4}}%
}
% \end{code}

% O valor de |\placewidth| foi configurado após |\begin{document}|, pois o valor de |\linewidth| durante e depois do preâmbulo não são necessariamente iguais.

% \begin{code}
\newdimen\placewidth \AddToHook{begindocument}{\placewidth=.43\linewidth}
\newdimen\savedplacewidth

\def\printlegend#1{\setbox0=\hbox{\legendlabel#1}%
	\hfil \vtop{\hsize=\ifdim\wd0>\legendmaxwidth \legendmaxwidth\else\wd0 \fi
		\singlesp
		\hangfrom\legendlabel #1%
		\par\xdef\savedprevdepth{\the\prevdepth}%
	}%
	\printlegendA
	\par\nointerlineskip \nobreak\vskip\medskipamount
}
\def\printlegendA{%
	\def \@tempa{\expandafter\noexpand \csname\csname\savedplace ext\endcsname labelbox\endcsname}%
	\edef\@tempa{\noexpand\addtoext
		 {\csname \savedplace ext\endcsname}%
		 {\csname \savedplace ext\endcsname i}%
		 {\noexpand\protect \@tempa {\thelegend}\noexpand\savedlegend}%
	}%
	\@tempa
}
\def\printplace#1{\setbox0=\hbox{\ignorespaces#1\unskip}%
	\global\savedplacewidth=\wd0
	\hfil \unhbox0
	\par\nointerlineskip \nobreak\vskip\medskipamount
}
\def\printsrc#1{\hfil \vbox{\hsize=\savedplacewidth
	\raggedright\footnotesize\singlesp
	\hangfrom\srclabel #1%
}}

\def\place#1{\par \vskip\aboveplace\relax
	\begingroup
		\parindent=0pt\parskip=0pt
		\ifx\empty\savedplace\else \printlegend\savedlegend \fi
		\printplace{#1}%
		\printsrc\savedsrc
	\par\endgroup
	\resetplace
	\vskip\belowplace\relax
}
\def\subplace#1{\leavevmode
	\vtop{\hsize=\placewidth \linewidth=\hsize
		\parindent=0pt\parskip=0pt
		\ifx\empty\savedplace\else \printlegend\savedlegend \fi
		\printplace{#1}%
		\printsrc\savedsrc
		\par\xdef\savedprevdepth{\the\prevdepth}%
	}%
	\resetplace
	\ignorespaces
}
\def\resetplace{%
	\let\savedplace=\empty
	\let\savedlegend=\empty
	\let\savedsrc=\empty
	\setlabel{}%
}

\def\legend#1#2{\ifdim\lastskip>0pt \vskip-\lastskip\fi
	\def\savedplace{#1}%
	\def\savedlegend{#2}%
	\ifx\empty#1\else
		\global\advance\csname count#1\endcsname by1
		\setlabel{\csname cf#1\endcsname}%
	\fi
	\ignorespaces
}
\def\sublegend#1#2{\ifdim\lastskip>0pt \vskip-\lastskip\fi
	\def\savedplace{#1}%
	\def\savedlegend{#2}%
	\ifx\empty#1\else
		\global\advance\@tempcnta by1
		\setlabel{\csname cf#1\endcsname \@alph\@tempcnta}%
	\fi
	\ignorespaces
}

\def\src#1{\ifdim\lastskip>0pt \vskip-\lastskip\fi
	\ifx\empty#1\else \def\savedsrc{#1}\fi
	\ignorespaces
}

\def\legendname{\csname \savedplace name\endcsname}
\def\thelegend{\the\csname count\savedplace\endcsname}

\def\savedlegend{}
\def\savedplace{}
\def\savedsrc{}

\newenvironment{multiplace}{\par \ifdim\lastskip>0pt \vskip-\lastskip \fi
	\vskip\aboveplace\relax
	\ifx\savedlegend\empty \else
		\printlegend\savedlegend \par\prevdepth=\savedprevdepth\relax
	\fi
	\noindent
	\def\legendmaxwidth{\placewidth}%
	\@tempcnta=0 \let\legend=\sublegend \let\legendlabel=\sublegendlabel
	\let\printlegendA=\relax
	\ignorespaces
}{%
	\unskip
	\vskip\belowplace\relax
	\par\prevdepth=\savedprevdepth\relax
}
% \end{code}

% O suporte para tabelas que se partem entre páginas usando |longtable.sty| ainda está em desenvolvimento.

% \begin{code}
\AddToHook{begindocument}{%
	\def\LT@makecaption#1#2#3{\LT@mcol{\LT@cols}{c}{%
		\hbox to\z@{\hss
			\parbox[t]{\legendmaxwidth}{\def\savedplace{table}\global\setlabel\cftable
				\legendlabel#3\endgraf\vskip\baselineskip}%
		\hss}%
	}}%
	\def\LT@c@ption#1[#2]#3{%
		\LT@makecaption#1\fnum@table{#3}%
		\def\@tempa{#2}%
		\ifx\@tempa\@empty\else
		{\let\\\space
			\addtoext{lot}{lofi}{\protect\lotlabelbox{\the\counttable}#2}}%
		\fi
	}%
}

\AddToHook{begindocument}{\@ifpackageloaded{longtable}{\LTpre=\baselineskip \LTpost=\baselineskip}{}}

\def\longlegend#1{%
	\caption{#1} \\ \hline \endfirsthead
	\caption*{#1}\\ \multicolumn{\LT@cols}{r}{\small (continuação)} \\ \hline \endhead
}
\def\longsrc#1{\LT@mcol{\LT@cols}{c}{%
	\hbox to\z@{\hss \savedplacewidth=\legendmaxwidth
		\parbox[b]{\legendmaxwidth}{\vskip\medskipamount \printsrc{#1\vskip-\baselineskip}}%
	\hss}%
}}

\AddToHook{begindocument}{\let\c@table=\counttable}
% \end{code}

% \sec NOTAS DE RODAPÉ

% As notas de rodapé também foram modificadas.

% \begin{code}
\def\@makefnmark{\hbox{\@textsuperscript{\selectfont\@thefnmark}}}
\def\@makefntext#1{\hangfrom{\@makefnmark\kern2pt}\small #1}
\def\footnoterule{\kern18pt \hrule width5cm \kern2.6pt }
% \end{code}

% \sec IDENTIFICAÇÃO DO TRABALHO

% \begin{code}
\def\Enter{\@ifnextchar[\tnba@Enter{\tnba@Enter[]}}
\def\tnba@Enter[#1]{\vskip#1\baselineskip}

\long\def\indexcard#1{\hbox{\vrule\vbox to7.5cm{\hsize=12.5cm
	\advance\hsize by-2cm
	\advance\hsize by-0.8pt
	\hrule\indexcardA{#1}\vss\xindexcardbar\hrule}\vrule}%
}
\long\def\indexcardA#1{\hbox spread2cm{\hss\vbox spread2cm{\vss
	\ttfamily\small\parindent=1em #1%
	\vss}\hss}%
}

\def\xindexcardbar{}
\def\indexcardbar{\def\xindexcardbar{\hrule\kern1cm}}

\def\judgeline#1{{\centering \rule{.7\linewidth}{.6pt}\\ #1\par}\Enter[1.5]}
% \end{code}

% \sec A VÍRGULA COMO SEPARADOR DECIMAL

% No Brasil e em outro lugares a vírgula é um separador decimal, portanto |$1,2$| deve produzir um resultado diferente de |$1, 2$|, por exemplo.

% As linhas abaixo são uma cópia da implementação do pacote |icomma|.

% \begin{code}
{\catcode`,=13
	\gdef,{\futurelet\@let@token\tnba@smartcomma}
}
\def\tnba@smartcomma{%
	\ifx\@let@token\@sptoken \else
	\ifx\@let@token\space    \else \mathord \fi\fi
	\tnba@mathcomma
}

\AddToHook{begindocument}{%
	\mathchardef\tnba@mathcomma=\mathcode`\,%
	\mathcode`\,="8000
}
% \end{code}

% Abaixo está definido um ajuste para que o |hyperref| não crie conflitos com |\MakeUppercase| nas entradas do sumário.

% \begin{code}
\iftnba@XETEX \else
	\AddToHook{begindocument/before}{
		\let\tnba@hyper@linkstart=\hyper@linkstart
		\protected\def\hyper@linkstart#1#2{\lowercase{\tnba@hyper@linkstart{#1}{#2}}}
	}
\fi
% \end{code}

% \sec COMANDOS OBSOLETOS

% O |abntexto| emitirá um aviso ou erro caso um destes comandos seja usado.

% \begin{code}
\def\tnba@undefcmd#1{\def#1{\tnba@error{%
	O comando "\noexpand#1" não existe mais%
}}}
\def\tnba@obscmd#1#2{\def#1{\tnba@error{%
	O comando "\noexpand#1" é obsoleto, use "\unexpanded{#2}" ao invés%
}}}

\tnba@undefcmd \extlineshape
\tnba@undefcmd \advcount
\tnba@undefcmd \definefontsize
\tnba@undefcmd \setfontsize
\tnba@undefcmd \fontsizedef
\tnba@undefcmd \paper
\tnba@undefcmd \papersizedef
\tnba@undefcmd \startseci
\tnba@undefcmd \startsecii
\tnba@undefcmd \startseciii
\tnba@undefcmd \startseciv
\tnba@undefcmd \startsecv
\tnba@undefcmd \sectionuppercase
\tnba@undefcmd \tociuppercase

\tnba@obscmd \sectionspaces       {\def\abovesection{valor}\def\belowsection{valor}}
\tnba@obscmd \subsectionspaces    {\def\abovesubsection{valor}\def\belowsubsection{valor}}
\tnba@obscmd \subsubsectionspaces {\def\abovesubsubsection{valor}\def\belowsubsubsection{valor}}
\tnba@obscmd \paragraphspaces     {\def\aboveparagraph{valor}\def\belowparagraph{valor}}
\tnba@obscmd \subparagraphspaces  {\def\abovesubparagraph{valor}\def\belowsubparagraph{valor}}
\tnba@obscmd \qt    \enquote
\tnba@obscmd \quote \Enquote
% \end{code}

% \sec INICIALIZAÇÃO

% Aqui o |abntexto| define as configurações padrões.

% \begin{code}
\sizedef\normalsize{12pt}{14.5pt}{%
	\abovedisplayskip=12pt plus3pt minus7pt
	\belowdisplayskip=\abovedisplayskip
	\abovedisplayshortskip=0pt plus3pt
	\belowdisplayshortskip=6.5pt plus3.5pt minus3pt
}
\sizedef\small{10pt}{12pt}{%
	\abovedisplayskip=10pt plus2pt minus5pt
	\belowdisplayskip=\abovedisplayskip
	\abovedisplayshortskip=0pt plus3pt
	\belowdisplayshortskip=6pt plus3pt minus3pt
}

\spacing{1.5}

\geometry{a4paper}

\frenchspacing
\parindent=0pt
\parskip=0pt

\def\tocpartfont          {\bfseries\MakeUppercase}
\def\tocchapterfont       {\bfseries\MakeUppercase}
\def\tocsectionfont       {\bfseries\MakeUppercase}
\def\tocsubsectionfont    {\itshape}
\def\tocsubsubsectionfont {\scshape}
\def\tocparagraphfont     {}
\def\tocsubparagraphfont  {}

\def\sectionfont       {\bfseries\MakeUppercase}
\def\subsectionfont    {\itshape}
\def\subsubsectionfont {\scshape}
\def\paragraphfont     {}
\def\subparagraphfont  {}

\def\abovechapter       {50pt}
\def\abovesection       {\baselineskip}
\def\abovesubsection    {\baselineskip}
\def\abovesubsubsection {\baselineskip}
\def\aboveparagraph     {\baselineskip}
\def\abovesubparagraph  {\baselineskip}

\def\belowchapter       {40pt}
\def\belowsection       {\baselineskip}
\def\belowsubsection    {\baselineskip}
\def\belowsubsubsection {\baselineskip}
\def\belowparagraph     {\baselineskip}
\def\belowsubparagraph  {\baselineskip}

\definelegendplace{figure}{Figura}{fig.\,}{lof}
\definelegendplace{table}{Tabela}{tab.\,}{lot}

\def\legendlabel{\legendname\ \thelegend\ ---~}
\def\sublegendlabel{(\@alph\@tempcnta)~}
\def\srclabel{Fonte:~}
\def\legendmaxwidth{.7\linewidth}

\def\aboveplace{\baselineskip}
\def\belowplace{\baselineskip}

\def\toclabelwidth{2em}
\def\lotlabelwidth{5.5em}
\def\loflabelwidth{5.5em}
\def\appendixlabelwidth{9.2em}
\def\annexlabelwidth{7.3em}

\def\topicslabelwidth{4ex}
% \end{code}

% Se o comando de estilo de página |\pretextual| fosse carregado diretamente, e o usuário quisesse redefiní-lo no preâmbulo, teria de chamar |\pretextual| novamente para que a redefinição tivesse efeito. Sendo assim, para evitar múltiplas chamadas de |\pretextual|, este foi inserido após |\begin{document}|.

% \begin{code}
\AddToHook{begindocument}{\pretextual}

\endinput
% \end{code}