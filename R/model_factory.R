#'
#' @export
createObjectFromJson = function(json) {
    if (is.null(json))
        return(NULL)
    kind = json$kind
    if (kind == "Team") {
        return(Team$new(json = json))
    }
    if (kind == "DoubleProperty") {
        return(DoubleProperty$new(json = json))
    }
    if (kind == "Rectangle") {
        return(Rectangle$new(json = json))
    }
    if (kind == "RunningState") {
        return(RunningState$new(json = json))
    }
    if (kind == "WhereRelation") {
        return(WhereRelation$new(json = json))
    }
    if (kind == "StorageProfile") {
        return(StorageProfile$new(json = json))
    }
    if (kind == "OperatorOutputSpec") {
        return(OperatorOutputSpec$new(json = json))
    }
    if (kind == "ResourceSummary") {
        return(ResourceSummary$new(json = json))
    }
    if (kind == "BillingInfo") {
        return(BillingInfo$new(json = json))
    }
    if (kind == "PatchRecords") {
        return(PatchRecords$new(json = json))
    }
    if (kind == "Property") {
        return(Property$new(json = json))
    }
    if (kind == "GarbageTasks") {
        return(GarbageTasks$new(json = json))
    }
    if (kind == "Version") {
        return(Version$new(json = json))
    }
    if (kind == "Filters") {
        return(Filters$new(json = json))
    }
    if (kind == "ChartHeatmap") {
        return(ChartHeatmap$new(json = json))
    }
    if (kind == "StatisticNode") {
        return(StatisticNode$new(json = json))
    }
    if (kind == "CubeQuery") {
        return(CubeQuery$new(json = json))
    }
    if (kind == "User") {
        return(User$new(json = json))
    }
    if (kind == "RLibrary") {
        return(RLibrary$new(json = json))
    }
    if (kind == "Filter") {
        return(Filter$new(json = json))
    }
    if (kind == "GroupStep") {
        return(GroupStep$new(json = json))
    }
    if (kind == "TaskLogEvent") {
        return(TaskLogEvent$new(json = json))
    }
    if (kind == "UserSession") {
        return(UserSession$new(json = json))
    }
    if (kind == "Table") {
        return(Table$new(json = json))
    }
    if (kind == "DockerOperator") {
        return(DockerOperator$new(json = json))
    }
    if (kind == "Acl") {
        return(Acl$new(json = json))
    }
    if (kind == "CubeAxisQuery") {
        return(CubeAxisQuery$new(json = json))
    }
    if (kind == "GateNode") {
        return(GateNode$new(json = json))
    }
    if (kind == "TaskSummary") {
        return(TaskSummary$new(json = json))
    }
    if (kind == "RampPalette") {
        return(RampPalette$new(json = json))
    }
    if (kind == "DistinctRelation") {
        return(DistinctRelation$new(json = json))
    }
    if (kind == "RunningDependentState") {
        return(RunningDependentState$new(json = json))
    }
    if (kind == "ExportWorkflowTask") {
        return(ExportWorkflowTask$new(json = json))
    }
    if (kind == "StartProcess") {
        return(StartProcess$new(json = json))
    }
    if (kind == "Token") {
        return(Token$new(json = json))
    }
    if (kind == "ActivityCount") {
        return(ActivityCount$new(json = json))
    }
    if (kind == "JoinOperator") {
        return(JoinOperator$new(json = json))
    }
    if (kind == "OperatorModel") {
        return(OperatorModel$new(json = json))
    }
    if (kind == "CSVFileMetadata") {
        return(CSVFileMetadata$new(json = json))
    }
    if (kind == "TableStepModel") {
        return(TableStepModel$new(json = json))
    }
    if (kind == "MeltStep") {
        return(MeltStep$new(json = json))
    }
    if (kind == "CrosstabTable") {
        return(CrosstabTable$new(json = json))
    }
    if (kind == "XYAxisList") {
        return(XYAxisList$new(json = json))
    }
    if (kind == "FilterTopExpr") {
        return(FilterTopExpr$new(json = json))
    }
    if (kind == "AxisSpec") {
        return(AxisSpec$new(json = json))
    }
    if (kind == "DoubleColorElement") {
        return(DoubleColorElement$new(json = json))
    }
    if (kind == "TaskProgressEvent") {
        return(TaskProgressEvent$new(json = json))
    }
    if (kind == "GarbageObject") {
        return(GarbageObject$new(json = json))
    }
    if (kind == "Crosstab") {
        return(Crosstab$new(json = json))
    }
    if (kind == "State") {
        return(State$new(json = json))
    }
    if (kind == "PatchRecord") {
        return(PatchRecord$new(json = json))
    }
    if (kind == "Operator") {
        return(Operator$new(json = json))
    }
    if (kind == "RunComputationTask") {
        return(RunComputationTask$new(json = json))
    }
    if (kind == "ProjectTask") {
        return(ProjectTask$new(json = json))
    }
    if (kind == "WorkerEndpoint") {
        return(WorkerEndpoint$new(json = json))
    }
    if (kind == "ColumnSchemaMetaData") {
        return(ColumnSchemaMetaData$new(json = json))
    }
    if (kind == "Privilege") {
        return(Privilege$new(json = json))
    }
    if (kind == "CSVTask") {
        return(CSVTask$new(json = json))
    }
    if (kind == "Activity") {
        return(Activity$new(json = json))
    }
    if (kind == "CubeQueryTask") {
        return(CubeQueryTask$new(json = json))
    }
    if (kind == "ViesInfo") {
        return(ViesInfo$new(json = json))
    }
    if (kind == "JoinStepModel") {
        return(JoinStepModel$new(json = json))
    }
    if (kind == "Ulimits") {
        return(Ulimits$new(json = json))
    }
    if (kind == "RDescription") {
        return(RDescription$new(json = json))
    }
    if (kind == "MetaFactor") {
        return(MetaFactor$new(json = json))
    }
    if (kind == "JetPalette") {
        return(JetPalette$new(json = json))
    }
    if (kind == "TableRelation") {
        return(TableRelation$new(json = json))
    }
    if (kind == "Profile") {
        return(Profile$new(json = json))
    }
    if (kind == "Date") {
        return(Date$new(json = json))
    }
    if (kind == "StepState") {
        return(StepState$new(json = json))
    }
    if (kind == "ProjectDocument") {
        return(ProjectDocument$new(json = json))
    }
    if (kind == "OperatorResult") {
        return(OperatorResult$new(json = json))
    }
    if (kind == "RSourceLibrary") {
        return(RSourceLibrary$new(json = json))
    }
    if (kind == "FileDocument") {
        return(FileDocument$new(json = json))
    }
    if (kind == "Document") {
        return(Document$new(json = json))
    }
    if (kind == "Address") {
        return(Address$new(json = json))
    }
    if (kind == "TaskDataEvent") {
        return(TaskDataEvent$new(json = json))
    }
    if (kind == "StringProperty") {
        return(StringProperty$new(json = json))
    }
    if (kind == "XYAxis") {
        return(XYAxis$new(json = json))
    }
    if (kind == "IdObject") {
        return(IdObject$new(json = json))
    }
    if (kind == "Principal") {
        return(Principal$new(json = json))
    }
    if (kind == "Attribute") {
        return(Attribute$new(json = json))
    }
    if (kind == "ImportWorkflowTask") {
        return(ImportWorkflowTask$new(json = json))
    }
    if (kind == "Project") {
        return(Project$new(json = json))
    }
    if (kind == "Url") {
        return(Url$new(json = json))
    }
    if (kind == "StringColorElement") {
        return(StringColorElement$new(json = json))
    }
    if (kind == "EnumeratedProperty") {
        return(EnumeratedProperty$new(json = json))
    }
    if (kind == "TestOperatorTask") {
        return(TestOperatorTask$new(json = json))
    }
    if (kind == "ImportGitWorkflowTask") {
        return(ImportGitWorkflowTask$new(json = json))
    }
    if (kind == "ReferenceRelation") {
        return(ReferenceRelation$new(json = json))
    }
    if (kind == "RProxy") {
        return(RProxy$new(json = json))
    }
    if (kind == "OperatorSpec") {
        return(OperatorSpec$new(json = json))
    }
    if (kind == "Pair") {
        return(Pair$new(json = json))
    }
    if (kind == "InMemoryRelation") {
        return(InMemoryRelation$new(json = json))
    }
    if (kind == "Relation") {
        return(Relation$new(json = json))
    }
    if (kind == "FileMetadata") {
        return(FileMetadata$new(json = json))
    }
    if (kind == "RunProfile") {
        return(RunProfile$new(json = json))
    }
    if (kind == "SaveComputationResultTask") {
        return(SaveComputationResultTask$new(json = json))
    }
    if (kind == "CpuTimeProfile") {
        return(CpuTimeProfile$new(json = json))
    }
    if (kind == "AxisSettings") {
        return(AxisSettings$new(json = json))
    }
    if (kind == "MappingFilter") {
        return(MappingFilter$new(json = json))
    }
    if (kind == "ChartBar") {
        return(ChartBar$new(json = json))
    }
    if (kind == "FolderDocument") {
        return(FolderDocument$new(json = json))
    }
    if (kind == "Lock") {
        return(Lock$new(json = json))
    }
    if (kind == "Worker") {
        return(Worker$new(json = json))
    }
    if (kind == "ImportGitDatasetTask") {
        return(ImportGitDatasetTask$new(json = json))
    }
    if (kind == "Ace") {
        return(Ace$new(json = json))
    }
    if (kind == "InStep") {
        return(InStep$new(json = json))
    }
    if (kind == "Labels") {
        return(Labels$new(json = json))
    }
    if (kind == "RenvInstalledLibrary") {
        return(RenvInstalledLibrary$new(json = json))
    }
    if (kind == "OperatorSettings") {
        return(OperatorSettings$new(json = json))
    }
    if (kind == "CubeQueryTableSchema") {
        return(CubeQueryTableSchema$new(json = json))
    }
    if (kind == "CategoryPalette") {
        return(CategoryPalette$new(json = json))
    }
    if (kind == "ModelStep") {
        return(ModelStep$new(json = json))
    }
    if (kind == "TableSummary") {
        return(TableSummary$new(json = json))
    }
    if (kind == "TaskEvent") {
        return(TaskEvent$new(json = json))
    }
    if (kind == "Point") {
        return(Point$new(json = json))
    }
    if (kind == "Column") {
        return(Column$new(json = json))
    }
    if (kind == "Summary") {
        return(Summary$new(json = json))
    }
    if (kind == "TaskStateEvent") {
        return(TaskStateEvent$new(json = json))
    }
    if (kind == "ShinyOperator") {
        return(ShinyOperator$new(json = json))
    }
    if (kind == "Errors") {
        return(Errors$new(json = json))
    }
    if (kind == "GlTask") {
        return(GlTask$new(json = json))
    }
    if (kind == "FailedState") {
        return(FailedState$new(json = json))
    }
    if (kind == "Palette") {
        return(Palette$new(json = json))
    }
    if (kind == "CanceledState") {
        return(CanceledState$new(json = json))
    }
    if (kind == "RunWorkflowTask") {
        return(RunWorkflowTask$new(json = json))
    }
    if (kind == "GraphicalFactor") {
        return(GraphicalFactor$new(json = json))
    }
    if (kind == "RenameRelation") {
        return(RenameRelation$new(json = json))
    }
    if (kind == "OperatorInputSpec") {
        return(OperatorInputSpec$new(json = json))
    }
    if (kind == "ChartLine") {
        return(ChartLine$new(json = json))
    }
    if (kind == "ColorList") {
        return(ColorList$new(json = json))
    }
    if (kind == "RelationStep") {
        return(RelationStep$new(json = json))
    }
    if (kind == "DataStep") {
        return(DataStep$new(json = json))
    }
    if (kind == "SearchResult") {
        return(SearchResult$new(json = json))
    }
    if (kind == "GateOperatorModel") {
        return(GateOperatorModel$new(json = json))
    }
    if (kind == "ChartSize") {
        return(ChartSize$new(json = json))
    }
    if (kind == "AnnotationModel") {
        return(AnnotationModel$new(json = json))
    }
    if (kind == "Schema") {
        return(Schema$new(json = json))
    }
    if (kind == "ColorElement") {
        return(ColorElement$new(json = json))
    }
    if (kind == "ROperator") {
        return(ROperator$new(json = json))
    }
    if (kind == "OutStep") {
        return(OutStep$new(json = json))
    }
    if (kind == "LibraryTask") {
        return(LibraryTask$new(json = json))
    }
    if (kind == "PreProcessor") {
        return(PreProcessor$new(json = json))
    }
    if (kind == "InputPort") {
        return(InputPort$new(json = json))
    }
    if (kind == "Properties") {
        return(Properties$new(json = json))
    }
    if (kind == "PropertyValue") {
        return(PropertyValue$new(json = json))
    }
    if (kind == "ComputationTask") {
        return(ComputationTask$new(json = json))
    }
    if (kind == "DoneState") {
        return(DoneState$new(json = json))
    }
    if (kind == "AclContext") {
        return(AclContext$new(json = json))
    }
    if (kind == "DockerWebAppOperator") {
        return(DockerWebAppOperator$new(json = json))
    }
    if (kind == "OperatorUnitTest") {
        return(OperatorUnitTest$new(json = json))
    }
    if (kind == "StepModel") {
        return(StepModel$new(json = json))
    }
    if (kind == "TableStep") {
        return(TableStep$new(json = json))
    }
    if (kind == "RunWebAppTask") {
        return(RunWebAppTask$new(json = json))
    }
    if (kind == "UnionRelation") {
        return(UnionRelation$new(json = json))
    }
    if (kind == "Profiles") {
        return(Profiles$new(json = json))
    }
    if (kind == "Step") {
        return(Step$new(json = json))
    }
    if (kind == "FilterExpr2d") {
        return(FilterExpr2d$new(json = json))
    }
    if (kind == "FactorsProperty") {
        return(FactorsProperty$new(json = json))
    }
    if (kind == "Task") {
        return(Task$new(json = json))
    }
    if (kind == "Event") {
        return(Event$new(json = json))
    }
    if (kind == "Port") {
        return(Port$new(json = json))
    }
    if (kind == "OperatorRef") {
        return(OperatorRef$new(json = json))
    }
    if (kind == "JoinStep") {
        return(JoinStep$new(json = json))
    }
    if (kind == "WizardStep") {
        return(WizardStep$new(json = json))
    }
    if (kind == "WizardStepModel") {
        return(WizardStepModel$new(json = json))
    }
    if (kind == "Factor") {
        return(Factor$new(json = json))
    }
    if (kind == "InitState") {
        return(InitState$new(json = json))
    }
    if (kind == "SimpleRelation") {
        return(SimpleRelation$new(json = json))
    }
    if (kind == "PendingState") {
        return(PendingState$new(json = json))
    }
    if (kind == "ChartPoint") {
        return(ChartPoint$new(json = json))
    }
    if (kind == "ColumnPair") {
        return(ColumnPair$new(json = json))
    }
    if (kind == "CreateGitOperatorTask") {
        return(CreateGitOperatorTask$new(json = json))
    }
    if (kind == "CrosstabSpec") {
        return(CrosstabSpec$new(json = json))
    }
    if (kind == "FilterExpr") {
        return(FilterExpr$new(json = json))
    }
    if (kind == "TableSchema") {
        return(TableSchema$new(json = json))
    }
    if (kind == "TaxId") {
        return(TaxId$new(json = json))
    }
    if (kind == "Plan") {
        return(Plan$new(json = json))
    }
    if (kind == "SciObject") {
        return(SciObject$new(json = json))
    }
    if (kind == "CSVParserParam") {
        return(CSVParserParam$new(json = json))
    }
    if (kind == "WebAppOperator") {
        return(WebAppOperator$new(json = json))
    }
    if (kind == "ExportTableTask") {
        return(ExportTableTask$new(json = json))
    }
    if (kind == "GenericEvent") {
        return(GenericEvent$new(json = json))
    }
    if (kind == "CrossTabStep") {
        return(CrossTabStep$new(json = json))
    }
    if (kind == "OutputPort") {
        return(OutputPort$new(json = json))
    }
    if (kind == "PersistentObject") {
        return(PersistentObject$new(json = json))
    }
    if (kind == "Link") {
        return(Link$new(json = json))
    }
    if (kind == "AppDesign") {
        return(AppDesign$new(json = json))
    }
    if (kind == "GarbageTasks2") {
        return(GarbageTasks2$new(json = json))
    }
    if (kind == "Workflow") {
        return(Workflow$new(json = json))
    }
    if (kind == "NamedFilter") {
        return(NamedFilter$new(json = json))
    }
    if (kind == "NamespaceStep") {
        return(NamespaceStep$new(json = json))
    }
    if (kind == "TableProfile") {
        return(TableProfile$new(json = json))
    }
    if (kind == "MeltStepModel") {
        return(MeltStepModel$new(json = json))
    }
    if (kind == "ExportModel") {
        return(ExportModel$new(json = json))
    }
    if (kind == "AnnotationOperatorModel") {
        return(AnnotationOperatorModel$new(json = json))
    }
    if (kind == "Axis") {
        return(Axis$new(json = json))
    }
    if (kind == "BooleanProperty") {
        return(BooleanProperty$new(json = json))
    }
    if (kind == "GatherRelation") {
        return(GatherRelation$new(json = json))
    }
    if (kind == "ExportStep") {
        return(ExportStep$new(json = json))
    }
    if (kind == "ViewStep") {
        return(ViewStep$new(json = json))
    }
    if (kind == "ApiCallProfile") {
        return(ApiCallProfile$new(json = json))
    }
    if (kind == "Colors") {
        return(Colors$new(json = json))
    }
    if (kind == "CompositeRelation") {
        return(CompositeRelation$new(json = json))
    }
    if (kind == "ColumnSchema") {
        return(ColumnSchema$new(json = json))
    }
    if (kind == "GitProjectTask") {
        return(GitProjectTask$new(json = json))
    }
    if (kind == "ComputedTableSchema") {
        return(ComputedTableSchema$new(json = json))
    }
    if (kind == "TableProperties") {
        return(TableProperties$new(json = json))
    }
    if (kind == "MappingFactor") {
        return(MappingFactor$new(json = json))
    }
    if (kind == "Chart") {
        return(Chart$new(json = json))
    }
    if (kind == "GitOperator") {
        return(GitOperator$new(json = json))
    }
    if (kind == "SubscriptionPlan") {
        return(SubscriptionPlan$new(json = json))
    }
    if (kind == "FormulaProperty") {
        return(FormulaProperty$new(json = json))
    }
    if (kind == "UserSecret") {
        return(UserSecret$new(json = json))
    }
    if (kind == "GroupByRelation") {
        return(GroupByRelation$new(json = json))
    }
    stop("bad kind")
}
