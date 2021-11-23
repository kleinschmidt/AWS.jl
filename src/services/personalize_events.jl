# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: personalize_events
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("user_id" => "userId")

"""
    put_events(event_list, session_id, tracking_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Records user interaction event data. For more information see Recording Events.

# Arguments
- `event_list`: A list of event data from the session.
- `session_id`: The session ID associated with the user's visit. Your application generates
  the sessionId when a user first visits your website or uses your application. Amazon
  Personalize uses the sessionId to associate events with the user before they log in. For
  more information, see Recording Events.
- `tracking_id`: The tracking ID for the event. The ID is generated by a call to the
  CreateEventTracker API.

# Keyword Parameters
- `user_id`: The user associated with the event.
"""
function put_events(eventList, sessionId, trackingId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return personalize_events("POST", "/events", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventList"=>eventList, "sessionId"=>sessionId, "trackingId"=>trackingId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_items(dataset_arn, items; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds one or more items to an Items dataset. For more information see Importing Items
Incrementally.

# Arguments
- `dataset_arn`: The Amazon Resource Name (ARN) of the Items dataset you are adding the
  item or items to.
- `items`: A list of item data.

"""
function put_items(datasetArn, items; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return personalize_events("POST", "/items", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("datasetArn"=>datasetArn, "items"=>items), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_users(dataset_arn, users; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds one or more users to a Users dataset. For more information see Importing Users
Incrementally.

# Arguments
- `dataset_arn`: The Amazon Resource Name (ARN) of the Users dataset you are adding the
  user or users to.
- `users`: A list of user data.

"""
function put_users(datasetArn, users; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return personalize_events("POST", "/users", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("datasetArn"=>datasetArn, "users"=>users), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
