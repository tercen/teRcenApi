% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/activity.R
\name{Activity}
\alias{Activity}
\title{Activity}
\format{
\code{\link{R6Class}} object, super class \code{\link{PersistentObject}}.
}
\description{
Activity

Activity
}
\section{Super classes}{
\code{\link[tercenApi:Base]{tercenApi::Base}} -> \code{\link[tercenApi:IdObject]{tercenApi::IdObject}} -> \code{\link[tercenApi:PersistentObject]{tercenApi::PersistentObject}} -> \code{Activity}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{isDeleted}}{of type bool inherited from super class \code{\link{PersistentObject}}.}

\item{\code{rev}}{of type String inherited from super class \code{\link{PersistentObject}}.}

\item{\code{id}}{of type String inherited from super class \code{\link{IdObject}}.}

\item{\code{type}}{of type String.}

\item{\code{objectKind}}{of type String.}

\item{\code{teamId}}{of type String.}

\item{\code{projectId}}{of type String.}

\item{\code{userId}}{of type String.}

\item{\code{projectName}}{of type String.}

\item{\code{isPublic}}{of type bool.}

\item{\code{date}}{object of class \code{\link{Date}}.}

\item{\code{properties}}{list of class \code{\link{Pair}}.}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{isDeleted}}{of type bool inherited from super class \code{\link{PersistentObject}}.}

\item{\code{rev}}{of type String inherited from super class \code{\link{PersistentObject}}.}

\item{\code{id}}{of type String inherited from super class \code{\link{IdObject}}.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Activity$new()}}
\item \href{#method-init}{\code{Activity$init()}}
\item \href{#method-initJson}{\code{Activity$initJson()}}
\item \href{#method-toTson}{\code{Activity$toTson()}}
\item \href{#method-clone}{\code{Activity$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="tercenApi" data-topic="Base" data-id="print">}\href{../../tercenApi/html/Base.html#method-print}{\code{tercenApi::Base$print()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Activity$new(json = NULL)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-init"></a>}}
\if{latex}{\out{\hypertarget{method-init}{}}}
\subsection{Method \code{init()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Activity$init()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-initJson"></a>}}
\if{latex}{\out{\hypertarget{method-initJson}{}}}
\subsection{Method \code{initJson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Activity$initJson(json)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toTson"></a>}}
\if{latex}{\out{\hypertarget{method-toTson}{}}}
\subsection{Method \code{toTson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Activity$toTson()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Activity$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
