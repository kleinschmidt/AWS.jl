# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iotsecuretunneling
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("description" => "description", "destination_config" => "destinationConfig", "tags" => "tags", "timeout_config" => "timeoutConfig", "max_results" => "maxResults", "next_token" => "nextToken", "thing_name" => "thingName", "delete" => "delete")

"""
    close_tunnel(tunnel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Closes a tunnel identified by the unique tunnel id. When a CloseTunnel request is received,
we close the WebSocket connections between the client and proxy server so no data can be
transmitted.

# Arguments
- `tunnel_id`: The ID of the tunnel to close.

# Keyword Parameters
- `delete`: When set to true, AWS IoT Secure Tunneling deletes the tunnel data immediately.
"""
function close_tunnel(tunnelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("CloseTunnel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tunnelId"=>tunnelId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_tunnel(tunnel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about a tunnel identified by the unique tunnel id.

# Arguments
- `tunnel_id`: The tunnel to describe.

"""
function describe_tunnel(tunnelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("DescribeTunnel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tunnelId"=>tunnelId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the tags for the specified resource.

# Arguments
- `resource_arn`: The resource ARN.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceArn"=>resourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tunnels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all tunnels for an AWS account. Tunnels are listed by creation time in descending
order, newer tunnels will be listed before older tunnels.

# Keyword Parameters
- `max_results`: The maximum number of results to return at once.
- `next_token`: A token to retrieve the next set of results.
- `thing_name`: The name of the IoT thing associated with the destination device.
"""
function list_tunnels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("ListTunnels", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    open_tunnel(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new tunnel, and returns two client access tokens for clients to use to connect to
the AWS IoT Secure Tunneling proxy server.

# Keyword Parameters
- `description`: A short text description of the tunnel.
- `destination_config`: The destination configuration for the OpenTunnel request.
- `tags`: A collection of tag metadata.
- `timeout_config`: Timeout configuration for a tunnel.
"""
function open_tunnel(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("OpenTunnel", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

A resource tag.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tags`: The tags for the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceArn"=>resourceArn, "tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a tag from a resource.

# Arguments
- `resource_arn`: The resource ARN.
- `tag_keys`: The keys of the tags to remove.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return iotsecuretunneling("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceArn"=>resourceArn, "tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
