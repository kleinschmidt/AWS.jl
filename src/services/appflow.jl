# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: appflow
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("force_delete" => "forceDelete", "kms_arn" => "kmsArn", "connector_profile_names" => "connectorProfileNames", "connector_type" => "connectorType", "max_results" => "maxResults", "next_token" => "nextToken", "description" => "description", "connector_profile_name" => "connectorProfileName", "entities_path" => "entitiesPath", "connector_types" => "connectorTypes", "tags" => "tags")

"""
    create_connector_profile(connection_mode, connector_profile_config, connector_profile_name, connector_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new connector profile associated with your Amazon Web Services account. There is
a soft quota of 100 connector profiles per Amazon Web Services account. If you need more
connector profiles than this quota allows, you can submit a request to the Amazon AppFlow
team through the Amazon AppFlow support channel.

# Arguments
- `connection_mode`:  Indicates the connection mode and specifies whether it is public or
  private. Private flows use Amazon Web Services PrivateLink to route data over Amazon Web
  Services infrastructure without exposing it to the public internet.
- `connector_profile_config`:  Defines the connector-specific configuration and
  credentials.
- `connector_profile_name`:  The name of the connector profile. The name is unique for each
  ConnectorProfile in your Amazon Web Services account.
- `connector_type`:  The type of connector, such as Salesforce, Amplitude, and so on.

# Keyword Parameters
- `kms_arn`:  The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  provide for encryption. This is required if you do not want to use the Amazon
  AppFlow-managed KMS key. If you don't provide anything here, Amazon AppFlow uses the Amazon
  AppFlow-managed KMS key.
"""
function create_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName, connectorType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/create-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName, "connectorType"=>connectorType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_flow(destination_flow_config_list, flow_name, source_flow_config, tasks, trigger_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Enables your application to create a new flow using Amazon AppFlow. You must create a
connector profile before calling this API. Please note that the Request Syntax below shows
syntax for multiple destinations, however, you can only transfer data to one item in this
list at a time. Amazon AppFlow does not currently support flows to multiple destinations at
once.

# Arguments
- `destination_flow_config_list`:  The configuration that controls how Amazon AppFlow
  places data in the destination connector.
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.
- `source_flow_config`:  The configuration that controls how Amazon AppFlow retrieves data
  from the source connector.
- `tasks`:  A list of tasks that Amazon AppFlow performs while transferring the data in the
  flow run.
- `trigger_config`:  The trigger settings that determine how and when the flow runs.

# Keyword Parameters
- `description`:  A description of the flow you want to create.
- `kms_arn`:  The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  provide for encryption. This is required if you do not want to use the Amazon
  AppFlow-managed KMS key. If you don't provide anything here, Amazon AppFlow uses the Amazon
  AppFlow-managed KMS key.
- `tags`:  The tags used to organize, track, or control access for your flow.
"""
function create_flow(destinationFlowConfigList, flowName, sourceFlowConfig, tasks, triggerConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/create-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "sourceFlowConfig"=>sourceFlowConfig, "tasks"=>tasks, "triggerConfig"=>triggerConfig), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_connector_profile(connector_profile_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Enables you to delete an existing connector profile.

# Arguments
- `connector_profile_name`:  The name of the connector profile. The name is unique for each
  ConnectorProfile in your account.

# Keyword Parameters
- `force_delete`:  Indicates whether Amazon AppFlow should delete the profile, even if it
  is currently in use in one or more flows.
"""
function delete_connector_profile(connectorProfileName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/delete-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectorProfileName"=>connectorProfileName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_flow(flow_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Enables your application to delete an existing flow. Before deleting the flow, Amazon
AppFlow validates the request by checking the flow configuration and status. You can delete
flows one at a time.

# Arguments
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.

# Keyword Parameters
- `force_delete`:  Indicates whether Amazon AppFlow should delete the flow, even if it is
  currently in use.
"""
function delete_flow(flowName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/delete-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_connector_entity(connector_entity_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Provides details regarding the entity used with the connector, with a description of the
data model for each entity.

# Arguments
- `connector_entity_name`:  The entity name for that connector.

# Keyword Parameters
- `connector_profile_name`:  The name of the connector profile. The name is unique for each
  ConnectorProfile in the Amazon Web Services account.
- `connector_type`:  The type of connector application, such as Salesforce, Amplitude, and
  so on.
"""
function describe_connector_entity(connectorEntityName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/describe-connector-entity", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectorEntityName"=>connectorEntityName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_connector_profiles(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of connector-profile details matching the provided connector-profile names
and connector-types. Both input lists are optional, and you can use them to filter the
result.  If no names or connector-types are provided, returns all connector profiles in a
paginated form. If there is no match, this operation returns an empty list.

# Keyword Parameters
- `connector_profile_names`:  The name of the connector profile. The name is unique for
  each ConnectorProfile in the Amazon Web Services account.
- `connector_type`:  The type of connector, such as Salesforce, Amplitude, and so on.
- `max_results`:  Specifies the maximum number of items that should be returned in the
  result set. The default for maxResults is 20 (for all paginated API operations).
- `next_token`:  The pagination token for the next page of data.
"""
function describe_connector_profiles(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/describe-connector-profiles", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_connectors(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Describes the connectors vended by Amazon AppFlow for specified connector types. If you
don't specify a connector type, this operation describes all connectors vended by Amazon
AppFlow. If there are more connectors than can be returned in one page, the response
contains a nextToken object, which can be be passed in to the next call to the
DescribeConnectors API operation to retrieve the next page.

# Keyword Parameters
- `connector_types`:  The type of connector, such as Salesforce, Amplitude, and so on.
- `next_token`:  The pagination token for the next page of data.
"""
function describe_connectors(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/describe-connectors", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_flow(flow_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Provides a description of the specified flow.

# Arguments
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.

"""
function describe_flow(flowName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/describe-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_flow_execution_records(flow_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Fetches the execution history of the flow.

# Arguments
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.

# Keyword Parameters
- `max_results`:  Specifies the maximum number of items that should be returned in the
  result set. The default for maxResults is 20 (for all paginated API operations).
- `next_token`:  The pagination token for the next page of data.
"""
function describe_flow_execution_records(flowName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/describe-flow-execution-records", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_connector_entities(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the list of available connector entities supported by Amazon AppFlow. For example,
you can query Salesforce for Account and Opportunity entities, or query ServiceNow for the
Incident entity.

# Keyword Parameters
- `connector_profile_name`:  The name of the connector profile. The name is unique for each
  ConnectorProfile in the Amazon Web Services account, and is used to query the downstream
  connector.
- `connector_type`:  The type of connector, such as Salesforce, Amplitude, and so on.
- `entities_path`:  This optional parameter is specific to connector implementation. Some
  connectors support multiple levels or categories of entities. You can find out the list of
  roots for such providers by sending a request without the entitiesPath parameter. If the
  connector supports entities at different roots, this initial request returns the list of
  roots. Otherwise, this request returns all entities supported by the provider.
"""
function list_connector_entities(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/list-connector-entities", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_flows(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Lists all of the flows associated with your account.

# Keyword Parameters
- `max_results`:  Specifies the maximum number of items that should be returned in the
  result set.
- `next_token`:  The pagination token for next page of data.
"""
function list_flows(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/list-flows", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Retrieves the tags that are associated with a specified flow.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the specified flow.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_flow(flow_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Activates an existing flow. For on-demand flows, this operation runs the flow immediately.
For schedule and event-triggered flows, this operation activates the flow.

# Arguments
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.

"""
function start_flow(flowName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/start-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_flow(flow_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deactivates the existing flow. For on-demand flows, this operation returns an
unsupportedOperationException error message. For schedule and event-triggered flows, this
operation deactivates the flow.

# Arguments
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.

"""
function stop_flow(flowName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/stop-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Applies a tag to the specified flow.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the flow that you want to tag.
- `tags`:  The tags used to organize, track, or control access for your flow.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Removes a tag from the specified flow.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the flow that you want to untag.
- `tag_keys`:  The tag keys associated with the tag that you want to remove from your flow.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_connector_profile(connection_mode, connector_profile_config, connector_profile_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates a given connector profile associated with your account.

# Arguments
- `connection_mode`:  Indicates the connection mode and if it is public or private.
- `connector_profile_config`:  Defines the connector-specific profile configuration and
  credentials.
- `connector_profile_name`:  The name of the connector profile and is unique for each
  ConnectorProfile in the Amazon Web Services account.

"""
function update_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/update-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_flow(destination_flow_config_list, flow_name, source_flow_config, tasks, trigger_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates an existing flow.

# Arguments
- `destination_flow_config_list`:  The configuration that controls how Amazon AppFlow
  transfers data to the destination connector.
- `flow_name`:  The specified name of the flow. Spaces are not allowed. Use underscores (_)
  or hyphens (-) only.
- `source_flow_config`:
- `tasks`:  A list of tasks that Amazon AppFlow performs while transferring the data in the
  flow run.
- `trigger_config`:  The trigger settings that determine how and when the flow runs.

# Keyword Parameters
- `description`:  A description of the flow.
"""
function update_flow(destinationFlowConfigList, flowName, sourceFlowConfig, tasks, triggerConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return appflow("POST", "/update-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "sourceFlowConfig"=>sourceFlowConfig, "tasks"=>tasks, "triggerConfig"=>triggerConfig), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
