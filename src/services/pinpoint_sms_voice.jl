# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: pinpoint_sms_voice
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("event_destination" => "EventDestination", "event_destination_name" => "EventDestinationName", "configuration_set_name" => "ConfigurationSetName", "next_token" => "NextToken", "page_size" => "PageSize", "caller_id" => "CallerId", "content" => "Content", "destination_phone_number" => "DestinationPhoneNumber", "origination_phone_number" => "OriginationPhoneNumber")

"""
    create_configuration_set(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new configuration set. After you create the configuration set, you can add one or
more event destinations to it.

# Keyword Parameters
- `configuration_set_name`: The name that you want to give the configuration set.
"""
function create_configuration_set(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_configuration_set_event_destination(configuration_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new event destination in a configuration set.

# Arguments
- `configuration_set_name`: ConfigurationSetName

# Keyword Parameters
- `event_destination`:
- `event_destination_name`: A name that identifies the event destination.
"""
function create_configuration_set_event_destination(ConfigurationSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_configuration_set(configuration_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an existing configuration set.

# Arguments
- `configuration_set_name`: ConfigurationSetName

"""
function delete_configuration_set(ConfigurationSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_configuration_set_event_destination(configuration_set_name, event_destination_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an event destination in a configuration set.

# Arguments
- `configuration_set_name`: ConfigurationSetName
- `event_destination_name`: EventDestinationName

"""
function delete_configuration_set_event_destination(ConfigurationSetName, EventDestinationName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_configuration_set_event_destinations(configuration_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Obtain information about an event destination, including the types of events it reports,
the Amazon Resource Name (ARN) of the destination, and the name of the event destination.

# Arguments
- `configuration_set_name`: ConfigurationSetName

"""
function get_configuration_set_event_destinations(ConfigurationSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_configuration_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all of the configuration sets associated with your Amazon Pinpoint account in the
current region.

# Keyword Parameters
- `next_token`: A token returned from a previous call to the API that indicates the
  position in the list of results.
- `page_size`: Used to specify the number of items that should be returned in the response.
"""
function list_configuration_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    send_voice_message(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new voice message and send it to a recipient's phone number.

# Keyword Parameters
- `caller_id`: The phone number that appears on recipients' devices when they receive the
  message.
- `configuration_set_name`: The name of the configuration set that you want to use to send
  the message.
- `content`:
- `destination_phone_number`: The phone number that you want to send the voice message to.
- `origination_phone_number`: The phone number that Amazon Pinpoint should use to send the
  voice message. This isn't necessarily the phone number that appears on recipients' devices
  when they receive the message, because you can specify a CallerId parameter in the request.
"""
function send_voice_message(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("POST", "/v1/sms-voice/voice/message", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_configuration_set_event_destination(configuration_set_name, event_destination_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update an event destination in a configuration set. An event destination is a location that
you publish information about your voice calls to. For example, you can log an event to an
Amazon CloudWatch destination when a call fails.

# Arguments
- `configuration_set_name`: ConfigurationSetName
- `event_destination_name`: EventDestinationName

# Keyword Parameters
- `event_destination`:
"""
function update_configuration_set_event_destination(ConfigurationSetName, EventDestinationName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return pinpoint_sms_voice("PUT", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
