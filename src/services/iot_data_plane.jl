# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iot_data_plane
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("next_token" => "nextToken", "page_size" => "pageSize", "shadow_name" => "name", "payload" => "payload", "qos" => "qos", "retain" => "retain", "max_results" => "maxResults")

"""
    delete_thing_shadow(thing_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the shadow for the specified thing. Requires permission to access the
DeleteThingShadow action. For more information, see DeleteThingShadow in the IoT Developer
Guide.

# Arguments
- `thing_name`: The name of the thing.

# Keyword Parameters
- `shadow_name`: The name of the shadow.
"""
function delete_thing_shadow(thingName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("DELETE", "/things/$(thingName)/shadow", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_retained_message(topic; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the details of a single retained message for the specified topic. This action returns
the message payload of the retained message, which can incur messaging costs. To list only
the topic names of the retained messages, call ListRetainedMessages. Requires permission to
access the GetRetainedMessage action. For more information about messaging costs, see IoT
Core pricing - Messaging.

# Arguments
- `topic`: The topic name of the retained message to retrieve.

"""
function get_retained_message(topic; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("GET", "/retainedMessage/$(topic)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_thing_shadow(thing_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the shadow for the specified thing. Requires permission to access the GetThingShadow
action. For more information, see GetThingShadow in the IoT Developer Guide.

# Arguments
- `thing_name`: The name of the thing.

# Keyword Parameters
- `shadow_name`: The name of the shadow.
"""
function get_thing_shadow(thingName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("GET", "/things/$(thingName)/shadow", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_named_shadows_for_thing(thing_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the shadows for the specified thing. Requires permission to access the
ListNamedShadowsForThing action.

# Arguments
- `thing_name`: The name of the thing.

# Keyword Parameters
- `next_token`: The token to retrieve the next set of results.
- `page_size`: The result page size.
"""
function list_named_shadows_for_thing(thingName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("GET", "/api/things/shadow/ListNamedShadowsForThing/$(thingName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_retained_messages(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists summary information about the retained messages stored for the account. This action
returns only the topic names of the retained messages. It doesn't return any message
payloads. Although this action doesn't return a message payload, it can still incur
messaging costs. To get the message payload of a retained message, call GetRetainedMessage
with the topic name of the retained message. Requires permission to access the
ListRetainedMessages action. For more information about messaging costs, see IoT Core
pricing - Messaging.

# Keyword Parameters
- `max_results`: The maximum number of results to return at one time.
- `next_token`: To retrieve the next set of results, the nextToken value from a previous
  response; otherwise null to receive the first set of results.
"""
function list_retained_messages(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("GET", "/retainedMessage", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    publish(topic; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Publishes an MQTT message. Requires permission to access the Publish action. For more
information about MQTT messages, see MQTT Protocol in the IoT Developer Guide. For more
information about messaging costs, see IoT Core pricing - Messaging.

# Arguments
- `topic`: The name of the MQTT topic.

# Keyword Parameters
- `payload`: The message body. MQTT accepts text, binary, and empty (null) message
  payloads. Publishing an empty (null) payload with retain = true deletes the retained
  message identified by topic from IoT Core.
- `qos`: The Quality of Service (QoS) level.
- `retain`: A Boolean value that determines whether to set the RETAIN flag when the message
  is published. Setting the RETAIN flag causes the message to be retained and sent to new
  subscribers to the topic. Valid values: true | false  Default value: false
"""
function publish(topic; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("POST", "/topics/$(topic)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_thing_shadow(payload, thing_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the shadow for the specified thing. Requires permission to access the
UpdateThingShadow action. For more information, see UpdateThingShadow in the IoT Developer
Guide.

# Arguments
- `payload`: The state information, in JSON format.
- `thing_name`: The name of the thing.

# Keyword Parameters
- `shadow_name`: The name of the shadow.
"""
function update_thing_shadow(payload, thingName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_data_plane("POST", "/things/$(thingName)/shadow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("payload"=>payload), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
