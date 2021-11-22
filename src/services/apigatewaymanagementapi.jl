# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: apigatewaymanagementapi
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict{String, String, Vector{String}, Vector{String}}()

"""
    delete_connection(connection_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete the connection with the provided id.

# Arguments
- `connection_id`:

"""
function delete_connection(connectionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return apigatewaymanagementapi("DELETE", "/@connections/$(connectionId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_connection(connection_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get information about the connection with the provided id.

# Arguments
- `connection_id`:

"""
function get_connection(connectionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return apigatewaymanagementapi("GET", "/@connections/$(connectionId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    post_to_connection(data, connection_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sends the provided data to the specified connection.

# Arguments
- `data`: The data to be sent to the client specified by its connection id.
- `connection_id`: The identifier of the connection that a specific client is using.

"""
function post_to_connection(Data, connectionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return apigatewaymanagementapi("POST", "/@connections/$(connectionId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Data"=>Data), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
