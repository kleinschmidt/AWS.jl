# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: fis
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("max_results" => "maxResults", "next_token" => "nextToken", "tags" => "tags", "tag_keys" => "tagKeys", "targets" => "targets", "actions" => "actions", "description" => "description", "role_arn" => "roleArn", "stop_conditions" => "stopConditions")

"""
    create_experiment_template(actions, client_token, description, role_arn, stop_conditions; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an experiment template.  To create a template, specify the following information:
  Targets: A target can be a specific resource in your AWS environment, or one or more
resources that match criteria that you specify, for example, resources that have specific
tags.    Actions: The actions to carry out on the target. You can specify multiple actions,
the duration of each action, and when to start each action during an experiment.    Stop
conditions: If a stop condition is triggered while an experiment is running, the experiment
is automatically stopped. You can define a stop condition as a CloudWatch alarm.   For more
information, see the AWS Fault Injection Simulator User Guide.

# Arguments
- `actions`: The actions for the experiment.
- `client_token`: Unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `description`: A description for the experiment template. Can contain up to 64 letters
  (A-Z and a-z).
- `role_arn`: The Amazon Resource Name (ARN) of an IAM role that grants the AWS FIS service
  permission to perform service actions on your behalf.
- `stop_conditions`: The stop conditions.

# Keyword Parameters
- `tags`: The tags to apply to the experiment template.
- `targets`: The targets for the experiment.
"""
function create_experiment_template(actions, clientToken, description, roleArn, stopConditions; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("POST", "/experimentTemplates", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("actions"=>actions, "clientToken"=>clientToken, "description"=>description, "roleArn"=>roleArn, "stopConditions"=>stopConditions), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified experiment template.

# Arguments
- `id`: The ID of the experiment template.

"""
function delete_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("DELETE", "/experimentTemplates/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_action(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about the specified AWS FIS action.

# Arguments
- `id`: The ID of the action.

"""
function get_action(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/actions/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_experiment(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about the specified experiment.

# Arguments
- `id`: The ID of the experiment.

"""
function get_experiment(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/experiments/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about the specified experiment template.

# Arguments
- `id`: The ID of the experiment template.

"""
function get_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/experimentTemplates/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_actions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the available AWS FIS actions.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_actions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/actions", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_experiment_templates(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists your experiment templates.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_experiment_templates(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/experimentTemplates", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_experiments(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists your experiments.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_experiments(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/experiments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the tags for the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_experiment(client_token, experiment_template_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts running an experiment from the specified experiment template.

# Arguments
- `client_token`: Unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `experiment_template_id`: The ID of the experiment template.

# Keyword Parameters
- `tags`: The tags to apply to the experiment.
"""
function start_experiment(clientToken, experimentTemplateId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("POST", "/experiments", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>clientToken, "experimentTemplateId"=>experimentTemplateId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_experiment(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops the specified experiment.

# Arguments
- `id`: The ID of the experiment.

"""
function stop_experiment(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("DELETE", "/experiments/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Applies the specified tags to the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tags`: The tags for the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified tags from the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

# Keyword Parameters
- `tag_keys`: The tag keys to remove.
"""
function untag_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("DELETE", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the specified experiment template.

# Arguments
- `id`: The ID of the experiment template.

# Keyword Parameters
- `actions`: The actions for the experiment.
- `description`: A description for the template.
- `role_arn`: The Amazon Resource Name (ARN) of an IAM role that grants the AWS FIS service
  permission to perform service actions on your behalf.
- `stop_conditions`: The stop conditions for the experiment.
- `targets`: The targets for the experiment.
"""
function update_experiment_template(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return fis("PATCH", "/experimentTemplates/$(id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
