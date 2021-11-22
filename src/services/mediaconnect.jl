# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mediaconnect
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("cidr_allow_list" => "cidrAllowList", "description" => "description", "destination" => "destination", "encryption" => "encryption", "max_latency" => "maxLatency", "media_stream_output_configurations" => "mediaStreamOutputConfigurations", "min_latency" => "minLatency", "port" => "port", "protocol" => "protocol", "remote_id" => "remoteId", "smoothing_latency" => "smoothingLatency", "stream_id" => "streamId", "vpc_interface_attachment" => "vpcInterfaceAttachment", "max_results" => "maxResults", "next_token" => "nextToken", "entitlement_status" => "entitlementStatus", "subscribers" => "subscribers", "source_failover_config" => "sourceFailoverConfig", "decryption" => "decryption", "entitlement_arn" => "entitlementArn", "ingest_port" => "ingestPort", "max_bitrate" => "maxBitrate", "max_sync_buffer" => "maxSyncBuffer", "media_stream_source_configurations" => "mediaStreamSourceConfigurations", "vpc_interface_name" => "vpcInterfaceName", "whitelist_cidr" => "whitelistCidr", "attributes" => "attributes", "clock_rate" => "clockRate", "media_stream_type" => "mediaStreamType", "video_format" => "videoFormat", "availability_zone" => "availabilityZone", "entitlements" => "entitlements", "media_streams" => "mediaStreams", "outputs" => "outputs", "source" => "source", "sources" => "sources", "vpc_interfaces" => "vpcInterfaces")

"""
    add_flow_media_streams(flow_arn, media_streams; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds media streams to an existing flow. After you add a media stream to a flow, you can
associate it with a source and/or an output that uses the ST 2110 JPEG XS or CDI protocol.

# Arguments
- `flow_arn`: The Amazon Resource Name (ARN) of the flow.
- `media_streams`: The media streams that you want to add to the flow.

"""
function add_flow_media_streams(flowArn, mediaStreams; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/$(flowArn)/mediaStreams", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("mediaStreams"=>mediaStreams), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    add_flow_outputs(flow_arn, outputs; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds outputs to an existing flow. You can create up to 50 outputs per flow.

# Arguments
- `flow_arn`: The flow that you want to add outputs to.
- `outputs`: A list of outputs that you want to add.

"""
function add_flow_outputs(flowArn, outputs; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/$(flowArn)/outputs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("outputs"=>outputs), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    add_flow_sources(flow_arn, sources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds Sources to flow

# Arguments
- `flow_arn`: The flow that you want to mutate.
- `sources`: A list of sources that you want to add.

"""
function add_flow_sources(flowArn, sources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/$(flowArn)/source", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("sources"=>sources), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    add_flow_vpc_interfaces(flow_arn, vpc_interfaces; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds VPC interfaces to flow

# Arguments
- `flow_arn`: The flow that you want to mutate.
- `vpc_interfaces`: A list of VPC interfaces that you want to add.

"""
function add_flow_vpc_interfaces(flowArn, vpcInterfaces; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/$(flowArn)/vpcInterfaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("vpcInterfaces"=>vpcInterfaces), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_flow(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new flow. The request must include one source. The request optionally can include
outputs (up to 50) and entitlements (up to 50).

# Arguments
- `name`: The name of the flow.

# Keyword Parameters
- `availability_zone`: The Availability Zone that you want to create the flow in. These
  options are limited to the Availability Zones within the current AWS Region.
- `entitlements`: The entitlements that you want to grant on a flow.
- `media_streams`: The media streams that you want to add to the flow. You can associate
  these media streams with sources and outputs on the flow.
- `outputs`: The outputs that you want to add to this flow.
- `source`:
- `source_failover_config`:
- `sources`:
- `vpc_interfaces`: The VPC interfaces you want on the flow.
"""
function create_flow(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("name"=>name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_flow(flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a flow. Before you can delete a flow, you must stop the flow.

# Arguments
- `flow_arn`: The ARN of the flow that you want to delete.

"""
function delete_flow(flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_flow(flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays the details of a flow. The response includes the flow ARN, name, and Availability
Zone, as well as details about the source, outputs, and entitlements.

# Arguments
- `flow_arn`: The ARN of the flow that you want to describe.

"""
function describe_flow(flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/flows/$(flowArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_offering(offering_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays the details of an offering. The response includes the offering description,
duration, outbound bandwidth, price, and Amazon Resource Name (ARN).

# Arguments
- `offering_arn`: The Amazon Resource Name (ARN) of the offering.

"""
function describe_offering(offeringArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/offerings/$(offeringArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_reservation(reservation_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays the details of a reservation. The response includes the reservation name, state,
start date and time, and the details of the offering that make up the rest of the
reservation (such as price, duration, and outbound bandwidth).

# Arguments
- `reservation_arn`: The Amazon Resource Name (ARN) of the reservation.

"""
function describe_reservation(reservationArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/reservations/$(reservationArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    grant_flow_entitlements(entitlements, flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Grants entitlements to an existing flow.

# Arguments
- `entitlements`: The list of entitlements that you want to grant.
- `flow_arn`: The flow that you want to grant entitlements on.

"""
function grant_flow_entitlements(entitlements, flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/$(flowArn)/entitlements", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("entitlements"=>entitlements), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_entitlements(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays a list of all entitlements that have been granted to this account. This request
returns 20 results per page.

# Keyword Parameters
- `max_results`: The maximum number of results to return per API request. For example, you
  submit a ListEntitlements request with MaxResults set at 5. Although 20 items match your
  request, the service returns no more than the first 5 items. (The service also returns a
  NextToken value that you can use to fetch the next batch of results.) The service might
  return fewer results than the MaxResults value. If MaxResults is not included in the
  request, the service defaults to pagination with a maximum of 20 results per page.
- `next_token`: The token that identifies which batch of results that you want to see. For
  example, you submit a ListEntitlements request with MaxResults set at 5. The service
  returns the first batch of results (up to 5) and a NextToken value. To see the next batch
  of results, you can submit the ListEntitlements request a second time and specify the
  NextToken value.
"""
function list_entitlements(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/entitlements", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_flows(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays a list of flows that are associated with this account. This request returns a
paginated result.

# Keyword Parameters
- `max_results`: The maximum number of results to return per API request. For example, you
  submit a ListFlows request with MaxResults set at 5. Although 20 items match your request,
  the service returns no more than the first 5 items. (The service also returns a NextToken
  value that you can use to fetch the next batch of results.) The service might return fewer
  results than the MaxResults value. If MaxResults is not included in the request, the
  service defaults to pagination with a maximum of 10 results per page.
- `next_token`: The token that identifies which batch of results that you want to see. For
  example, you submit a ListFlows request with MaxResults set at 5. The service returns the
  first batch of results (up to 5) and a NextToken value. To see the next batch of results,
  you can submit the ListFlows request a second time and specify the NextToken value.
"""
function list_flows(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/flows", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_offerings(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays a list of all offerings that are available to this account in the current AWS
Region. If you have an active reservation (which means you've purchased an offering that
has already started and hasn't expired yet), your account isn't eligible for other
offerings.

# Keyword Parameters
- `max_results`: The maximum number of results to return per API request. For example, you
  submit a ListOfferings request with MaxResults set at 5. Although 20 items match your
  request, the service returns no more than the first 5 items. (The service also returns a
  NextToken value that you can use to fetch the next batch of results.) The service might
  return fewer results than the MaxResults value. If MaxResults is not included in the
  request, the service defaults to pagination with a maximum of 10 results per page.
- `next_token`: The token that identifies which batch of results that you want to see. For
  example, you submit a ListOfferings request with MaxResults set at 5. The service returns
  the first batch of results (up to 5) and a NextToken value. To see the next batch of
  results, you can submit the ListOfferings request a second time and specify the NextToken
  value.
"""
function list_offerings(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/offerings", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_reservations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Displays a list of all reservations that have been purchased by this account in the current
AWS Region. This list includes all reservations in all states (such as active and expired).

# Keyword Parameters
- `max_results`: The maximum number of results to return per API request. For example, you
  submit a ListReservations request with MaxResults set at 5. Although 20 items match your
  request, the service returns no more than the first 5 items. (The service also returns a
  NextToken value that you can use to fetch the next batch of results.) The service might
  return fewer results than the MaxResults value. If MaxResults is not included in the
  request, the service defaults to pagination with a maximum of 10 results per page.
- `next_token`: The token that identifies which batch of results that you want to see. For
  example, you submit a ListReservations request with MaxResults set at 5. The service
  returns the first batch of results (up to 5) and a NextToken value. To see the next batch
  of results, you can submit the ListOfferings request a second time and specify the
  NextToken value.
"""
function list_reservations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/v1/reservations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all tags on an AWS Elemental MediaConnect resource

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental
  MediaConnect resource for which to list the tags.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    purchase_offering(offering_arn, reservation_name, start; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Submits a request to purchase an offering. If you already have an active reservation, you
can't purchase another offering.

# Arguments
- `offering_arn`: The Amazon Resource Name (ARN) of the offering.
- `reservation_name`: The name that you want to use for the reservation.
- `start`: The date and time that you want the reservation to begin, in Coordinated
  Universal Time (UTC). You can specify any date and time between 12:00am on the first day of
  the current month to the current time on today's date, inclusive. Specify the start in a
  24-hour notation. Use the following format: YYYY-MM-DDTHH:mm:SSZ, where T and Z are literal
  characters. For example, to specify 11:30pm on March 5, 2020, enter 2020-03-05T23:30:00Z.

"""
function purchase_offering(offeringArn, reservationName, start; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/offerings/$(offeringArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("reservationName"=>reservationName, "start"=>start), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_flow_media_stream(flow_arn, media_stream_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a media stream from a flow. This action is only available if the media stream is
not associated with a source or output.

# Arguments
- `flow_arn`: The Amazon Resource Name (ARN) of the flow.
- `media_stream_name`: The name of the media stream that you want to remove.

"""
function remove_flow_media_stream(flowArn, mediaStreamName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)/mediaStreams/$(mediaStreamName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_flow_output(flow_arn, output_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes an output from an existing flow. This request can be made only on an output that
does not have an entitlement associated with it. If the output has an entitlement, you must
revoke the entitlement instead. When an entitlement is revoked from a flow, the service
automatically removes the associated output.

# Arguments
- `flow_arn`: The flow that you want to remove an output from.
- `output_arn`: The ARN of the output that you want to remove.

"""
function remove_flow_output(flowArn, outputArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)/outputs/$(outputArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_flow_source(flow_arn, source_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a source from an existing flow. This request can be made only if there is more than
one source on the flow.

# Arguments
- `flow_arn`: The flow that you want to remove a source from.
- `source_arn`: The ARN of the source that you want to remove.

"""
function remove_flow_source(flowArn, sourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)/source/$(sourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_flow_vpc_interface(flow_arn, vpc_interface_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a VPC Interface from an existing flow. This request can be made only on a VPC
interface that does not have a Source or Output associated with it. If the VPC interface is
referenced by a Source or Output, you must first delete or update the Source or Output to
no longer reference the VPC interface.

# Arguments
- `flow_arn`: The flow that you want to remove a VPC interface from.
- `vpc_interface_name`: The name of the VPC interface that you want to remove.

"""
function remove_flow_vpc_interface(flowArn, vpcInterfaceName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)/vpcInterfaces/$(vpcInterfaceName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    revoke_flow_entitlement(entitlement_arn, flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Revokes an entitlement from a flow. Once an entitlement is revoked, the content becomes
unavailable to the subscriber and the associated output is removed.

# Arguments
- `entitlement_arn`: The ARN of the entitlement that you want to revoke.
- `flow_arn`: The flow that you want to revoke an entitlement from.

"""
function revoke_flow_entitlement(entitlementArn, flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_flow(flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts a flow.

# Arguments
- `flow_arn`: The ARN of the flow that you want to start.

"""
function start_flow(flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/start/$(flowArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_flow(flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a flow.

# Arguments
- `flow_arn`: The ARN of the flow that you want to stop.

"""
function stop_flow(flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/v1/flows/stop/$(flowArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates the specified tags to a resource with the specified resourceArn. If existing
tags on a resource are not specified in the request parameters, they are not changed. When
a resource is deleted, the tags associated with that resource are deleted as well.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental
  MediaConnect resource to which to add tags.
- `tags`: A map from tag keys to values. Tag keys can have a maximum character length of
  128 characters, and tag values can have a maximum length of 256 characters.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes specified tags from a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental
  MediaConnect resource from which to delete tags.
- `tag_keys`: The keys of the tags to be removed.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow(flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates flow

# Arguments
- `flow_arn`: The flow that you want to update.

# Keyword Parameters
- `source_failover_config`:
"""
function update_flow(flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("PUT", "/v1/flows/$(flowArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow_entitlement(entitlement_arn, flow_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

You can change an entitlement's description, subscribers, and encryption. If you change the
subscribers, the service will remove the outputs that are are used by the subscribers that
are removed.

# Arguments
- `entitlement_arn`: The ARN of the entitlement that you want to update.
- `flow_arn`: The flow that is associated with the entitlement that you want to update.

# Keyword Parameters
- `description`: A description of the entitlement. This description appears only on the AWS
  Elemental MediaConnect console and will not be seen by the subscriber or end user.
- `encryption`: The type of encryption that will be used on the output associated with this
  entitlement.
- `entitlement_status`: An indication of whether you want to enable the entitlement to
  allow access, or disable it to stop streaming content to the subscriber’s flow
  temporarily. If you don’t specify the entitlementStatus field in your request,
  MediaConnect leaves the value unchanged.
- `subscribers`: The AWS account IDs that you want to share your content with. The
  receiving accounts (subscribers) will be allowed to create their own flow using your
  content as the source.
"""
function update_flow_entitlement(entitlementArn, flowArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("PUT", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow_media_stream(flow_arn, media_stream_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an existing media stream.

# Arguments
- `flow_arn`: The Amazon Resource Name (ARN) of the flow.
- `media_stream_name`: The name of the media stream that you want to update.

# Keyword Parameters
- `attributes`: The attributes that you want to assign to the media stream.
- `clock_rate`: The sample rate (in Hz) for the stream. If the media stream type is video
  or ancillary data, set this value to 90000. If the media stream type is audio, set this
  value to either 48000 or 96000.
- `description`: Description
- `media_stream_type`: The type of media stream.
- `video_format`: The resolution of the video.
"""
function update_flow_media_stream(flowArn, mediaStreamName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("PUT", "/v1/flows/$(flowArn)/mediaStreams/$(mediaStreamName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow_output(flow_arn, output_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an existing flow output.

# Arguments
- `flow_arn`: The flow that is associated with the output that you want to update.
- `output_arn`: The ARN of the output that you want to update.

# Keyword Parameters
- `cidr_allow_list`: The range of IP addresses that should be allowed to initiate output
  requests to this flow. These IP addresses should be in the form of a Classless Inter-Domain
  Routing (CIDR) block; for example, 10.0.0.0/16.
- `description`: A description of the output. This description appears only on the AWS
  Elemental MediaConnect console and will not be seen by the end user.
- `destination`: The IP address where you want to send the output.
- `encryption`: The type of key used for the encryption. If no keyType is provided, the
  service will use the default setting (static-key).
- `max_latency`: The maximum latency in milliseconds for Zixi-based streams.
- `media_stream_output_configurations`: The media streams that are associated with the
  output, and the parameters for those associations.
- `min_latency`: The minimum latency in milliseconds for SRT-based streams. In streams that
  use the SRT protocol, this value that you set on your MediaConnect source or output
  represents the minimal potential latency of that connection. The latency of the stream is
  set to the highest number between the sender’s minimum latency and the receiver’s
  minimum latency.
- `port`: The port to use when content is distributed to this output.
- `protocol`: The protocol to use for the output.
- `remote_id`: The remote ID for the Zixi-pull stream.
- `smoothing_latency`: The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC
  streams.
- `stream_id`: The stream ID that you want to use for this transport. This parameter
  applies only to Zixi-based streams.
- `vpc_interface_attachment`: The name of the VPC interface attachment to use for this
  output.
"""
function update_flow_output(flowArn, outputArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("PUT", "/v1/flows/$(flowArn)/outputs/$(outputArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow_source(flow_arn, source_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the source of a flow.

# Arguments
- `flow_arn`: The flow that is associated with the source that you want to update.
- `source_arn`: The ARN of the source that you want to update.

# Keyword Parameters
- `decryption`: The type of encryption used on the content ingested from this source.
- `description`: A description for the source. This value is not used or seen outside of
  the current AWS Elemental MediaConnect account.
- `entitlement_arn`: The ARN of the entitlement that allows you to subscribe to this flow.
  The entitlement is set by the flow originator, and the ARN is generated as part of the
  originator's flow.
- `ingest_port`: The port that the flow will be listening on for incoming content.
- `max_bitrate`: The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
- `max_latency`: The maximum latency in milliseconds. This parameter applies only to
  RIST-based and Zixi-based streams.
- `max_sync_buffer`: The size of the buffer (in milliseconds) to use to sync incoming
  source data.
- `media_stream_source_configurations`: The media streams that are associated with the
  source, and the parameters for those associations.
- `min_latency`: The minimum latency in milliseconds for SRT-based streams. In streams that
  use the SRT protocol, this value that you set on your MediaConnect source or output
  represents the minimal potential latency of that connection. The latency of the stream is
  set to the highest number between the sender’s minimum latency and the receiver’s
  minimum latency.
- `protocol`: The protocol that is used by the source.
- `stream_id`: The stream ID that you want to use for this transport. This parameter
  applies only to Zixi-based streams.
- `vpc_interface_name`: The name of the VPC interface to use for this source.
- `whitelist_cidr`: The range of IP addresses that should be allowed to contribute content
  to your source. These IP addresses should be in the form of a Classless Inter-Domain
  Routing (CIDR) block; for example, 10.0.0.0/16.
"""
function update_flow_source(flowArn, sourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mediaconnect("PUT", "/v1/flows/$(flowArn)/source/$(sourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
