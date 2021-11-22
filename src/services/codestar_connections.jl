# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: codestar_connections
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("provider_endpoint" => "ProviderEndpoint", "vpc_configuration" => "VpcConfiguration", "max_results" => "MaxResults", "next_token" => "NextToken", "host_arn_filter" => "HostArnFilter", "provider_type_filter" => "ProviderTypeFilter", "host_arn" => "HostArn", "provider_type" => "ProviderType", "tags" => "Tags")

"""
    create_connection(connection_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a connection that can then be given to other AWS services like CodePipeline so that
it can access third-party code repositories. The connection is in pending status until the
third-party connection handshake is completed from the console.

# Arguments
- `connection_name`: The name of the connection to be created. The name must be unique in
  the calling AWS account.

# Keyword Parameters
- `host_arn`: The Amazon Resource Name (ARN) of the host associated with the connection to
  be created.
- `provider_type`: The name of the external provider where your third-party code repository
  is configured.
- `tags`: The key-value pair to use when tagging the resource.
"""
function create_connection(ConnectionName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("CreateConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionName"=>ConnectionName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_host(name, provider_endpoint, provider_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a resource that represents the infrastructure where a third-party provider is
installed. The host is used when you create connections to an installed third-party
provider type, such as GitHub Enterprise Server. You create one host for all connections to
that provider.  A host created through the CLI or the SDK is in `PENDING` status by
default. You can make its status `AVAILABLE` by setting up the host in the console.

# Arguments
- `name`: The name of the host to be created. The name must be unique in the calling AWS
  account.
- `provider_endpoint`: The endpoint of the infrastructure to be represented by the host
  after it is created.
- `provider_type`: The name of the installed provider to be associated with your
  connection. The host resource represents the infrastructure where your provider type is
  installed. The valid provider type is GitHub Enterprise Server.

# Keyword Parameters
- `tags`:
- `vpc_configuration`: The VPC configuration to be provisioned for the host. A VPC must be
  configured and the infrastructure to be represented by the host must already be connected
  to the VPC.
"""
function create_host(Name, ProviderEndpoint, ProviderType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("CreateHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name, "ProviderEndpoint"=>ProviderEndpoint, "ProviderType"=>ProviderType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_connection(connection_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The connection to be deleted.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of the connection to be deleted.  The
  ARN is never reused if the connection is deleted.

"""
function delete_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("DeleteConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionArn"=>ConnectionArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_host(host_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The host to be deleted. Before you delete a host, all connections associated to the host
must be deleted.  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or
VPC_CONFIG_DELETING state.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the host to be deleted.

"""
function delete_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("DeleteHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_connection(connection_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the connection ARN and details such as status, owner, and provider type.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of a connection.

"""
function get_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("GetConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionArn"=>ConnectionArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_host(host_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the host ARN and details such as status, provider type, endpoint, and, if
applicable, the VPC configuration.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the requested host.

"""
function get_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("GetHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_connections(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the connections associated with your account.

# Keyword Parameters
- `host_arn_filter`: Filters the list of connections to those associated with a specified
  host.
- `max_results`: The maximum number of results to return in a single call. To retrieve the
  remaining results, make another call with the returned nextToken value.
- `next_token`: The token that was returned from the previous ListConnections call, which
  can be used to return the next set of connections in the list.
- `provider_type_filter`: Filters the list of connections to those associated with a
  specified provider, such as Bitbucket.
"""
function list_connections(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("ListConnections", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_hosts(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the hosts associated with your account.

# Keyword Parameters
- `max_results`: The maximum number of results to return in a single call. To retrieve the
  remaining results, make another call with the returned nextToken value.
- `next_token`: The token that was returned from the previous ListHosts call, which can be
  used to return the next set of hosts in the list.
"""
function list_hosts(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("ListHosts", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the set of key-value pairs (metadata) that are used to manage the resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource for which you want to get
  information about tags, if any.

"""
function list_tags_for_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to
manage a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to which you want to add
  or update tags.
- `tags`: The tags you want to modify or add to the resource.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes tags from an AWS resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to remove tags from.
- `tag_keys`: The list of keys for the tags to be removed from the resource.

"""
function untag_resource(ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_host(host_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a specified host with the provided configurations.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the host to be updated.

# Keyword Parameters
- `provider_endpoint`: The URL or endpoint of the host to be updated.
- `vpc_configuration`: The VPC configuration of the host to be updated. A VPC must be
  configured and the infrastructure to be represented by the host must already be connected
  to the VPC.
"""
function update_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return codestar_connections("UpdateHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
