# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: braket
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("max_results" => "maxResults", "next_token" => "nextToken", "device_parameters" => "deviceParameters", "tags" => "tags")

"""
    cancel_quantum_task(client_token, quantum_task_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Cancels the specified task.

# Arguments
- `client_token`: The client token associated with the request.
- `quantum_task_arn`: The ARN of the task to cancel.

"""
function cancel_quantum_task(clientToken, quantumTaskArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("PUT", "/quantum-task/$(quantumTaskArn)/cancel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>clientToken), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_quantum_task(action, client_token, device_arn, output_s3_bucket, output_s3_key_prefix, shots; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a quantum task.

# Arguments
- `action`: The action associated with the task.
- `client_token`: The client token associated with the request.
- `device_arn`: The ARN of the device to run the task on.
- `output_s3_bucket`: The S3 bucket to store task result files in.
- `output_s3_key_prefix`: The key prefix for the location in the S3 bucket to store task
  results in.
- `shots`: The number of shots to use for the task.

# Keyword Parameters
- `device_parameters`: The parameters for the device to run the task on.
- `tags`: Tags to be added to the quantum task you're creating.
"""
function create_quantum_task(action, clientToken, deviceArn, outputS3Bucket, outputS3KeyPrefix, shots; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("POST", "/quantum-task", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("action"=>action, "clientToken"=>clientToken, "deviceArn"=>deviceArn, "outputS3Bucket"=>outputS3Bucket, "outputS3KeyPrefix"=>outputS3KeyPrefix, "shots"=>shots), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_device(device_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the devices available in Amazon Braket.

# Arguments
- `device_arn`: The ARN of the device to retrieve.

"""
function get_device(deviceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("GET", "/device/$(deviceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_quantum_task(quantum_task_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the specified quantum task.

# Arguments
- `quantum_task_arn`: the ARN of the task to retrieve.

"""
function get_quantum_task(quantumTaskArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("GET", "/quantum-task/$(quantumTaskArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Shows the tags associated with this resource.

# Arguments
- `resource_arn`: Specify the resourceArn for the resource whose tags to display.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    search_devices(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Searches for devices using the specified filters.

# Arguments
- `filters`: The filter values to use to search for a device.

# Keyword Parameters
- `max_results`: The maximum number of results to return in the response.
- `next_token`: A token used for pagination of results returned in the response. Use the
  token returned from the previous request continue results where the previous request ended.
"""
function search_devices(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("POST", "/devices", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filters"=>filters), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    search_quantum_tasks(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Searches for tasks that match the specified filter values.

# Arguments
- `filters`: Array of SearchQuantumTasksFilter objects.

# Keyword Parameters
- `max_results`: Maximum number of results to return in the response.
- `next_token`: A token used for pagination of results returned in the response. Use the
  token returned from the previous request continue results where the previous request ended.
"""
function search_quantum_tasks(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("POST", "/quantum-tasks", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filters"=>filters), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Add a tag to the specified resource.

# Arguments
- `resource_arn`: Specify the resourceArn of the resource to which a tag will be added.
- `tags`: Specify the tags to add to the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Remove tags from a resource.

# Arguments
- `resource_arn`: Specify the resourceArn for the resource from which to remove the tags.
- `tag_keys`: Specify the keys for the tags to remove from the resource.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return braket("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
