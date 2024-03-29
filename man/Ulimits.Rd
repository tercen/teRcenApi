% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ulimits.R
\name{Ulimits}
\alias{Ulimits}
\title{Ulimits}
\format{
\code{\link{R6Class}} object.
}
\description{
Ulimits

Ulimits
}
\section{Super class}{
\code{\link[tercenApi:Base]{tercenApi::Base}} -> \code{Ulimits}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{core_file_size}}{of type int.}

\item{\code{data_seg_size}}{of type int.}

\item{\code{scheduling_priority}}{of type int.}

\item{\code{file_size}}{of type int.}

\item{\code{pending_signals}}{of type int.}

\item{\code{max_locked_memory}}{of type int.}

\item{\code{max_memory_size}}{of type int.}

\item{\code{open_files}}{of type int.}

\item{\code{pipe_size}}{of type int.}

\item{\code{message_queues}}{of type int.}

\item{\code{real_time_priority}}{of type int.}

\item{\code{stack_size}}{of type int.}

\item{\code{cpu_time}}{of type int.}

\item{\code{max_user_processes}}{of type int.}

\item{\code{virtual_memory}}{of type int.}

\item{\code{file_locks}}{of type int.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Ulimits$new()}}
\item \href{#method-init}{\code{Ulimits$init()}}
\item \href{#method-initJson}{\code{Ulimits$initJson()}}
\item \href{#method-toTson}{\code{Ulimits$toTson()}}
\item \href{#method-clone}{\code{Ulimits$clone()}}
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
\if{html}{\out{<div class="r">}}\preformatted{Ulimits$new(json = NULL)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-init"></a>}}
\if{latex}{\out{\hypertarget{method-init}{}}}
\subsection{Method \code{init()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Ulimits$init()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-initJson"></a>}}
\if{latex}{\out{\hypertarget{method-initJson}{}}}
\subsection{Method \code{initJson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Ulimits$initJson(json)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toTson"></a>}}
\if{latex}{\out{\hypertarget{method-toTson}{}}}
\subsection{Method \code{toTson()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Ulimits$toTson()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Ulimits$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
