# `abntexto`

- Licença: Public Domain Software
- Versão:  1.1 2026-05-08
- Autor:   Elayson Abreu 2022--2026
- Contato: abntexto.classe@gmail.com

Este trabalho consiste nos arquivos
 abntexto.bib, abntexto-exemplo.bib,
 abntexto.cls, abntexto-3-2-1-beta.cls,
 CHANGELOG.md, README.md,
 abntexto-birds.jpg, abntexto.pdf,
 abntexto-exemplo.pdf, abntexto-onehalf-tex.pdf
 abntexto-onehalf-word.tex, abntexto-screenshot.png,
 abntexto.tex, abntexto-exemplo.tex

## Sobre

Classe LaTeX para preparação de TCCs, dissertações e teses
de acordo com as normas da Assosciação Brasileira de Normas
Técnicas (ABNT). Manual: `abntexto.pdf`.

# Changelog

## [1.1] - 2026-05-08

Por breaking change, entende-se uma mudança capaz de alterar documentos antigos se compilados com a versão atual da classe.

- Breaking change. Os localizadores `\listacronymname`, `\listabbreviationname` e `\listsymbolname` deixaram de ser definidos em português para serem definidos em inglês inicialmente, (sem a presença do babel.sty). Isso só representa uma breaking change em documentos que não carregam o babel, mas isso é muito improvável;
- `\normalsize` é iniciado em `\DeclareOption{10pt}` e `\DeclareOption{11pt}` a partir de agora.
- Novo comando `\abntextonote` para inserção de notas em tabelas: `\long\def\note#1{\abntextonote{#1}}` ou `\long\def\nt#1{\abntextonote{#1}}`. Novos comandos `\savedabntextonote`, `\abntextonotelabel`, `\printnotebox`;
- Novo comando `\setplacepos`;
- Adicionado `\gresetORIlabel` na definição de `subplace`;
- A definição de `\alternativesublegend` foi simplificada;
- Novo comando `\subnote`;
- Novos comandos \abntextodecimalcomma, \abntextohyperrefpatch, \abntextodisabledecimalcomma, \abntextodisablehyperrefpatch e \disableautotextual;
- Novo comando `\useeletroniclayout`;
- Acréscimo ao manual sobre como o usuário final pode definir `\nextoddphysicalpage` para garantir que seções iniciem no anverso das folhas;
- Acréscimo ao manual sobre como o usuário final pode redefinir `\bibsetup` para garantir que as Referências sejam formatadas conforme a NBR~6023:2018;
- Acréscimo ao manual sobre a ocasião onde um objeto flutuante e um não-flutuante estão juntos na mesma página com numerações fora de ordem. A solução é evitar objetos flutuantes e não-flutuantes numa mesma página;
- Acréscimo ao manual sobre o fato de a última versão deste estar sempre presente no Github (a versão no CTAN não necessariamente é a mais recente);
- Acréscimo ao manual: uma nova subseção acerca do tratamento tipográfico de seções quaternárias e quinárias;
- Em abntexto-exemplo.tex, o resumo em lingua estrangeira deve estar entre `\selectlanguage`;
- Em abntexto-exemplo.tex, a página da ficha catalográfica não pode estar com o layout `\onesidelayout` porque tal página deve constar no verso da folha de rosto, por isso `\twosidelayout` foi adicionado. Além disso, os elementos pré-textuais foram apresentados em anverso, conforme recomendação da NBR 14724:2024;
- O manual afirmava que "tanto `\singlesp\onehalfsp` quanto `\onehalfsp\singlesp` produzem o mesmo efeito", mas essa afirmação não é correta. A afirmação correta é "tanto `\abntsmall\onehalfsp` quanto `\onehalfsp\abntsmall` produzem o mesmo efeito";
- O `\sectionmark` do exemplo na seção Cabeçalhos e rodapés do apêndice Código-fonte corretamente reseta `\marks1` a partir de agora;
- Os comandos `\phantomsection`, `\Hy@writebookmark` e `\NG@gettitle` foram definidos usando `\providecomand`;
- Uma nota a respeito da ocasião em que o aviso `\tnba@warn@eqbox` (anteriormente `\tnba@obs@eqbox`) não pode ser exibido quando deveria: durante uma mudança na fonte tipográfica do documento;
- A classe abntexto-uece foi citada no manual como fonte de ajuda para escritores de classes;
- Foram assinaladas as páginas em citações diretas no manual;
- Uma ocorrência de NBR 10520 foi substituída por NBR 14724 no manual.

## [1.0] - 2026-03-04

- Esvaziado o conteúdo de `\savedsrc` no início de place quando este conter multiplace.
- Adicionada citação na página 10 sobre o uso de capítulos no documento;
- Apêndice sobre o uso do listings e algorithm2e em áreas de legenda.

## [4.0.5-beta] - 2025-08-27

### Mudanças

- Correção de emergência: existe um `\fi` ausente em `\targetlegend`;
- Em `\definelegendplace`, `\#1font` era definido, ao invés de `\#3extfont`.

## [4.0.4-beta] - 2025-08-24

### Mudanças

- Substituição de "Ilustração" por "Figura" em `\definelegendplace`;
- Mudanças nas fontes `\tocsubsectionfont`, `\tocsubsubsectionfont`, `\subsectionfont`, `\subsubsectionfont`;
- A versão anterior afirmou que `\abntsmall` tinha sido removido de `\printlegendbox`, mas não tinha de fato;
- Corrigidos erros de escrita;
- Removida nota de rodapé sobre a nova norma NBR 14724:2024.

## [4.0.3-beta] - 2025-08-13

### Mudanças

- Removido `\abntsmall` de `\printlegendbox`.

## [4.0.2-beta] - 2025-08-05

### Adições

- Adicionado o arquivo `abntexto-3-2-1-beta.cls`;
- Âncoras em `\normalsize` e `\abntsmall`. Nelas haverá valores
  dependentes do tamanho da fonte como `\medskipamount`, por exemplo.
  Novo comando: `\setamounts`.

### Mudanças

- Parâmetros flutuantes em multiplace geravam o erro "Not in outer par mode";
- Excesso de espaço vertical entre título, conteúdo e fonte no ambiente "multiplace";
- Adicionado espaço vertical antes de "Palavras-chave" e "Keywords" em `abntexto-exemplo.tex`;
- O circuito em `abntexto-exemplo.tex` foi trocado;

## [4.0.1-beta] - 2025-07-21

### Mudanças

- Adicionada subordinação de `\section` em relação a `\chapter`;
- Corrigida imprecisão em um `\ref` em `abntexto-exemplo.tex`;

## [4.0.0-beta] - 2025-07-17

### Adições

- Houve um número significativo de mudanças nessa versão, por isso
  documentos antigos provavelmente terão layout alterado. Felizmente,
  há como voltar para a versão anterior do abntexto copiando o arquivo
  abntexto-3-2-1-beta.cls (disponível no repositório da classe no CTAN)
  para o diretório do seu arquivo TeX e, finalmente, chamar a versão antiga:
  \documentclass{abntexto-3-2-1-beta};
- Suporte para objetos flutuantes;
- A maioria das ocorrências de `\newcount` foi substituída por `\newcounter`
  para manter o código LaTeX-amigável;
- Novas macros `\eqbox` e `\eqboxsize` para produzir caixas de mesma
  largura automaticamente;
- Os pacotes `enumitem` e `etoolbox` são carregados na classe a partir de agora;

### Mudanças

- Os comandos `\place`, `\subplace` e `\indexcard` foram transformados em ambiente.
  A classe entrará em modo de compatibilidade caso detecte a sintaxe antiga;
- O comando `\usechapters` foi feito para habilitar capítulos no formato da
  classe book ao invés da orientação da ABNT. Nessa linha de pensamento,
  `\nonum\nochapter` foi inicialmente implementado para ter o funcionamento
  de `\chapter*`, com título *não centralizado*. Mas, em algum momento, o
  autor desfez esse comportamento e `\nonum\chapter` passou a centralizar o
  título. Nesta versão, o comportamento original foi restaurado e, por
  consequência, `\printnonumchapter` foi removido;
- `\printnonumsection` removido;
- Redirecionadas as opções da classe "article";
- Foi posto um aviso caso use-se `\chapter` sem que `\usechapters` esteja
  ativo. O mesmo vale para `\part` e `\useparts`;
- Posto um aviso ao tentar-se usar `\usechapters` e `\useparts` ao mesmo tempo;
- Foi removido o uso de `\savedprevdepth` nos ambientes "place" e "multiplace";
- O `\tableofcontents` foi redefinido para suportar a nova sintaxe de `\section`
  e para compatibilidade com a classe article;
- Comandos obsolescidos: `\printlegend`, `\printsrc`, `\printplace`, `\doublesp`,
  `\spacing`, `\subplacewidth`, `\printnonumchapter`, `\savedprevdepth`;
- Comandos renomeados: comandos da
  forma `\make<ext>`, comandos da forma `\<ext>ifont`, comandos da
  forma `\<type>ext`, comandos da forma `\l@<ext>i`;
- `\definelegendplace` a partir de agora só possui 3 argumentos, porque o
  3º foi excluído. Ele entra em modo de compatibilidade sintática caso detecte 4 argumentos;
- Utilização de `\@ifnextchar` para realocar o `\label` que segue `\section` e afins;
- Em `\definelegendplace`, um comando da forma `\<tipo>name` era criado.
  Todavia, o sufixo `name` destina-se a comandos com suporte multilingual.
  Portanto, a partir de agora, `\definelegendplace` usará `\<tipo>name` caso exista, do contrário, usará o segundo argumento diretamente;
- O comando `\AddToHook`, por ser muito recente no kernel LaTeX,
  não permite a compilação em distribuições mais antigas. `\AtBeginDocument`
  será usado, ao invés;
- Um espaço vertical foi adicinado entre as entradas de listas criadas
  com `\definelegendplace`;
- A lista de _outlines_ do PDF não situava o destino de _link_ corretamente,
  porque `\refstepcounter` estava mal posicionado;
- As ocorrências de `\footnotesize` foram substituídas por `\small`;
- O `\Enter` de `\judgeline` foi substituído por `\par`;
- Simplificação de `\extline`: `\global`'s removidos;
- Algumas definições do tipo `\l@<section>` continham a instrução
  `\def\extleaders{\hfil}` especificada nos parâmetros de `\extline`.
  Esta instrução foi movida para uma âncora do tipo `\hooktoc<section>` correspondente;
- O `\appendix` inseria um espaço vertical extra no documento;
- A partir de agora, `\definelegendplace`, `\usechapters` e `\useparts` só
  podem ser usados no preâmbulo;
- Novo comando `\toclabel`, para que os _outlines_ do PDF sejam exibidos corretamente;
- Todos os `\addpenalty` e `\addvspace` foram removidos;
- Substituição de ~ por `\quad` no rótulo das seções no Sumário;
- Anteriormente `\part` iniciava `\textual` por meio de `\trytextual`.
  Isso foi desabilitado, mas é possível reverter redefinindo `\hookabovepart`;
- O manual assinalava a norma 10520 de 2002 enquanto constava a de 2023 nas referências;
- Os _outlines_ não eram inseridos em níveis secionais maiores que 3;
- Mudança na especificação do tamanho de fonte em `\definesize` de "pt" para "bp";
- A partir de agora títulos prefixados com `\nonum`, mas não com `\notoc`,
  como "Referências" por exemplo, produzem uma `\toclabelbox` vazia em
  suas respectivas entradas do Sumário;
- Foi criado um contador dedicado para subplace;
- O `\par` na definição de `\nbpar`, foi substituído por `\endgraf`;
- Novo comando `\nohyph` para desabilitar a hifenização;
- Um `\kern` negativo foi removido em `\footnoterule` a fim de evitar que
  notas de rodapé ultrapassassem a margem inferior da página;
- `\definelegendplace{figure}{Figura}{lof}` foi substituído por `\definelegendplace{figure}{Ilustração}{lof}`;

## [3.2.1-beta] - 2024-12-29

Adjustments were made to the definition of `\definelegendplace`,
 because commands of the form `\<ext>labelwidth`, such as
 `\lotlabelwidth`, for example, were not setting the width of
 the entries correctly. The command `\toclabelwidth`, despite
 having a similar effect to those of `\definelegendplace`,
 was not defined with its help, so `\toclabelwidth` works as it should.

 ## [3.2.0-beta] - 2024-12-25

 - The "example.tex" file has been updated.
 - The caption of tables and figures must be single-spaced.
   A `\singlesp` has been added to `\printlabel`.
 - The "csquotes" package is loaded by abntexto from now on.
 - The original meaning of the table environment has been restored.
 - The `\spacing{1.5}` instruction must be contained in `\pretextual`
   followed by `\onesidelayout`.
 - There are more details in the manual about how `\onepagelayout`,
   `\twosidelayout` and `\eletroniclayout` work.
 - In `\usechapters` mode, chapters without numbering must be centered.
   For this purpose, the `\printnonumchapter` command was created.
 - The "corrprint" environment argument has been removed.
 - Citations in `\Enquote` have become breakable between pages.
 - Additions to the manual.

 ## [3.1.1-beta] - 2024-04-06

- Fixed alignment bug in \<ext>labelwidth commands produced with \definelegendplace.
- Redefined commands: \pretextual, \textual.
- New commands: \onesidelayout, \twosidelayout, \eletroniclayout.

## [3.1.0-beta] - 2023-11-13

- Added support for inserting figures/tables side by side.
- New macros: \mainsecname \nonum \notoc \printnonumsection.
- Redefined commands: \extline \corrprint \usechapters \useparts \pretextual \textual \part \chapter \section \definelegendplace.
- Removed commands: \definefontsize \setfontsize.
- Fixed a bug involving \MakeUppercase in commands like \tocchapterfont.
- Appendices and attachments can now be referenced using \label.
- Additions to the manual.

## [3.0.2-beta] - 2023-10-13

- Start of Beta phase
- Removal of \twonewpage macro
- A list of Standards covered by abntexto was duly explained in the manual

## [3.0.1-alpha] - 2023-10-12

- A PIX key for contributions has been added: abntexto.classe at gmail.com
- The definition of \place was inserted inside a group.
- \begcorrprint and \endcorrprint have been renamed in favor of
  \begin{corrprint} and \end{corrprint}.

## [3.0.0-alpha] - 2023-07-26

- The alpha state still remains.
- The article class is loaded by default.
- The \setlayout command has been removed. The use of \usepackage{geometry} is
preferred.
- Comma \mathcode change happens in "begindocument" from now on.
- In \definelegendplace, the third parameter has been removed.
- New commands: \trytextual \thepart \thechapter \cfpart \cfchapter \part
\chapter \usechapters \useparts \printlegend \printplace \printsrc \subplace
\multiplace \longlegend \longsrc and others.
- Redefined commands: \definelegendplace \maketoc \pretextual \textual \extline
\toclabelbox \appendix \annex \topicsitem.
- Renamed commands: \l at toci and the like, \addtotoc, \recountseci and the like, \startsection and the like, \setcurrlabel.
- Removed commands: \setlayout, \advcount, \hreftocline, \noindentfirst,
\tryindentfirst, \identifysection and the like, \tocname.

## [2.0.0-alpha] - 2023-01-31

- Several commands have been renamed, for example
\paper -> \setlayout
\qt -> \enquote
\quote -> Enquote
\fontsizedef -> \definefontsize
\papersizedef -> \definepapersize
\legendplacedef -> \definelegendplace

- The \sectionabove and derived commands have been renamed to \abovesection, \abovesubsection etc. The same is true for \belowsection and derivatives and.

- Adding an parameter to the end of \sizedef so that the user can call extra settings after the size change.

- The use of appendices, annexes, glossaries and acronyms was introduced in the manual.

- Adjustment in \setlayout related to the placement of page numbering.

- Addition of penalties in topics environment.

- The \@currentlabel statement was missing from section commands except \section.

- Simplification of the \Enquote command.

- Replacement of \smartaboveskip and \smartbelowskip with the pair \addpenalty, \addvspace from LaTeX kernel.

- Removal of macros \sectionspaces and derivatives, \placespaces, \sectionuppercase, \sectionlowercase, \tociuppercase, \tocilowercase, \justifying, \normalsizedef, \abovetitle, \belowtitle.

## [1.0.0-alpha] 2022-09-25

A new class for LaTeX intended to make life easier for Brazilian
students in the preparation of academic works (TCCs, dissertations
and theses) in the standards of the Associação Brasileira de Normas
Técnicas (ABNT).