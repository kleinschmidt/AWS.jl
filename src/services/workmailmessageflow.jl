# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: workmailmessageflow
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict{String, String, Vector{String}, Vector{String}}()

"""
    get_raw_message_content(message_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the raw content of an in-transit email message, in MIME format.

# Arguments
- `message_id`: The identifier of the email message to retrieve.

"""
function get_raw_message_content(messageId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return workmailmessageflow("GET", "/messages/$(messageId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_raw_message_content(content, message_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the raw content of an in-transit email message, in MIME format. This example
describes how to update in-transit email message. For more information and examples for
using this API, see  Updating message content with AWS Lambda.  Updates to an in-transit
message only appear when you call PutRawMessageContent from an AWS Lambda function
configured with a synchronous  Run Lambda rule. If you call PutRawMessageContent on a
delivered or sent message, the message remains unchanged, even though GetRawMessageContent
returns an updated message.

# Arguments
- `content`: Describes the raw message content of the updated email message.
- `message_id`: The identifier of the email message being updated.

"""
function put_raw_message_content(content, messageId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return workmailmessageflow("POST", "/messages/$(messageId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("content"=>content), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
