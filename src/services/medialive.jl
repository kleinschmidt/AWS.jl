# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: medialive
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("destinations" => "destinations", "input_devices" => "inputDevices", "input_security_groups" => "inputSecurityGroups", "media_connect_flows" => "mediaConnectFlows", "name" => "name", "request_id" => "requestId", "role_arn" => "roleArn", "sources" => "sources", "tags" => "tags", "type" => "type", "vpc" => "vpc", "channel_ids" => "channelIds", "multiplex_ids" => "multiplexIds", "max_results" => "maxResults", "next_token" => "nextToken", "whitelist_rules" => "whitelistRules", "hd_device_settings" => "hdDeviceSettings", "uhd_device_settings" => "uhdDeviceSettings", "id" => "id", "start" => "start", "channel_class" => "channelClass", "channel_configuration" => "channelConfiguration", "codec" => "codec", "duration" => "duration", "maximum_bitrate" => "maximumBitrate", "maximum_framerate" => "maximumFramerate", "resolution" => "resolution", "resource_type" => "resourceType", "special_feature" => "specialFeature", "video_quality" => "videoQuality", "multiplex_settings" => "multiplexSettings", "cdi_input_specification" => "cdiInputSpecification", "encoder_settings" => "encoderSettings", "input_attachments" => "inputAttachments", "input_specification" => "inputSpecification", "log_level" => "logLevel", "reserved" => "reserved", "multiplex_program_settings" => "multiplexProgramSettings", "creates" => "creates", "deletes" => "deletes", "input_ids" => "inputIds", "input_security_group_ids" => "inputSecurityGroupIds", "target_customer_id" => "targetCustomerId", "target_region" => "targetRegion", "transfer_message" => "transferMessage")

"""
    accept_input_device_transfer(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Accept an incoming input device transfer. The ownership of the device will transfer to your
AWS account.

# Arguments
- `input_device_id`: The unique ID of the input device to accept. For example,
  hd-123456789abcdef.

"""
function accept_input_device_transfer(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputDevices/$(inputDeviceId)/accept", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_delete(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts delete of resources.

# Keyword Parameters
- `channel_ids`: List of channel IDs
- `input_ids`: List of input IDs
- `input_security_group_ids`: List of input security group IDs
- `multiplex_ids`: List of multiplex IDs
"""
function batch_delete(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/batch/delete", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_start(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts existing resources

# Keyword Parameters
- `channel_ids`: List of channel IDs
- `multiplex_ids`: List of multiplex IDs
"""
function batch_start(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/batch/start", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_stop(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops running resources

# Keyword Parameters
- `channel_ids`: List of channel IDs
- `multiplex_ids`: List of multiplex IDs
"""
function batch_stop(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/batch/stop", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    batch_update_schedule(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update a channel schedule

# Arguments
- `channel_id`: Id of the channel whose schedule is being updated.

# Keyword Parameters
- `creates`: Schedule actions to create in the schedule.
- `deletes`: Schedule actions to delete from the schedule.
"""
function batch_update_schedule(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/channels/$(channelId)/schedule", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    cancel_input_device_transfer(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Cancel an input device transfer that you have requested.

# Arguments
- `input_device_id`: The unique ID of the input device to cancel. For example,
  hd-123456789abcdef.

"""
function cancel_input_device_transfer(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputDevices/$(inputDeviceId)/cancel", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    claim_device(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Send a request to claim an AWS Elemental device that you have purchased from a third-party
vendor. After the request succeeds, you will own the device.

# Keyword Parameters
- `id`: The id of the device you want to claim.
"""
function claim_device(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/claimDevice", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_channel(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new channel

# Keyword Parameters
- `cdi_input_specification`: Specification of CDI inputs for this channel
- `channel_class`: The class for this channel. STANDARD for a channel with two pipelines or
  SINGLE_PIPELINE for a channel with one pipeline.
- `destinations`:
- `encoder_settings`:
- `input_attachments`: List of input attachments for channel.
- `input_specification`: Specification of network and file inputs for this channel
- `log_level`: The log level to write to CloudWatch Logs.
- `name`: Name of channel.
- `request_id`: Unique request ID to be specified. This is needed to prevent retries
  from
creating multiple resources.
- `reserved`: Deprecated field that's only usable by whitelisted customers.
- `role_arn`: An optional Amazon Resource Name (ARN) of the role to assume when running the
  Channel.
- `tags`: A collection of key-value pairs.
- `vpc`: Settings for the VPC outputs
"""
function create_channel(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/channels", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("request_id"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_input(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create an input

# Keyword Parameters
- `destinations`: Destination settings for PUSH type inputs.
- `input_devices`: Settings for the devices.
- `input_security_groups`: A list of security groups referenced by IDs to attach to the
  input.
- `media_connect_flows`: A list of the MediaConnect Flows that you want to use in this
  input. You can specify as few as one
Flow and presently, as many as two. The only
  requirement is when you have more than one is that each Flow is in a
separate Availability
  Zone as this ensures your EML input is redundant to AZ issues.
- `name`: Name of the input.
- `request_id`: Unique identifier of the request to ensure the request is handled
exactly
  once in case of retries.
- `role_arn`: The Amazon Resource Name (ARN) of the role this input assumes during and
  after creation.
- `sources`: The source URLs for a PULL-type input. Every PULL type input needs
exactly two
  source URLs for redundancy.
Only specify sources for PULL type Inputs. Leave Destinations
  empty.
- `tags`: A collection of key-value pairs.
- `type`:
- `vpc`:
"""
function create_input(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("request_id"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_input_security_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a Input Security Group

# Keyword Parameters
- `tags`: A collection of key-value pairs.
- `whitelist_rules`: List of IPv4 CIDR addresses to whitelist
"""
function create_input_security_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputSecurityGroups", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_multiplex(availability_zones, multiplex_settings, name, request_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new multiplex.

# Arguments
- `availability_zones`: A list of availability zones for the multiplex. You must specify
  exactly two.
- `multiplex_settings`: Configuration for a multiplex event.
- `name`: Name of multiplex.
- `request_id`: Unique request ID. This prevents retries from creating multiple
resources.

# Keyword Parameters
- `tags`: A collection of key-value pairs.
"""
function create_multiplex(availabilityZones, multiplexSettings, name, requestId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/multiplexes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("availabilityZones"=>availabilityZones, "multiplexSettings"=>multiplexSettings, "name"=>name, "requestId"=>requestId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_multiplex_program(multiplex_id, multiplex_program_settings, program_name, request_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new program in the multiplex.

# Arguments
- `multiplex_id`: ID of the multiplex where the program is to be created.
- `multiplex_program_settings`: The settings for this multiplex program.
- `program_name`: Name of multiplex program.
- `request_id`: Unique request ID. This prevents retries from creating multiple
resources.

"""
function create_multiplex_program(multiplexId, multiplexProgramSettings, programName, requestId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/multiplexes/$(multiplexId)/programs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("multiplexProgramSettings"=>multiplexProgramSettings, "programName"=>programName, "requestId"=>requestId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_partner_input(input_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a partner input

# Arguments
- `input_id`: Unique ID of the input.

# Keyword Parameters
- `request_id`: Unique identifier of the request to ensure the request is handled
exactly
  once in case of retries.
- `tags`: A collection of key-value pairs.
"""
function create_partner_input(inputId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputs/$(inputId)/partners", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("request_id"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_tags(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create tags for a resource

# Arguments
- `resource-arn`:

# Keyword Parameters
- `tags`:
"""
function create_tags(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/tags/$(resource-arn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_channel(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts deletion of channel. The associated outputs are also deleted.

# Arguments
- `channel_id`: Unique ID of the channel.

"""
function delete_channel(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/channels/$(channelId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_input(input_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the input end point

# Arguments
- `input_id`: Unique ID of the input

"""
function delete_input(inputId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/inputs/$(inputId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_input_security_group(input_security_group_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an Input Security Group

# Arguments
- `input_security_group_id`: The Input Security Group to delete

"""
function delete_input_security_group(inputSecurityGroupId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/inputSecurityGroups/$(inputSecurityGroupId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_multiplex(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete a multiplex. The multiplex must be idle.

# Arguments
- `multiplex_id`: The ID of the multiplex.

"""
function delete_multiplex(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/multiplexes/$(multiplexId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_multiplex_program(multiplex_id, program_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete a program from a multiplex.

# Arguments
- `multiplex_id`: The ID of the multiplex that the program belongs to.
- `program_name`: The multiplex program name.

"""
function delete_multiplex_program(multiplexId, programName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/multiplexes/$(multiplexId)/programs/$(programName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_reservation(reservation_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete an expired reservation.

# Arguments
- `reservation_id`: Unique reservation ID, e.g. '1234567'

"""
function delete_reservation(reservationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/reservations/$(reservationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_schedule(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete all schedule actions on a channel.

# Arguments
- `channel_id`: Id of the channel whose schedule is being deleted.

"""
function delete_schedule(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/channels/$(channelId)/schedule", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_tags(resource-arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes tags for a resource

# Arguments
- `resource-arn`:
- `tag_keys`: An array of tag keys to delete

"""
function delete_tags(resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("DELETE", "/prod/tags/$(resource-arn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_channel(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets details about a channel

# Arguments
- `channel_id`: channel ID

"""
function describe_channel(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/channels/$(channelId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_input(input_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces details about an input

# Arguments
- `input_id`: Unique ID of the input

"""
function describe_input(inputId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputs/$(inputId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_input_device(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the details for the input device

# Arguments
- `input_device_id`: The unique ID of this input device. For example, hd-123456789abcdef.

"""
function describe_input_device(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputDevices/$(inputDeviceId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_input_device_thumbnail(accept, input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get the latest thumbnail data for the input device.

# Arguments
- `accept`: The HTTP Accept header. Indicates the requested type for the thumbnail.
- `input_device_id`: The unique ID of this input device. For example, hd-123456789abcdef.

"""
function describe_input_device_thumbnail(accept, inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputDevices/$(inputDeviceId)/thumbnailData", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("accept"=>accept)), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_input_security_group(input_security_group_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces a summary of an Input Security Group

# Arguments
- `input_security_group_id`: The id of the Input Security Group to describe

"""
function describe_input_security_group(inputSecurityGroupId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputSecurityGroups/$(inputSecurityGroupId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_multiplex(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets details about a multiplex.

# Arguments
- `multiplex_id`: The ID of the multiplex.

"""
function describe_multiplex(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/multiplexes/$(multiplexId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_multiplex_program(multiplex_id, program_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get the details for a program in a multiplex.

# Arguments
- `multiplex_id`: The ID of the multiplex that the program belongs to.
- `program_name`: The name of the program.

"""
function describe_multiplex_program(multiplexId, programName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/multiplexes/$(multiplexId)/programs/$(programName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_offering(offering_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get details for an offering.

# Arguments
- `offering_id`: Unique offering ID, e.g. '87654321'

"""
function describe_offering(offeringId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/offerings/$(offeringId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_reservation(reservation_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get details for a reservation.

# Arguments
- `reservation_id`: Unique reservation ID, e.g. '1234567'

"""
function describe_reservation(reservationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/reservations/$(reservationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_schedule(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get a channel schedule

# Arguments
- `channel_id`: Id of the channel whose schedule is being updated.

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function describe_schedule(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/channels/$(channelId)/schedule", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_channels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces list of channels that have been created

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_channels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/channels", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_input_device_transfers(transfer_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List input devices that are currently being transferred. List input devices that you are
transferring from your AWS account or input devices that another AWS account is
transferring to you.

# Arguments
- `transfer_type`:

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_input_device_transfers(transferType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputDeviceTransfers", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("transferType"=>transferType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_input_devices(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List input devices

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_input_devices(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputDevices", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_input_security_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces a list of Input Security Groups for an account

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_input_security_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputSecurityGroups", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_inputs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces list of inputs that have been created

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_inputs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/inputs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_multiplex_programs(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the programs that currently exist for a specific multiplex.

# Arguments
- `multiplex_id`: The ID of the multiplex that the programs belong to.

# Keyword Parameters
- `max_results`: The maximum number of items to return.
- `next_token`: The token to retrieve the next page of results.
"""
function list_multiplex_programs(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/multiplexes/$(multiplexId)/programs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_multiplexes(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieve a list of the existing multiplexes.

# Keyword Parameters
- `max_results`: The maximum number of items to return.
- `next_token`: The token to retrieve the next page of results.
"""
function list_multiplexes(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/multiplexes", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_offerings(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List offerings available for purchase.

# Keyword Parameters
- `channel_class`: Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
- `channel_configuration`: Filter to offerings that match the configuration of an existing
  channel, e.g. '2345678' (a channel ID)
- `codec`: Filter by codec, 'AVC', 'HEVC', 'MPEG2', 'AUDIO', or 'LINK'
- `duration`: Filter by offering duration, e.g. '12'
- `max_results`:
- `maximum_bitrate`: Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'
- `maximum_framerate`: Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
- `next_token`:
- `resolution`: Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
- `resource_type`: Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
- `special_feature`: Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'
- `video_quality`: Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'
"""
function list_offerings(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/offerings", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_reservations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List purchased reservations.

# Keyword Parameters
- `channel_class`: Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
- `codec`: Filter by codec, 'AVC', 'HEVC', 'MPEG2', 'AUDIO', or 'LINK'
- `max_results`:
- `maximum_bitrate`: Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'
- `maximum_framerate`: Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
- `next_token`:
- `resolution`: Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
- `resource_type`: Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
- `special_feature`: Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'
- `video_quality`: Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'
"""
function list_reservations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/reservations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Produces list of tags that have been created for a resource

# Arguments
- `resource-arn`:

"""
function list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("GET", "/prod/tags/$(resource-arn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    purchase_offering(count, offering_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Purchase an offering and create a reservation.

# Arguments
- `count`: Number of resources
- `offering_id`: Offering to purchase, e.g. '87654321'

# Keyword Parameters
- `name`: Name for the new reservation
- `request_id`: Unique request ID to be specified. This is needed to prevent retries from
  creating multiple resources.
- `start`: Requested reservation start time (UTC) in ISO-8601 format. The specified time
  must be between the first day of the current month and one year from now. If no value is
  given, the default is now.
- `tags`: A collection of key-value pairs
"""
function purchase_offering(count, offeringId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/offerings/$(offeringId)/purchase", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("count"=>count, "request_id"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    reject_input_device_transfer(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Reject the transfer of the specified input device to your AWS account.

# Arguments
- `input_device_id`: The unique ID of the input device to reject. For example,
  hd-123456789abcdef.

"""
function reject_input_device_transfer(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputDevices/$(inputDeviceId)/reject", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_channel(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an existing channel

# Arguments
- `channel_id`: A request to start a channel

"""
function start_channel(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/channels/$(channelId)/start", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_multiplex(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Start (run) the multiplex. Starting the multiplex does not start the channels. You must
explicitly start each channel.

# Arguments
- `multiplex_id`: The ID of the multiplex.

"""
function start_multiplex(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/multiplexes/$(multiplexId)/start", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_channel(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a running channel

# Arguments
- `channel_id`: A request to stop a running channel

"""
function stop_channel(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/channels/$(channelId)/stop", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_multiplex(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a running multiplex. If the multiplex isn't running, this action has no effect.

# Arguments
- `multiplex_id`: The ID of the multiplex.

"""
function stop_multiplex(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/multiplexes/$(multiplexId)/stop", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    transfer_input_device(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Start an input device transfer to another AWS account. After you make the request, the
other account must accept or reject the transfer.

# Arguments
- `input_device_id`: The unique ID of this input device. For example, hd-123456789abcdef.

# Keyword Parameters
- `target_customer_id`: The AWS account ID (12 digits) for the recipient of the device
  transfer.
- `target_region`: The target AWS region to transfer the device.
- `transfer_message`: An optional message for the recipient. Maximum 280 characters.
"""
function transfer_input_device(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("POST", "/prod/inputDevices/$(inputDeviceId)/transfer", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_channel(channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a channel.

# Arguments
- `channel_id`: channel ID

# Keyword Parameters
- `cdi_input_specification`: Specification of CDI inputs for this channel
- `destinations`: A list of output destinations for this channel.
- `encoder_settings`: The encoder settings for this channel.
- `input_attachments`:
- `input_specification`: Specification of network and file inputs for this channel
- `log_level`: The log level to write to CloudWatch Logs.
- `name`: The name of the channel.
- `role_arn`: An optional Amazon Resource Name (ARN) of the role to assume when running the
  Channel. If you do not specify this on an update call but the role was previously set that
  role will be removed.
"""
function update_channel(channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/channels/$(channelId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_channel_class(channel_class, channel_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Changes the class of the channel.

# Arguments
- `channel_class`: The channel class that you wish to update this channel to use.
- `channel_id`: Channel Id of the channel whose class should be updated.

# Keyword Parameters
- `destinations`: A list of output destinations for this channel.
"""
function update_channel_class(channelClass, channelId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/channels/$(channelId)/channelClass", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelClass"=>channelClass), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_input(input_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an input.

# Arguments
- `input_id`: Unique ID of the input.

# Keyword Parameters
- `destinations`: Destination settings for PUSH type inputs.
- `input_devices`: Settings for the devices.
- `input_security_groups`: A list of security groups referenced by IDs to attach to the
  input.
- `media_connect_flows`: A list of the MediaConnect Flow ARNs that you want to use as the
  source of the input. You can specify as few as one
Flow and presently, as many as two. The
  only requirement is when you have more than one is that each Flow is in a
separate
  Availability Zone as this ensures your EML input is redundant to AZ issues.
- `name`: Name of the input.
- `role_arn`: The Amazon Resource Name (ARN) of the role this input assumes during and
  after creation.
- `sources`: The source URLs for a PULL-type input. Every PULL type input needs
exactly two
  source URLs for redundancy.
Only specify sources for PULL type Inputs. Leave Destinations
  empty.
"""
function update_input(inputId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/inputs/$(inputId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_input_device(input_device_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the parameters for the input device.

# Arguments
- `input_device_id`: The unique ID of the input device. For example, hd-123456789abcdef.

# Keyword Parameters
- `hd_device_settings`: The settings that you want to apply to the HD input device.
- `name`: The name that you assigned to this input device (not the unique ID).
- `uhd_device_settings`: The settings that you want to apply to the UHD input device.
"""
function update_input_device(inputDeviceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/inputDevices/$(inputDeviceId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_input_security_group(input_security_group_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update an Input Security Group's Whilelists.

# Arguments
- `input_security_group_id`: The id of the Input Security Group to update.

# Keyword Parameters
- `tags`: A collection of key-value pairs.
- `whitelist_rules`: List of IPv4 CIDR addresses to whitelist
"""
function update_input_security_group(inputSecurityGroupId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/inputSecurityGroups/$(inputSecurityGroupId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_multiplex(multiplex_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a multiplex.

# Arguments
- `multiplex_id`: ID of the multiplex to update.

# Keyword Parameters
- `multiplex_settings`: The new settings for a multiplex.
- `name`: Name of the multiplex.
"""
function update_multiplex(multiplexId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/multiplexes/$(multiplexId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_multiplex_program(multiplex_id, program_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update a program in a multiplex.

# Arguments
- `multiplex_id`: The ID of the multiplex of the program to update.
- `program_name`: The name of the program to update.

# Keyword Parameters
- `multiplex_program_settings`: The new settings for a multiplex program.
"""
function update_multiplex_program(multiplexId, programName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/multiplexes/$(multiplexId)/programs/$(programName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_reservation(reservation_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update reservation.

# Arguments
- `reservation_id`: Unique reservation ID, e.g. '1234567'

# Keyword Parameters
- `name`: Name of the reservation
"""
function update_reservation(reservationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return medialive("PUT", "/prod/reservations/$(reservationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
