% This file is the cover letter class used to format cover letters.
% Nicolas Gamboa Alvarez, 2026

\ProvidesClass{coverLetter}[2023/10/05 Simple cover letter class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hyperref} % Required for creating hyperlinks
\usepackage[english,french]{babel}
\RequirePackage{color,graphicx}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{fontawesome}
\usepackage{relsize}
\usepackage[left=1in, right=1in, top=1in, bottom=1in]{geometry} % Set margins to standard US letter
% Hyphenation and line breaking control
\tolerance=9999
\emergencystretch=10pt
\hyphenpenalty=10000
\exhyphenpenalty=10000
\sloppy


\pagestyle{empty} % Suppress page numbers

\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{colorlinks,breaklinks,urlcolor=linkcolour, linkcolor=linkcolour}

%----------------------------------------------------------------------------------------
%   LANGUAGE AND HREF SETTINGS
%----------------------------------------------------------------------------------------

\newcommand{\cllanguage}[1]{\def\@cllanguage{#1}} % EN or FR
\newcommand{\@cllanguage}{EN}

\newcommand{\clhref}[1]{\def\@clhref{#1}} % true or false
\newcommand{\@clhref}{true}

\newcommand{\cl@recruiterdefault}{%
  \ifthenelse{\equal{\@cllanguage}{FR}}{Responsable du recrutement}{Hiring Manager}%
}

\newcommand{\cl@concerning}{%
  \ifthenelse{\equal{\@cllanguage}{FR}}{Concernant le poste de}{Concerning the role of}%
}

\newcommand{\cl@greeting}{%
  \ifthenelse{\equal{\@cllanguage}{FR}}{Madame, Monsieur,}{Dear \cl@recruitername,}%
}

\newcommand{\cl@closingdefault}{%
  \ifthenelse{\equal{\@cllanguage}{FR}}{Bien à vous,}{Kind regards,}%
}

\newcommand{\cl@recruitername}{%
  \ifthenelse{\equal{\@recruiter}{}}{\cl@recruiterdefault}{\@recruiter}%
}

\newcommand{\cl@today}{%
  \ifthenelse{\equal{\@cllanguage}{FR}}{\begingroup\selectlanguage{french}\today\endgroup}{\begingroup\selectlanguage{english}\today\endgroup}%
}

\newcommand{\cl@mailto}[1]{%
  \ifthenelse{\equal{\@clhref}{true}}{\href{mailto:#1}{\faEnvelopeSquare \ #1}}{\faEnvelopeSquare \ #1}%
}

\newcommand{\cl@linkedinlink}[1]{%
  \ifthenelse{\equal{\@clhref}{true}}{\href{https://www.linkedin.com/in/#1}{\faLinkedinSquare \ LinkedIn: #1}}{\faLinkedinSquare \ LinkedIn: #1}%
}

%----------------------------------------------------------------------------------------
%   HEADINGS COMMANDS: Commands for printing name, and contact information
%----------------------------------------------------------------------------------------

\newcommand{\bigname}[1]{\def\@bigname{#1}} % Defines the \name command to set name
\newcommand{\@name}{} % Sets \@name to empty by default

\newcommand{\cltitle}[1]{\def\@cltitle{#1}} % Defines the \cltitle command to set title
\newcommand{\@cltitle}{} % Sets \@cltitle to empty by default

\newcommand{\phone}[1]{\def\@phone{\faPhoneSquare \ #1}} % Defines the \phone command to set phone number
\newcommand{\@phone}{} % Sets \@phone to empty by default

\newcommand{\email}[1]{\def\@email{\cl@mailto{#1}}} % Defines the \email command to set email
\newcommand{\@email}{} % Sets \@email to empty by default

\newcommand{\city}[1]{\def\@city{#1}} % Defines the \city command to set city
\newcommand{\@city}{} % Sets \@city to empty by default

\newcommand{\linkedin}[1]{\def\@linkedin{\cl@linkedinlink{#1}}} % Defines the \linkedin command to set linkedin
\newcommand{\@linkedin}{} % Sets \@linkedin to empty by default

% \printname is used to print the name as a page header
\newcommand{\printname}{
  \begingroup
  {\large\bfseries\@bigname} \\ [0.3 \baselineskip]
  \ifthenelse{\equal{\@cltitle}{}}{}{\normalsize\textsc{\@cltitle} \\ [0.2 \baselineskip]}
  \@email \\
  \@linkedin \\
  \@phone \\
  \@city
  \endgroup \\ \\
}

%----------------------------------------------------------------------------------------
%   RECRUITER AND COMPANY INFORMATION: Commands for printing the destinataire information
%----------------------------------------------------------------------------------------

\newcommand{\cldate}[1]{\def\@cldate{#1}} % Defines the \cldate command to set date
\ifdefined\@cldate % Setting the date to the current date by default
\else
  \newcommand{\@cldate}{\cl@today}
\fi

\newcommand{\recruiter}[1]{\def\@recruiter{#1}} % Defines the \recruiter command to set recruiter
\newcommand{\@recruiter}{} % Sets \@recruiter to empty by default

\newcommand{\company}[1]{\def\@company{#1}} % Defines the \company command to set company
\newcommand{\@company}{} % Sets \@company to empty by default

\newcommand{\jobtitle}[1]{\def\@jobtitle{#1}} % Defines the \jobtitle command to set job title
\newcommand{\@jobtitle}{} % Sets \@jobtitle to empty by default

\newcommand{\printdestinataire}{
  \begingroup
  \@cldate \\ \\
  \textbf{\cl@recruitername} \\
  \@company \\
  \cl@concerning \ \@jobtitle
  \endgroup \\
}

%----------------------------------------------------------------------------------------
%   CLOSING COMMANDS: Commands for closing and signature
%----------------------------------------------------------------------------------------

\newcommand{\closing}[1]{\def\@closing{#1}} % Defines the \closing command to set closing
\newcommand{\@closing}{} % Sets \@closing to empty by default

\newcommand{\smallname}[1]{\def\@smallname{#1}} % Defines the \smallname command to set name
\newcommand{\@smallname}{} % Sets \@smallname to empty by default

\newcommand{\printclosing}{
  \begingroup
    \ifthenelse{\equal{\@closing}{}}{\cl@closingdefault}{\@closing} \\ \\
    \@smallname
  \endgroup
}

%----------------------------------------------------------------------------------------
%   BODY COMMANDS: Commands for the body of the cover letter
%----------------------------------------------------------------------------------------

\newcommand{\clbody}[1]{\def\@clbody{#1}} % Defines the \clbody command to set body
\newcommand{\@clbody}{} % Sets \@clbody to empty by default

\newcommand{\printclbody}{
  \begingroup
    \cl@greeting \\ \\
    \@clbody
  \endgroup \\ [3 \baselineskip]
}

%----------------------------------------------------------------------------------------
%   SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the body of the cover letter
\newenvironment{rSection}[1]{
  \section*{#1}
  \begin{it}
}{
  \end{it}
}

% Defines the rSection environment for the closing / signature of the cover letter
\newenvironment{rClosing}{
  \begin{it}
}{
  \end{it}
}

%----------------------------------------------------------------------------------------
%   MAKEHEADER COMMAND: Command for printing the header  
%----------------------------------------------------------------------------------------

\newcommand{\makeheader}{
  \begin{flushleft}
    \printname
  \end{flushleft}
}

%----------------------------------------------------------------------------------------
%   MAKECLOSING COMMAND: Command for printing the closing
%----------------------------------------------------------------------------------------

\newcommand{\makeclosing}{
  \begin{center}
    \closing{\@closing}
  \end{center}
}

