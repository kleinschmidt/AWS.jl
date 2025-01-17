# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: finspace
using AWS.Compat
using AWS.UUIDs

"""
    create_environment(name)
    create_environment(name, params::Dict{String,<:Any})

Create a new FinSpace environment.

# Arguments
- `name`: The name of the FinSpace environment to be created.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"dataBundles"`: The list of Amazon Resource Names (ARN) of the data bundles to install.
  Currently supported data bundle ARNs:
  arn:aws:finspace:{Region}::data-bundle/capital-markets-sample - Contains sample Capital
  Markets datasets, categories and controlled vocabularies.
  arn:aws:finspace:{Region}::data-bundle/taq (default) - Contains trades and quotes data in
  addition to sample Capital Markets data.
- `"description"`: The description of the FinSpace environment to be created.
- `"federationMode"`: Authentication mode for the environment.    FEDERATED - Users access
  FinSpace through Single Sign On (SSO) via your Identity provider.    LOCAL - Users access
  FinSpace via email and password managed within the FinSpace environment.
- `"federationParameters"`: Configuration information when authentication mode is FEDERATED.
- `"kmsKeyId"`: The KMS key id to encrypt your data in the FinSpace environment.
- `"superuserParameters"`: Configuration information for the superuser.
- `"tags"`: Add tags to your FinSpace environment.
"""
function create_environment(name; aws_config::AbstractAWSConfig=global_aws_config())
    return finspace(
        "POST",
        "/environment",
        Dict{String,Any}("name" => name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_environment(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "POST",
        "/environment",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("name" => name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_environment(environment_id)
    delete_environment(environment_id, params::Dict{String,<:Any})

Delete an FinSpace environment.

# Arguments
- `environment_id`: The identifier for the FinSpace environment.

"""
function delete_environment(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "DELETE",
        "/environment/$(environmentId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_environment(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "DELETE",
        "/environment/$(environmentId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_environment(environment_id)
    get_environment(environment_id, params::Dict{String,<:Any})

Returns the FinSpace environment object.

# Arguments
- `environment_id`: The identifier of the FinSpace environment.

"""
function get_environment(environmentId; aws_config::AbstractAWSConfig=global_aws_config())
    return finspace(
        "GET",
        "/environment/$(environmentId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_environment(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "GET",
        "/environment/$(environmentId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_environments()
    list_environments(params::Dict{String,<:Any})

A list of all of your FinSpace environments.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request.
- `"nextToken"`: A token generated by FinSpace that specifies where to continue pagination
  if a previous request was truncated. To get the next set of pages, pass in the nextToken
  value from the response object of the previous page call.
"""
function list_environments(; aws_config::AbstractAWSConfig=global_aws_config())
    return finspace(
        "GET", "/environment"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_environments(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "GET",
        "/environment",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

A list of all tags for a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "GET",
        "/tags/$(resourceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds metadata tags to a FinSpace resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the resource.
- `tags`: One or more tags to be assigned to the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return finspace(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes metadata tags from a FinSpace resource.

# Arguments
- `resource_arn`: A FinSpace resource from which you want to remove a tag or tags. The
  value for this parameter is an Amazon Resource Name (ARN).
- `tag_keys`: The tag keys (names) of one or more tags to be removed.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_environment(environment_id)
    update_environment(environment_id, params::Dict{String,<:Any})

Update your FinSpace environment.

# Arguments
- `environment_id`: The identifier of the FinSpace environment.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the environment.
- `"federationMode"`: Authentication mode for the environment.    FEDERATED - Users access
  FinSpace through Single Sign On (SSO) via your Identity provider.    LOCAL - Users access
  FinSpace via email and password managed within the FinSpace environment.
- `"federationParameters"`:
- `"name"`: The name of the environment.
"""
function update_environment(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace(
        "PUT",
        "/environment/$(environmentId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_environment(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace(
        "PUT",
        "/environment/$(environmentId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
