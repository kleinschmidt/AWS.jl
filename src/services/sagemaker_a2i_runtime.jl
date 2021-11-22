# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: sagemaker_a2i_runtime
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("creation_time_after" => "CreationTimeAfter", "creation_time_before" => "CreationTimeBefore", "max_results" => "MaxResults", "next_token" => "NextToken", "sort_order" => "SortOrder", "data_attributes" => "DataAttributes")

"""
    delete_human_loop(human_loop_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified human loop for a flow definition. If the human loop was deleted, this
operation will return a ResourceNotFoundException.

# Arguments
- `human_loop_name`: The name of the human loop that you want to delete.

"""
function delete_human_loop(HumanLoopName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return sagemaker_a2i_runtime("DELETE", "/human-loops/$(HumanLoopName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_human_loop(human_loop_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the specified human loop. If the human loop was deleted, this
operation will return a ResourceNotFoundException error.

# Arguments
- `human_loop_name`: The name of the human loop that you want information about.

"""
function describe_human_loop(HumanLoopName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return sagemaker_a2i_runtime("GET", "/human-loops/$(HumanLoopName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_human_loops(flow_definition_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about human loops, given the specified parameters. If a human loop was
deleted, it will not be included.

# Arguments
- `flow_definition_arn`: The Amazon Resource Name (ARN) of a flow definition.

# Keyword Parameters
- `creation_time_after`: (Optional) The timestamp of the date when you want the human loops
  to begin in ISO 8601 format. For example, 2020-02-24.
- `creation_time_before`: (Optional) The timestamp of the date before which you want the
  human loops to begin in ISO 8601 format. For example, 2020-02-24.
- `max_results`: The total number of items to return. If the total number of available
  items is more than the value specified in MaxResults, then a NextToken is returned in the
  output. You can use this token to display the next page of results.
- `next_token`: A token to display the next page of results.
- `sort_order`: Optional. The order for displaying results. Valid values: Ascending and
  Descending.
"""
function list_human_loops(FlowDefinitionArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return sagemaker_a2i_runtime("GET", "/human-loops", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FlowDefinitionArn"=>FlowDefinitionArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_human_loop(flow_definition_arn, human_loop_input, human_loop_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts a human loop, provided that at least one activation condition is met.

# Arguments
- `flow_definition_arn`: The Amazon Resource Name (ARN) of the flow definition associated
  with this human loop.
- `human_loop_input`: An object that contains information about the human loop.
- `human_loop_name`: The name of the human loop.

# Keyword Parameters
- `data_attributes`: Attributes of the specified data. Use DataAttributes to specify if
  your data is free of personally identifiable information and/or free of adult content.
"""
function start_human_loop(FlowDefinitionArn, HumanLoopInput, HumanLoopName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return sagemaker_a2i_runtime("POST", "/human-loops", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FlowDefinitionArn"=>FlowDefinitionArn, "HumanLoopInput"=>HumanLoopInput, "HumanLoopName"=>HumanLoopName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_human_loop(human_loop_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops the specified human loop.

# Arguments
- `human_loop_name`: The name of the human loop that you want to stop.

"""
function stop_human_loop(HumanLoopName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return sagemaker_a2i_runtime("POST", "/human-loops/stop", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HumanLoopName"=>HumanLoopName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
