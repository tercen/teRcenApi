% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/task_event.R
\name{TaskEvent}
\alias{TaskEvent}
\title{TaskEvent}
\format{
\code{\link{R6Class}} object, super class \code{\link{Event}}, sub classes \code{\link{TaskLogEvent}}, \code{\link{TaskProgressEvent}}, \code{\link{TaskDataEvent}}, \code{\link{TaskStateEvent}}.
}
\description{
TaskEvent

TaskEvent
}
\section{Super classes}{
\code{\link[tercenApi:Base]{tercenApi::Base}} -> \code{\link[tercenApi:IdObject]{tercenApi::IdObject}} -> \code{\link[tercenApi:PersistentObject]{tercenApi::PersistentObject}} -> \code{\link[tercenApi:Event]{tercenApi::Event}} -> \code{TaskEvent}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{isDeleted}}{of type bool inherited from super class \code{\link{PersistentObject}}.}

\item{\code{rev}}{of type String inherited from super class \code{\link{PersistentObject}}.}

\item{\code{id}}{of type String inherited from super class \code{\link{IdObject}}.}

\item{\code{taskId}}{of type String.}

\item{\code{date}}{object of class \code{\link{Date}} inherited from super class \code{\link{Event}}.}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{isDeleted}}{of type bool inherited from super class \code{\link{PersistentObject}}.}

\item{\code{rev}}{of type String inherited from super class \code{\link{PersistentObject}}.}

\item{\code{id}}{of type String inherited from super class \code{\link{IdObject}}.}

\item{\code{date}}{object of class \code{\link{Date}} inherited from super class \code{\link{Event}}.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{TaskEvent$new()}}
\item \href{#method-init}{\code{TaskEvent$init()}}
\item \href{#method-initJson}{\code{TaskEvent$initJson()}}
\item \href{#method-toTson}{\code{TaskEvent$toTson()}}
\item \href{#method-clone}{\code{TaskEvent$clone()}}
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
\if{html}{\out{<div class="r">}}\preformatted{TaskEvent$new(json = NULL)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-init"></a>}}
\if{latex}{\out{\hypertarget{method-init}{}}}
\subsection{Method \code{init()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TaskEvent$init()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-initJson"></a>}}
\if{latex}{\out{\hypertarget{method-initJson}{}}}
\subsection{Method \code{initJson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TaskEvent$initJson(json)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toTson"></a>}}
\if{latex}{\out{\hypertarget{method-toTson}{}}}
\subsection{Method \code{toTson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TaskEvent$toTson()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TaskEvent$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
