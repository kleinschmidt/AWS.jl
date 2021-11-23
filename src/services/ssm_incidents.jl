# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ssm_incidents
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("client_token" => "clientToken", "actions" => "actions", "chat_channel" => "chatChannel", "display_name" => "displayName", "engagements" => "engagements", "tags" => "tags", "impact" => "impact", "notification_targets" => "notificationTargets", "status" => "status", "summary" => "summary", "title" => "title", "max_results" => "maxResults", "next_token" => "nextToken", "event_data" => "eventData", "event_time" => "eventTime", "event_type" => "eventType", "filters" => "filters", "sort_by" => "sortBy", "sort_order" => "sortOrder", "related_items" => "relatedItems", "trigger_details" => "triggerDetails", "incident_template_dedupe_string" => "incidentTemplateDedupeString", "incident_template_impact" => "incidentTemplateImpact", "incident_template_notification_targets" => "incidentTemplateNotificationTargets", "incident_template_summary" => "incidentTemplateSummary", "incident_template_title" => "incidentTemplateTitle")

"""
    create_replication_set(regions; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

A replication set replicates and encrypts your data to the provided Regions with the
provided KMS key.

# Arguments
- `regions`: The Regions that Incident Manager replicates your data to. You can have up to
  three Regions in your replication set.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
"""
function create_replication_set(regions; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/createReplicationSet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("regions"=>regions, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_response_plan(incident_template, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a response plan that automates the initial response to incidents. A response plan
engages contacts, starts chat channel collaboration, and initiates runbooks at the
beginning of an incident.

# Arguments
- `incident_template`: Details used to create an incident when using this response plan.
- `name`: The short format name of the response plan. Can't include spaces.

# Keyword Parameters
- `actions`: The actions that the response plan starts at the beginning of an incident.
- `chat_channel`: The Chatbot chat channel used for collaboration during an incident.
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
- `display_name`: The long format of the response plan name. This field can contain spaces.
- `engagements`: The contacts and escalation plans that the response plan engages during an
  incident.
- `tags`: A list of tags that you are adding to the response plan.
"""
function create_response_plan(incidentTemplate, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/createResponsePlan", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("incidentTemplate"=>incidentTemplate, "name"=>name, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_timeline_event(event_data, event_time, event_type, incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a custom timeline event on the incident details page of an incident record.
Timeline events are automatically created by Incident Manager, marking key moment during an
incident. You can create custom timeline events to mark important events that are
automatically detected by Incident Manager.

# Arguments
- `event_data`: A short description of the event as a valid JSON string. There is no other
  schema imposed.
- `event_time`: The time that the event occurred.
- `event_type`: The type of the event. You can create timeline events of type Custom Event.
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident record to which the
  event will be added.

# Keyword Parameters
- `client_token`: A token ensuring that the action is called only once with the specified
  details.
"""
function create_timeline_event(eventData, eventTime, eventType, incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/createTimelineEvent", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventData"=>eventData, "eventTime"=>eventTime, "eventType"=>eventType, "incidentRecordArn"=>incidentRecordArn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete an incident record from Incident Manager.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the incident record you are deleting.

"""
function delete_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/deleteIncidentRecord", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_replication_set(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes all Regions in your replication set. Deleting the replication set deletes all
Incident Manager data.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the replication set you're deleting.

"""
function delete_replication_set(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/deleteReplicationSet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_resource_policy(policy_id, resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the resource policy that Resource Access Manager uses to share your Incident
Manager resource.

# Arguments
- `policy_id`: The ID of the resource policy you're deleting.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource you're deleting the policy
  from.

"""
function delete_resource_policy(policyId, resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/deleteResourcePolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("policyId"=>policyId, "resourceArn"=>resourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified response plan. Deleting a response plan stops all linked CloudWatch
alarms and EventBridge events from creating an incident with this response plan.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the response plan.

"""
function delete_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/deleteResponsePlan", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_timeline_event(event_id, incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a timeline event from an incident.

# Arguments
- `event_id`: The ID of the event you are updating. You can find this by using
  ListTimelineEvents.
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident that includes the
  timeline event.

"""
function delete_timeline_event(eventId, incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/deleteTimelineEvent", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventId"=>eventId, "incidentRecordArn"=>incidentRecordArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the details for the specified incident record.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the incident record.

"""
function get_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("GET", "/getIncidentRecord", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_replication_set(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieve your Incident Manager replication set.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the replication set you want to retrieve.

"""
function get_replication_set(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("GET", "/getReplicationSet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_policies(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the resource policies attached to the specified response plan.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the response plan with the attached
  resource policy.

# Keyword Parameters
- `max_results`: The maximum number of resource policies to display per page of results.
- `next_token`: The pagination token to continue to the next page of results.
"""
function get_resource_policies(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/getResourcePolicies", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceArn"=>resourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the details of the specified response plan.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the response plan.

"""
function get_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("GET", "/getResponsePlan", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_timeline_event(event_id, incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a timeline event based on its ID and incident record.

# Arguments
- `event_id`: The ID of the event. You can get an event's ID when you create it, or by
  using ListTimelineEvents.
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident that includes the
  timeline event.

"""
function get_timeline_event(eventId, incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("GET", "/getTimelineEvent", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventId"=>eventId, "incidentRecordArn"=>incidentRecordArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_incident_records(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all incident records in your account. Use this command to retrieve the Amazon
Resource Name (ARN) of the incident record you want to update.

# Keyword Parameters
- `filters`: Filters the list of incident records through which you are searching. You can
  filter on the following keys:    creationTime     impact     status     createdBy    Note
  the following when deciding how to use Filters:   If you don't specify a Filter, the
  response includes all incident records.   If you specify more than one filter in a single
  request, the response returns incident records that match all filters.   If you specify a
  filter with more than one value, the response returns incident records that match any of
  the values provided.
- `max_results`: The maximum number of results per page.
- `next_token`: The pagination token to continue to the next page of results.
"""
function list_incident_records(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/listIncidentRecords", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_related_items(incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all related items for an incident record.

# Arguments
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident record containing
  the listed related items.

# Keyword Parameters
- `max_results`: The maximum number of related items per page.
- `next_token`: The pagination token to continue to the next page of results.
"""
function list_related_items(incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/listRelatedItems", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("incidentRecordArn"=>incidentRecordArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_replication_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists details about the replication set configured in your account.

# Keyword Parameters
- `max_results`: The maximum number of results per page.
- `next_token`: The pagination token to continue to the next page of results.
"""
function list_replication_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/listReplicationSets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_response_plans(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all response plans in your account.

# Keyword Parameters
- `max_results`: The maximum number of response plans per page.
- `next_token`: The pagination token to continue to the next page of results.
"""
function list_response_plans(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/listResponsePlans", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the tags that are attached to the specified response plan.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the response plan.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_timeline_events(incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists timeline events for the specified incident record.

# Arguments
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident that includes the
  timeline event.

# Keyword Parameters
- `filters`: Filters the timeline events based on the provided conditional values. You can
  filter timeline events using the following keys:    eventTime     eventType    Note the
  following when deciding how to use Filters:   If you don't specify a Filter, the response
  includes all timeline events.   If you specify more than one filter in a single request,
  the response returns timeline events that match all filters.   If you specify a filter with
  more than one value, the response returns timeline events that match any of the values
  provided.
- `max_results`: The maximum number of results per page.
- `next_token`: The pagination token to continue to the next page of results.
- `sort_by`: Sort by the specified key value pair.
- `sort_order`: Sorts the order of timeline events by the value specified in the sortBy
  field.
"""
function list_timeline_events(incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/listTimelineEvents", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("incidentRecordArn"=>incidentRecordArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_resource_policy(policy, resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds a resource policy to the specified response plan.

# Arguments
- `policy`: Details of the resource policy.
- `resource_arn`: The Amazon Resource Name (ARN) of the response plan you're adding the
  resource policy to.

"""
function put_resource_policy(policy, resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/putResourcePolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("policy"=>policy, "resourceArn"=>resourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_incident(response_plan_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Used to start an incident from CloudWatch alarms, EventBridge events, or manually.

# Arguments
- `response_plan_arn`: The Amazon Resource Name (ARN) of the response plan that pre-defines
  summary, chat channels, Amazon SNS topics, runbooks, title, and impact of the incident.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
- `impact`: Defines the impact to the customers. Providing an impact overwrites the impact
  provided by a response plan.  Possible impacts:     1 - Critical impact, this typically
  relates to full application failure that impacts many to all customers.     2 - High
  impact, partial application failure with impact to many customers.    3 - Medium impact,
  the application is providing reduced service to customers.    4 - Low impact, customer
  might aren't impacted by the problem yet.    5 - No impact, customers aren't currently
  impacted but urgent action is needed to avoid impact.
- `related_items`: Add related items to the incident for other responders to use. Related
  items are AWS resources, external links, or files uploaded to an Amazon S3 bucket.
- `title`: Provide a title for the incident. Providing a title overwrites the title
  provided by the response plan.
- `trigger_details`: Details of what created the incident record in Incident Manager.
"""
function start_incident(responsePlanArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/startIncident", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("responsePlanArn"=>responsePlanArn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds a tag to a response plan.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the response plan you're adding the
  tags to.
- `tags`: A list of tags that you are adding to the response plan.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a tag from a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the response plan you're removing a tag
  from.
- `tag_keys`: The name of the tag you're removing from the response plan.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_deletion_protection(arn, deletion_protected; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update deletion protection to either allow or deny deletion of the final Region in a
replication set.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the replication set you're updating.
- `deletion_protected`: Details if deletion protection is enabled or disabled in your
  account.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
"""
function update_deletion_protection(arn, deletionProtected; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateDeletionProtection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn, "deletionProtected"=>deletionProtected, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update the details of an incident record. You can use this operation to update an incident
record from the defined chat channel. For more information about using actions in chat
channels, see Interacting through chat.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the incident record you are updating.

# Keyword Parameters
- `chat_channel`: The Chatbot chat channel where responders can collaborate.
- `client_token`: A token that ensures that the operation is called only once with the
  specified details.
- `impact`: Defines the impact of the incident to customers and applications. Providing an
  impact overwrites the impact provided by the response plan.  Possible impacts:     1 -
  Critical impact, full application failure that impacts many to all customers.     2 - High
  impact, partial application failure with impact to many customers.    3 - Medium impact,
  the application is providing reduced service to customers.    4 - Low impact, customer
  aren't impacted by the problem yet.    5 - No impact, customers aren't currently impacted
  but urgent action is needed to avoid impact.
- `notification_targets`: The Amazon SNS targets that are notified when updates are made to
  an incident. Using multiple SNS topics creates redundancy in the event that a Region is
  down during the incident.
- `status`: The status of the incident. An incident can be Open or Resolved.
- `summary`: A longer description of what occurred during the incident.
- `title`: A brief description of the incident.
"""
function update_incident_record(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateIncidentRecord", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_related_items(incident_record_arn, related_items_update; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Add or remove related items from the related items tab of an incident record.

# Arguments
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident record containing
  the related items you are updating.
- `related_items_update`: Details about the item you are adding or deleting.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
"""
function update_related_items(incidentRecordArn, relatedItemsUpdate; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateRelatedItems", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("incidentRecordArn"=>incidentRecordArn, "relatedItemsUpdate"=>relatedItemsUpdate, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_replication_set(actions, arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Add or delete Regions from your replication set.

# Arguments
- `actions`: An action to add or delete a Region.
- `arn`: The Amazon Resource Name (ARN) of the replication set you're updating.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
"""
function update_replication_set(actions, arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateReplicationSet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("actions"=>actions, "arn"=>arn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the specified response plan.

# Arguments
- `arn`: The Amazon Resource Name (ARN) of the response plan.

# Keyword Parameters
- `actions`: The actions that this response plan takes at the beginning of an incident.
- `chat_channel`: The Chatbot chat channel used for collaboration during an incident. Use
  the empty structure to remove the chat channel from the response plan.
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
- `display_name`: The long format name of the response plan. The display name can't contain
  spaces.
- `engagements`: The contacts and escalation plans that Incident Manager engages at the
  start of the incident.
- `incident_template_dedupe_string`: The string Incident Manager uses to prevent duplicate
  incidents from being created by the same incident in the same account.
- `incident_template_impact`: Defines the impact to the customers. Providing an impact
  overwrites the impact provided by a response plan.  Possible impacts:     5 - Severe impact
     4 - High impact    3 - Medium impact    2 - Low impact    1 - No impact
- `incident_template_notification_targets`: The Amazon SNS targets that are notified when
  updates are made to an incident.
- `incident_template_summary`: A brief summary of the incident. This typically contains
  what has happened, what's currently happening, and next steps.
- `incident_template_title`: The short format name of the incident. The title can't contain
  spaces.
"""
function update_response_plan(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateResponsePlan", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_timeline_event(event_id, incident_record_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a timeline event. You can update events of type Custom Event.

# Arguments
- `event_id`: The ID of the event you are updating. You can find this by using
  ListTimelineEvents.
- `incident_record_arn`: The Amazon Resource Name (ARN) of the incident that includes the
  timeline event.

# Keyword Parameters
- `client_token`: A token ensuring that the operation is called only once with the
  specified details.
- `event_data`: A short description of the event.
- `event_time`: The time that the event occurred.
- `event_type`: The type of the event. You can update events of type Custom Event.
"""
function update_timeline_event(eventId, incidentRecordArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return ssm_incidents("POST", "/updateTimelineEvent", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventId"=>eventId, "incidentRecordArn"=>incidentRecordArn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
