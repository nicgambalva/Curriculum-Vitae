%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CL - COVER LETTER CLASS FILE
%
% This template has been made by Nicolás Gamboa Álvarez
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2024 by Nicolás Gamboa Álvarez
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{coverLetter}[2023/10/05 Simple cover letter class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hyperref} % Required for creating hyperlinks
\RequirePackage{color,graphicx}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{fontawesome}
\usepackage{relsize}
\usepackage[left=1.2in, right=1.2in, top=1in, bottom=1in]{geometry} % Set margins to standard US letter

\pagestyle{empty} % Suppress page numbers

\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{colorlinks,breaklinks,urlcolor=linkcolour, linkcolor=linkcolour}

%----------------------------------------------------------------------------------------
%   HEADINGS COMMANDS: Commands for printing name, and contact information
%----------------------------------------------------------------------------------------

\newcommand{\bigname}[1]{\def\@bigname{#1}} % Defines the \name command to set name
\newcommand{\@name}{} % Sets \@name to empty by default

\newcommand{\phone}[1]{\def\@phone{\faPhoneSquare \ #1}} % Defines the \phone command to set phone number
\newcommand{\@phone}{} % Sets \@phone to empty by default

\newcommand{\email}[1]{\def\@email{\href{mailto:#1}{\faEnvelopeSquare \ #1}}} % Defines the \email command to set email with mailto link
\newcommand{\@email}{} % Sets \@email to empty by default

\newcommand{\city}[1]{\def\@city{#1}} % Defines the \city command to set city
\newcommand{\@city}{} % Sets \@city to empty by default

\newcommand{\linkedin}[1]{\def\@linkedin{\href{https://www.linkedin.com/in/#1}{\faLinkedinSquare \ LinkedIn: #1}}} % Defines the \linkedin command to set linkedin
\newcommand{\@linkedin}{} % Sets \@linkedin to empty by default

% \printname is used to print the name as a page header
\newcommand{\printname}{
  \begingroup
  {\large\bfseries\@bigname} \\ [0.3 \baselineskip]
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
  \newcommand{\@cldate}{\today}
\fi

\newcommand{\recruiter}[1]{\def\@recruiter{#1}} % Defines the \recruiter command to set recruiter
\newcommand{\@recruiter}{Hiring Manager} % Sets \@recruiter to "Hiring Manager" by default

\newcommand{\company}[1]{\def\@company{#1}} % Defines the \company command to set company
\newcommand{\@company}{} % Sets \@company to empty by default

\newcommand{\jobtitle}[1]{\def\@jobtitle{#1}} % Defines the \jobtitle command to set job title
\newcommand{\@jobtitle}{} % Sets \@jobtitle to empty by default

\newcommand{\printdestinataire}{
  \begingroup
  \@cldate \\ \\
  \textbf{\@recruiter} \\
  \@company \\
  Concerning the role of \@jobtitle
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
    \@closing \\ \\
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
    Dear \@recruiter, \\ \\
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

