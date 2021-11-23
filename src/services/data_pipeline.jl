# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: data_pipeline
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("parameter_values" => "parameterValues", "start_timestamp" => "startTimestamp", "cancel_active" => "cancelActive", "limit" => "limit", "marker" => "marker", "query" => "query", "hostname" => "hostname", "worker_group" => "workerGroup", "instance_identity" => "instanceIdentity", "parameter_objects" => "parameterObjects", "description" => "description", "tags" => "tags", "evaluate_expressions" => "evaluateExpressions", "version" => "version", "fields" => "fields", "error_id" => "errorId", "error_message" => "errorMessage", "error_stack_trace" => "errorStackTrace")

"""
    activate_pipeline(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does
not pass validation, activation fails. If you need to pause the pipeline to investigate an
issue with a component, such as a data source or script, call DeactivatePipeline. To
activate a finished pipeline, modify the end date for the pipeline and then activate it.

# Arguments
- `pipeline_id`: The ID of the pipeline.

# Keyword Parameters
- `parameter_values`: A list of parameter values to pass to the pipeline at activation.
- `start_timestamp`: The date and time to resume the pipeline. By default, the pipeline
  resumes from the last completed execution.
"""
function activate_pipeline(pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("ActivatePipeline", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    add_tags(pipeline_id, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds or modifies tags for the specified pipeline.

# Arguments
- `pipeline_id`: The ID of the pipeline.
- `tags`: The tags to add, as key/value pairs.

"""
function add_tags(pipelineId, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("AddTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId, "tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_pipeline(name, unique_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new, empty pipeline. Use PutPipelineDefinition to populate the pipeline.

# Arguments
- `name`: The name for the pipeline. You can use the same name for multiple pipelines
  associated with your AWS account, because AWS Data Pipeline assigns each pipeline a unique
  pipeline identifier.
- `unique_id`: A unique identifier. This identifier is not the same as the pipeline
  identifier assigned by AWS Data Pipeline. You are responsible for defining the format and
  ensuring the uniqueness of this identifier. You use this parameter to ensure idempotency
  during repeated calls to CreatePipeline. For example, if the first call to CreatePipeline
  does not succeed, you can pass in the same unique identifier and pipeline name combination
  on a subsequent call to CreatePipeline. CreatePipeline ensures that if a pipeline already
  exists with the same name and unique identifier, a new pipeline is not created. Instead,
  you'll receive the pipeline identifier from the previous attempt. The uniqueness of the
  name and unique identifier combination is scoped to the AWS account or IAM user credentials.

# Keyword Parameters
- `description`: The description for the pipeline.
- `tags`: A list of tags to associate with the pipeline at creation. Tags let you control
  access to pipelines. For more information, see Controlling User Access to Pipelines in the
  AWS Data Pipeline Developer Guide.
"""
function create_pipeline(name, uniqueId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("CreatePipeline", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("name"=>name, "uniqueId"=>uniqueId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    deactivate_pipeline(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deactivates the specified running pipeline. The pipeline is set to the DEACTIVATING state
until the deactivation process completes. To resume a deactivated pipeline, use
ActivatePipeline. By default, the pipeline resumes from the last completed execution.
Optionally, you can specify the date and time to resume the pipeline.

# Arguments
- `pipeline_id`: The ID of the pipeline.

# Keyword Parameters
- `cancel_active`: Indicates whether to cancel any running objects. The default is true,
  which sets the state of any running objects to CANCELED. If this value is false, the
  pipeline is deactivated after all running objects finish.
"""
function deactivate_pipeline(pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("DeactivatePipeline", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_pipeline(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline
attempts to cancel instances associated with the pipeline that are currently being
processed by task runners. Deleting a pipeline cannot be undone. You cannot query or
restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call
SetStatus with the status set to PAUSE on individual components. Components that are paused
by SetStatus can be resumed.

# Arguments
- `pipeline_id`: The ID of the pipeline.

"""
function delete_pipeline(pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("DeletePipeline", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_objects(object_ids, pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the object definitions for a set of objects associated with the pipeline. Object
definitions are composed of a set of fields that define the properties of the object.

# Arguments
- `object_ids`: The IDs of the pipeline objects that contain the definitions to be
  described. You can pass as many as 25 identifiers in a single call to DescribeObjects.
- `pipeline_id`: The ID of the pipeline that contains the object definitions.

# Keyword Parameters
- `evaluate_expressions`: Indicates whether any expressions in the object should be
  evaluated when the object descriptions are returned.
- `marker`: The starting point for the results to be returned. For the first call, this
  value should be empty. As long as there are more results, continue to call DescribeObjects
  with the marker value from the previous call to retrieve the next set of results.
"""
function describe_objects(objectIds, pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("DescribeObjects", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("objectIds"=>objectIds, "pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_pipelines(pipeline_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves metadata about one or more pipelines. The information retrieved includes the name
of the pipeline, the pipeline identifier, its current state, and the user account that owns
the pipeline. Using account credentials, you can retrieve metadata about pipelines that you
or your IAM users have created. If you are using an IAM user account, you can retrieve
metadata about only those pipelines for which you have read permissions. To retrieve the
full pipeline definition instead of metadata about the pipeline, call GetPipelineDefinition.

# Arguments
- `pipeline_ids`: The IDs of the pipelines to describe. You can pass as many as 25
  identifiers in a single call. To obtain pipeline IDs, call ListPipelines.

"""
function describe_pipelines(pipelineIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("DescribePipelines", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineIds"=>pipelineIds), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    evaluate_expression(expression, object_id, pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Task runners call EvaluateExpression to evaluate a string in the context of the specified
object. For example, a task runner can evaluate SQL queries stored in Amazon S3.

# Arguments
- `expression`: The expression to evaluate.
- `object_id`: The ID of the object.
- `pipeline_id`: The ID of the pipeline.

"""
function evaluate_expression(expression, objectId, pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("EvaluateExpression", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("expression"=>expression, "objectId"=>objectId, "pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_pipeline_definition(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the definition of the specified pipeline. You can call GetPipelineDefinition to
retrieve the pipeline definition that you provided using PutPipelineDefinition.

# Arguments
- `pipeline_id`: The ID of the pipeline.

# Keyword Parameters
- `version`: The version of the pipeline definition to retrieve. Set this parameter to
  latest (default) to use the last definition saved to the pipeline or active to use the last
  definition that was activated.
"""
function get_pipeline_definition(pipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("GetPipelineDefinition", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the pipeline identifiers for all active pipelines that you have permission to access.

# Keyword Parameters
- `marker`: The starting point for the results to be returned. For the first call, this
  value should be empty. As long as there are more results, continue to call ListPipelines
  with the marker value from the previous call to retrieve the next set of results.
"""
function list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("ListPipelines", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    poll_for_task(worker_group; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Task runners call PollForTask to receive a task to perform from AWS Data Pipeline. The task
runner specifies which tasks it can perform by setting a value for the workerGroup
parameter. The task returned can come from any of the pipelines that match the workerGroup
value passed in by the task runner and that was launched using the IAM user credentials
specified by the task runner. If tasks are ready in the work queue, PollForTask returns a
response immediately. If no tasks are available in the queue, PollForTask uses long-polling
and holds on to a poll connection for up to a 90 seconds, during which time the first newly
scheduled task is handed to the task runner. To accomodate this, set the socket timeout in
your task runner to 90 seconds. The task runner should not call PollForTask again on the
same workerGroup until it receives a response, and this can take up to 90 seconds.

# Arguments
- `worker_group`: The type of task the task runner is configured to accept and process. The
  worker group is set as a field on objects in the pipeline when they are created. You can
  only specify a single value for workerGroup in the call to PollForTask. There are no
  wildcard values permitted in workerGroup; the string must be an exact, case-sensitive,
  match.

# Keyword Parameters
- `hostname`: The public DNS name of the calling task runner.
- `instance_identity`: Identity information for the EC2 instance that is hosting the task
  runner. You can get this value from the instance using
  http://169.254.169.254/latest/meta-data/instance-id. For more information, see Instance
  Metadata in the Amazon Elastic Compute Cloud User Guide. Passing in this value proves that
  your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline
  service charges are applied to your pipeline.
"""
function poll_for_task(workerGroup; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("PollForTask", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("workerGroup"=>workerGroup), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_pipeline_definition(pipeline_id, pipeline_objects; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds tasks, schedules, and preconditions to the specified pipeline. You can use
PutPipelineDefinition to populate a new pipeline.  PutPipelineDefinition also validates the
configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one
of the following three validation errors exists in the pipeline.   An object is missing a
name or identifier field. A string or reference field is empty. The number of objects in
the pipeline exceeds the maximum allowed objects. The pipeline is in a FINISHED state.
Pipeline object definitions are passed to the PutPipelineDefinition action and returned by
the GetPipelineDefinition action.

# Arguments
- `pipeline_id`: The ID of the pipeline.
- `pipeline_objects`: The objects that define the pipeline. These objects overwrite the
  existing pipeline definition.

# Keyword Parameters
- `parameter_objects`: The parameter objects used with the pipeline.
- `parameter_values`: The parameter values used with the pipeline.
"""
function put_pipeline_definition(pipelineId, pipelineObjects; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("PutPipelineDefinition", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId, "pipelineObjects"=>pipelineObjects), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    query_objects(pipeline_id, sphere; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Queries the specified pipeline for the names of objects that match the specified set of
conditions.

# Arguments
- `pipeline_id`: The ID of the pipeline.
- `sphere`: Indicates whether the query applies to components or instances. The possible
  values are: COMPONENT, INSTANCE, and ATTEMPT.

# Keyword Parameters
- `limit`: The maximum number of object names that QueryObjects will return in a single
  call. The default value is 100.
- `marker`: The starting point for the results to be returned. For the first call, this
  value should be empty. As long as there are more results, continue to call QueryObjects
  with the marker value from the previous call to retrieve the next set of results.
- `query`: The query that defines the objects to be returned. The Query object can contain
  a maximum of ten selectors. The conditions in the query are limited to top-level String
  fields in the object. These filters can be applied to components, instances, and attempts.
"""
function query_objects(pipelineId, sphere; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("QueryObjects", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId, "sphere"=>sphere), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_tags(pipeline_id, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes existing tags from the specified pipeline.

# Arguments
- `pipeline_id`: The ID of the pipeline.
- `tag_keys`: The keys of the tags to remove.

"""
function remove_tags(pipelineId, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("RemoveTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId, "tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    report_task_progress(task_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Task runners call ReportTaskProgress when assigned a task to acknowledge that it has the
task. If the web service does not receive this acknowledgement within 2 minutes, it assigns
the task in a subsequent PollForTask call. After this initial acknowledgement, the task
runner only needs to report progress every 15 minutes to maintain its ownership of the
task. You can change this reporting time from 15 minutes by specifying a
reportProgressTimeout field in your pipeline. If a task runner does not report its status
after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the
task and reassigns the task in a subsequent response to PollForTask. Task runners should
call ReportTaskProgress every 60 seconds.

# Arguments
- `task_id`: The ID of the task assigned to the task runner. This value is provided in the
  response for PollForTask.

# Keyword Parameters
- `fields`: Key-value pairs that define the properties of the ReportTaskProgressInput
  object.
"""
function report_task_progress(taskId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("ReportTaskProgress", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("taskId"=>taskId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    report_task_runner_heartbeat(taskrunner_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Task runners call ReportTaskRunnerHeartbeat every 15 minutes to indicate that they are
operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS
Data Pipeline, the web service can use this call to detect when the task runner application
has failed and restart a new instance.

# Arguments
- `taskrunner_id`: The ID of the task runner. This value should be unique across your AWS
  account. In the case of AWS Data Pipeline Task Runner launched on a resource managed by AWS
  Data Pipeline, the web service provides a unique identifier when it launches the
  application. If you have written a custom task runner, you should assign a unique
  identifier for the task runner.

# Keyword Parameters
- `hostname`: The public DNS name of the task runner.
- `worker_group`: The type of task the task runner is configured to accept and process. The
  worker group is set as a field on objects in the pipeline when they are created. You can
  only specify a single value for workerGroup. There are no wildcard values permitted in
  workerGroup; the string must be an exact, case-sensitive, match.
"""
function report_task_runner_heartbeat(taskrunnerId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("ReportTaskRunnerHeartbeat", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("taskrunnerId"=>taskrunnerId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_status(object_ids, pipeline_id, status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Requests that the status of the specified physical or logical pipeline objects be updated
in the specified pipeline. This update might not occur immediately, but is eventually
consistent. The status that can be set depends on the type of object (for example, DataNode
or Activity). You cannot perform this operation on FINISHED pipelines and attempting to do
so returns InvalidRequestException.

# Arguments
- `object_ids`: The IDs of the objects. The corresponding objects can be either physical or
  components, but not a mix of both types.
- `pipeline_id`: The ID of the pipeline that contains the objects.
- `status`: The status to be set on all the objects specified in objectIds. For components,
  use PAUSE or RESUME. For instances, use TRY_CANCEL, RERUN, or MARK_FINISHED.

"""
function set_status(objectIds, pipelineId, status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("SetStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("objectIds"=>objectIds, "pipelineId"=>pipelineId, "status"=>status), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_task_status(task_id, task_status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Task runners call SetTaskStatus to notify AWS Data Pipeline that a task is completed and
provide information about the final status. A task runner makes this call regardless of
whether the task was sucessful. A task runner does not need to call SetTaskStatus for tasks
that are canceled by the web service during a call to ReportTaskProgress.

# Arguments
- `task_id`: The ID of the task assigned to the task runner. This value is provided in the
  response for PollForTask.
- `task_status`: If FINISHED, the task successfully completed. If FAILED, the task ended
  unsuccessfully. Preconditions use false.

# Keyword Parameters
- `error_id`: If an error occurred during the task, this value specifies the error code.
  This value is set on the physical attempt object. It is used to display error information
  to the user. It should not start with string \"Service_\" which is reserved by the system.
- `error_message`: If an error occurred during the task, this value specifies a text
  description of the error. This value is set on the physical attempt object. It is used to
  display error information to the user. The web service does not parse this value.
- `error_stack_trace`: If an error occurred during the task, this value specifies the stack
  trace associated with the error. This value is set on the physical attempt object. It is
  used to display error information to the user. The web service does not parse this value.
"""
function set_task_status(taskId, taskStatus; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("SetTaskStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("taskId"=>taskId, "taskStatus"=>taskStatus), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    validate_pipeline_definition(pipeline_id, pipeline_objects; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Validates the specified pipeline definition to ensure that it is well formed and can be run
without error.

# Arguments
- `pipeline_id`: The ID of the pipeline.
- `pipeline_objects`: The objects that define the pipeline changes to validate against the
  pipeline.

# Keyword Parameters
- `parameter_objects`: The parameter objects used with the pipeline.
- `parameter_values`: The parameter values used with the pipeline.
"""
function validate_pipeline_definition(pipelineId, pipelineObjects; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return data_pipeline("ValidatePipelineDefinition", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("pipelineId"=>pipelineId, "pipelineObjects"=>pipelineObjects), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
