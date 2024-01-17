#' IdObject
#'
#' @export
#' @format \code{\link{R6Class}} object, super class \code{\link{SciObject}}, sub classes \code{\link{TableRelation}}, \code{\link{WhereRelation}}, \code{\link{DistinctRelation}}, \code{\link{ReferenceRelation}}, \code{\link{InMemoryRelation}}, \code{\link{RenameRelation}}, \code{\link{UnionRelation}}, \code{\link{SimpleRelation}}, \code{\link{GatherRelation}}, \code{\link{CompositeRelation}}, \code{\link{GroupByRelation}}, \code{\link{DataStep}}, \code{\link{MeltStep}}, \code{\link{JoinStep}}, \code{\link{WizardStep}}, \code{\link{CrossTabStep}}, \code{\link{GroupStep}}, \code{\link{InStep}}, \code{\link{OutStep}}, \code{\link{TableStep}}, \code{\link{NamespaceStep}}, \code{\link{RelationStep}}, \code{\link{ExportStep}}, \code{\link{ModelStep}}, \code{\link{ViewStep}}, \code{\link{InputPort}}, \code{\link{OutputPort}}, \code{\link{GarbageTasks}}, \code{\link{GarbageTasks2}}, \code{\link{Team}}, \code{\link{RSourceLibrary}}, \code{\link{RenvInstalledLibrary}}, \code{\link{ShinyOperator}}, \code{\link{DockerWebAppOperator}}, \code{\link{DockerOperator}}, \code{\link{ROperator}}, \code{\link{WebAppOperator}}, \code{\link{GitOperator}}, \code{\link{CubeQueryTableSchema}}, \code{\link{TableSchema}}, \code{\link{ComputedTableSchema}}, \code{\link{FileDocument}}, \code{\link{FolderDocument}}, \code{\link{Schema}}, \code{\link{Workflow}}, \code{\link{User}}, \code{\link{RLibrary}}, \code{\link{Operator}}, \code{\link{WorkerEndpoint}}, \code{\link{ProjectDocument}}, \code{\link{Project}}, \code{\link{SubscriptionPlan}}, \code{\link{RunComputationTask}}, \code{\link{SaveComputationResultTask}}, \code{\link{ComputationTask}}, \code{\link{ImportGitWorkflowTask}}, \code{\link{ExportWorkflowTask}}, \code{\link{CSVTask}}, \code{\link{CubeQueryTask}}, \code{\link{ImportWorkflowTask}}, \code{\link{TestOperatorTask}}, \code{\link{ImportGitDatasetTask}}, \code{\link{RunWorkflowTask}}, \code{\link{RunWebAppTask}}, \code{\link{ExportTableTask}}, \code{\link{ProjectTask}}, \code{\link{GlTask}}, \code{\link{LibraryTask}}, \code{\link{CreateGitOperatorTask}}, \code{\link{GitProjectTask}}, \code{\link{TaskLogEvent}}, \code{\link{TaskProgressEvent}}, \code{\link{TaskDataEvent}}, \code{\link{TaskStateEvent}}, \code{\link{PatchRecords}}, \code{\link{TaskEvent}}, \code{\link{GenericEvent}}, \code{\link{GarbageObject}}, \code{\link{Activity}}, \code{\link{Document}}, \code{\link{Lock}}, \code{\link{Task}}, \code{\link{Event}}, \code{\link{UserSecret}}, \code{\link{Column}}, \code{\link{StartProcess}}, \code{\link{Relation}}, \code{\link{Step}}, \code{\link{Port}}, \code{\link{PersistentObject}}, \code{\link{Link}}, \code{\link{ColumnSchema}}.
#' @field id of type String.
IdObject <- R6::R6Class("IdObject", inherit = SciObject, public = list(id = NULL,
    initialize = function(json = NULL) {
        super$initialize(json = json)
    }, init = function() {
        super$init()
        self$id = ""
    }, initJson = function(json) {
        super$initJson(json)
        self$id = json$id
    }, toTson = function() {
        m = super$toTson()
        m$kind = tson.scalar("IdObject")
        m$id = tson.scalar(self$id)
        return(m)
    }))
