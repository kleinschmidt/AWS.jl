# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: timestream_query
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("max_results" => "MaxResults", "next_token" => "NextToken", "client_token" => "ClientToken", "max_rows" => "MaxRows", "validate_only" => "ValidateOnly", "kms_key_id" => "KmsKeyId", "tags" => "Tags", "target_configuration" => "TargetConfiguration")

"""
    cancel_query(query_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Cancels a query that has been issued. Cancellation is provided only if the query has not
completed running before the cancellation request was issued. Because cancellation is an
idempotent operation, subsequent cancellation requests will return a CancellationMessage,
indicating that the query has already been canceled. See code sample for details.

# Arguments
- `query_id`:  The ID of the query that needs to be cancelled. QueryID is returned as part
  of the query result.

"""
function cancel_query(QueryId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("CancelQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("QueryId"=>QueryId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_scheduled_query(error_report_configuration, name, notification_configuration, query_string, schedule_configuration, scheduled_query_execution_role_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Create a scheduled query that will be run on your behalf at the configured schedule.
Timestream assumes the execution role provided as part of the
ScheduledQueryExecutionRoleArn parameter to run the query. You can use the
NotificationConfiguration parameter to configure notification for your scheduled query
operations.

# Arguments
- `error_report_configuration`: Configuration for error reporting. Error reports will be
  generated when a problem is encountered when writing the query results.
- `name`: Name of the scheduled query.
- `notification_configuration`: Notification configuration for the scheduled query. A
  notification is sent by Timestream when a query run finishes, when the state is updated or
  when you delete it.
- `query_string`: The query string to run. Parameter names can be specified in the query
  string @ character followed by an identifier. The named Parameter @scheduled_runtime is
  reserved and can be used in the query to get the time at which the query is scheduled to
  run. The timestamp calculated according to the ScheduleConfiguration parameter, will be the
  value of @scheduled_runtime paramater for each query run. For example, consider an instance
  of a scheduled query executing on 2021-12-01 00:00:00. For this instance, the
  @scheduled_runtime parameter is initialized to the timestamp 2021-12-01 00:00:00 when
  invoking the query.
- `schedule_configuration`: The schedule configuration for the query.
- `scheduled_query_execution_role_arn`: The ARN for the IAM role that Timestream will
  assume when running the scheduled query.

# Keyword Parameters
- `client_token`: Using a ClientToken makes the call to CreateScheduledQuery idempotent, in
  other words, making the same request repeatedly will produce the same result. Making
  multiple identical CreateScheduledQuery requests has the same effect as making a single
  request.     If CreateScheduledQuery is called without a ClientToken, the Query SDK
  generates a ClientToken on your behalf.    After 8 hours, any request with the same
  ClientToken is treated as a new request.
- `kms_key_id`: The Amazon KMS key used to encrypt the scheduled query resource, at-rest.
  If the Amazon KMS key is not specified, the scheduled query resource will be encrypted with
  a Timestream owned Amazon KMS key. To specify a KMS key, use the key ID, key ARN, alias
  name, or alias ARN. When using an alias name, prefix the name with alias/  If
  ErrorReportConfiguration uses SSE_KMS as encryption type, the same KmsKeyId is used to
  encrypt the error report at rest.
- `tags`: A list of key-value pairs to label the scheduled query.
- `target_configuration`: Configuration used for writing the result of a query.
"""
function create_scheduled_query(ErrorReportConfiguration, Name, NotificationConfiguration, QueryString, ScheduleConfiguration, ScheduledQueryExecutionRoleArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("CreateScheduledQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ErrorReportConfiguration"=>ErrorReportConfiguration, "Name"=>Name, "NotificationConfiguration"=>NotificationConfiguration, "QueryString"=>QueryString, "ScheduleConfiguration"=>ScheduleConfiguration, "ScheduledQueryExecutionRoleArn"=>ScheduledQueryExecutionRoleArn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_scheduled_query(scheduled_query_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a given scheduled query. This is an irreversible operation.

# Arguments
- `scheduled_query_arn`: The ARN of the scheduled query.

"""
function delete_scheduled_query(ScheduledQueryArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("DeleteScheduledQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ScheduledQueryArn"=>ScheduledQueryArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_endpoints(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

DescribeEndpoints returns a list of available endpoints to make Timestream API calls
against. This API is available through both Write and Query. Because the Timestream SDKs
are designed to transparently work with the service’s architecture, including the
management and mapping of the service endpoints, it is not recommended that you use this
API unless:   You are using VPC endpoints (Amazon Web Services PrivateLink) with Timestream
    Your application uses a programming language that does not yet have SDK support   You
require better control over the client-side implementation   For detailed information on
how and when to use and implement DescribeEndpoints, see The Endpoint Discovery Pattern.

"""
function describe_endpoints(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("DescribeEndpoints", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_scheduled_query(scheduled_query_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides detailed information about a scheduled query.

# Arguments
- `scheduled_query_arn`: The ARN of the scheduled query.

"""
function describe_scheduled_query(ScheduledQueryArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("DescribeScheduledQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ScheduledQueryArn"=>ScheduledQueryArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    execute_scheduled_query(invocation_time, scheduled_query_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 You can use this API to run a scheduled query manually.

# Arguments
- `invocation_time`: The timestamp in UTC. Query will be run as if it was invoked at this
  timestamp.
- `scheduled_query_arn`: ARN of the scheduled query.

# Keyword Parameters
- `client_token`: Not used.
"""
function execute_scheduled_query(InvocationTime, ScheduledQueryArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("ExecuteScheduledQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InvocationTime"=>InvocationTime, "ScheduledQueryArn"=>ScheduledQueryArn, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_scheduled_queries(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of all scheduled queries in the caller's Amazon account and Region.
ListScheduledQueries is eventually consistent.

# Keyword Parameters
- `max_results`: The maximum number of items to return in the output. If the total number
  of items available is more than the value specified, a NextToken is provided in the output.
  To resume pagination, provide the NextToken value as the argument to the subsequent call to
  ListScheduledQueriesRequest.
- `next_token`:  A pagination token to resume pagination.
"""
function list_scheduled_queries(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("ListScheduledQueries", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all tags on a Timestream query resource.

# Arguments
- `resource_arn`: The Timestream resource with tags to be listed. This value is an Amazon
  Resource Name (ARN).

# Keyword Parameters
- `max_results`: The maximum number of tags to return.
- `next_token`: A pagination token to resume pagination.
"""
function list_tags_for_resource(ResourceARN; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    prepare_query(query_string; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

A synchronous operation that allows you to submit a query with parameters to be stored by
Timestream for later running. Timestream only supports using this operation with the
PrepareQueryRequestValidateOnly set to true.

# Arguments
- `query_string`: The Timestream query string that you want to use as a prepared statement.
  Parameter names can be specified in the query string @ character followed by an identifier.

# Keyword Parameters
- `validate_only`: By setting this value to true, Timestream will only validate that the
  query string is a valid Timestream query, and not store the prepared query for later use.
"""
function prepare_query(QueryString; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("PrepareQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("QueryString"=>QueryString), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    query(query_string; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Query is a synchronous operation that enables you to run a query against your Amazon
Timestream data. Query will time out after 60 seconds. You must update the default timeout
in the SDK to support a timeout of 60 seconds. See the code sample for details.  Your query
request will fail in the following cases:    If you submit a Query request with the same
client token outside of the 5-minute idempotency window.     If you submit a Query request
with the same client token, but change other parameters, within the 5-minute idempotency
window.     If the size of the row (including the query metadata) exceeds 1 MB, then the
query will fail with the following error message:   Query aborted as max page response size
has been exceeded by the output result row     If the IAM principal of the query initiator
and the result reader are not the same and/or the query initiator and the result reader do
not have the same query string in the query requests, the query will fail with an Invalid
pagination token error.

# Arguments
- `query_string`:  The query to be run by Timestream.

# Keyword Parameters
- `client_token`:  Unique, case-sensitive string of up to 64 ASCII characters specified
  when a Query request is made. Providing a ClientToken makes the call to Query idempotent.
  This means that running the same query repeatedly will produce the same result. In other
  words, making multiple identical Query requests has the same effect as making a single
  request. When using ClientToken in a query, note the following:     If the Query API is
  instantiated without a ClientToken, the Query SDK generates a ClientToken on your behalf.
  If the Query invocation only contains the ClientToken but does not include a NextToken,
  that invocation of Query is assumed to be a new query run.   If the invocation contains
  NextToken, that particular invocation is assumed to be a subsequent invocation of a prior
  call to the Query API, and a result set is returned.    After 4 hours, any request with the
  same ClientToken is treated as a new request.
- `max_rows`:  The total number of rows to be returned in the Query output. The initial run
  of Query with a MaxRows value specified will return the result set of the query in two
  cases:    The size of the result is less than 1MB.   The number of rows in the result set
  is less than the value of maxRows.   Otherwise, the initial invocation of Query only
  returns a NextToken, which can then be used in subsequent calls to fetch the result set. To
  resume pagination, provide the NextToken value in the subsequent command. If the row size
  is large (e.g. a row has many columns), Timestream may return fewer rows to keep the
  response size from exceeding the 1 MB limit. If MaxRows is not provided, Timestream will
  send the necessary number of rows to meet the 1 MB limit.
- `next_token`:  A pagination token used to return a set of results. When the Query API is
  invoked using NextToken, that particular invocation is assumed to be a subsequent
  invocation of a prior call to Query, and a result set is returned. However, if the Query
  invocation only contains the ClientToken, that invocation of Query is assumed to be a new
  query run.  Note the following when using NextToken in a query:   A pagination token can be
  used for up to five Query invocations, OR for a duration of up to 1 hour – whichever
  comes first.   Using the same NextToken will return the same set of records. To keep
  paginating through the result set, you must to use the most recent nextToken.   Suppose a
  Query invocation returns two NextToken values, TokenA and TokenB. If TokenB is used in a
  subsequent Query invocation, then TokenA is invalidated and cannot be reused.   To request
  a previous result set from a query after pagination has begun, you must re-invoke the Query
  API.   The latest NextToken should be used to paginate until null is returned, at which
  point a new NextToken should be used.    If the IAM principal of the query initiator and
  the result reader are not the same and/or the query initiator and the result reader do not
  have the same query string in the query requests, the query will fail with an Invalid
  pagination token error.
"""
function query(QueryString; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("Query", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("QueryString"=>QueryString, "client_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associate a set of tags with a Timestream resource. You can then activate these
user-defined tags so that they appear on the Billing and Cost Management console for cost
allocation tracking.

# Arguments
- `resource_arn`: Identifies the Timestream resource to which tags should be added. This
  value is an Amazon Resource Name (ARN).
- `tags`: The tags to be assigned to the Timestream resource.

"""
function tag_resource(ResourceARN, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN, "Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the association of tags from a Timestream query resource.

# Arguments
- `resource_arn`: The Timestream resource that the tags will be removed from. This value is
  an Amazon Resource Name (ARN).
- `tag_keys`: A list of tags keys. Existing tags of the resource whose keys are members of
  this list will be removed from the Timestream resource.

"""
function untag_resource(ResourceARN, TagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN, "TagKeys"=>TagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_scheduled_query(scheduled_query_arn, state; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update a scheduled query.

# Arguments
- `scheduled_query_arn`: ARN of the scheuled query.
- `state`: State of the scheduled query.

"""
function update_scheduled_query(ScheduledQueryArn, State; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return timestream_query("UpdateScheduledQuery", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ScheduledQueryArn"=>ScheduledQueryArn, "State"=>State), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
