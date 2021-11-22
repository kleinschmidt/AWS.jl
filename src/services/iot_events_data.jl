# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iot_events_data
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("key_value" => "keyValue", "max_results" => "maxResults", "next_token" => "nextToken", "state_name" => "stateName")

"""
    batch_acknowledge_alarm(acknowledge_action_requests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Acknowledges one or more alarms. The alarms change to the ACKNOWLEDGED state after you
acknowledge them.

# Arguments
- `acknowledge_action_requests`: The list of acknowledge action requests. You can specify
  up to 10 requests per operation.

"""
function batch_acknowledge_alarm(acknowledgeActionRequests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/alarms/acknowledge", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("acknowledgeActionRequests"=>acknowledgeActionRequests), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_disable_alarm(disable_action_requests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disables one or more alarms. The alarms change to the DISABLED state after you disable them.

# Arguments
- `disable_action_requests`: The list of disable action requests. You can specify up to 10
  requests per operation.

"""
function batch_disable_alarm(disableActionRequests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/alarms/disable", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("disableActionRequests"=>disableActionRequests), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_enable_alarm(enable_action_requests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Enables one or more alarms. The alarms change to the NORMAL state after you enable them.

# Arguments
- `enable_action_requests`: The list of enable action requests. You can specify up to 10
  requests per operation.

"""
function batch_enable_alarm(enableActionRequests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/alarms/enable", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("enableActionRequests"=>enableActionRequests), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_put_message(messages; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sends a set of messages to the AWS IoT Events system. Each message payload is transformed
into the input you specify (\"inputName\") and ingested into any detectors that monitor
that input. If multiple messages are sent, the order in which the messages are processed
isn't guaranteed. To guarantee ordering, you must send messages one at a time and wait for
a successful response.

# Arguments
- `messages`: The list of messages to send. Each message has the following format: '{
  \"messageId\": \"string\", \"inputName\": \"string\", \"payload\": \"string\"}'

"""
function batch_put_message(messages; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/inputs/messages", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("messages"=>messages), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_reset_alarm(reset_action_requests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Resets one or more alarms. The alarms return to the NORMAL state after you reset them.

# Arguments
- `reset_action_requests`: The list of reset action requests. You can specify up to 10
  requests per operation.

"""
function batch_reset_alarm(resetActionRequests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/alarms/reset", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resetActionRequests"=>resetActionRequests), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_snooze_alarm(snooze_action_requests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Changes one or more alarms to the snooze mode. The alarms change to the SNOOZE_DISABLED
state after you set them to the snooze mode.

# Arguments
- `snooze_action_requests`: The list of snooze action requests. You can specify up to 10
  requests per operation.

"""
function batch_snooze_alarm(snoozeActionRequests; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/alarms/snooze", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("snoozeActionRequests"=>snoozeActionRequests), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_update_detector(detectors; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the state, variable values, and timer settings of one or more detectors (instances)
of a specified detector model.

# Arguments
- `detectors`: The list of detectors (instances) to update, along with the values to update.

"""
function batch_update_detector(detectors; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("POST", "/detectors", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("detectors"=>detectors), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_alarm(alarm_model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about an alarm.

# Arguments
- `alarm_model_name`: The name of the alarm model.

# Keyword Parameters
- `key_value`: The value of the key used as a filter to select only the alarms associated
  with the key.
"""
function describe_alarm(alarmModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("GET", "/alarms/$(alarmModelName)/keyValues/", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_detector(detector_model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the specified detector (instance).

# Arguments
- `detector_model_name`: The name of the detector model whose detectors (instances) you
  want information about.

# Keyword Parameters
- `key_value`: A filter used to limit results to detectors (instances) created because of
  the given key ID.
"""
function describe_detector(detectorModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("GET", "/detectors/$(detectorModelName)/keyValues/", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_alarms(alarm_model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists one or more alarms. The operation returns only the metadata associated with each
alarm.

# Arguments
- `alarm_model_name`: The name of the alarm model.

# Keyword Parameters
- `max_results`: The maximum number of results to be returned per request.
- `next_token`: The token that you can use to return the next set of results.
"""
function list_alarms(alarmModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("GET", "/alarms/$(alarmModelName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_detectors(detector_model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists detectors (the instances of a detector model).

# Arguments
- `detector_model_name`: The name of the detector model whose detectors (instances) are
  listed.

# Keyword Parameters
- `max_results`: The maximum number of results to be returned per request.
- `next_token`: The token that you can use to return the next set of results.
- `state_name`: A filter that limits results to those detectors (instances) in the given
  state.
"""
function list_detectors(detectorModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iot_events_data("GET", "/detectors/$(detectorModelName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
