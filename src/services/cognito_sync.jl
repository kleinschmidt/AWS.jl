# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: cognito_sync
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("last_sync_count" => "lastSyncCount", "max_results" => "maxResults", "next_token" => "nextToken", "sync_session_token" => "syncSessionToken", "cognito_streams" => "CognitoStreams", "push_sync" => "PushSync", "client_context" => "x-amz-Client-Context", "device_id" => "DeviceId", "record_patches" => "RecordPatches")

"""
    bulk_publish(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Initiates a bulk publish of all existing datasets for an Identity Pool to the configured
stream. Customers are limited to one successful bulk publish per 24 hours. Bulk publish is
an asynchronous request, customers can see the status of the request via the
GetBulkPublishDetails operation.This API can only be called with developer credentials. You
cannot call this API with the temporary user credentials provided by Cognito Identity.

# Arguments
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function bulk_publish(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/bulkpublish", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_dataset(dataset_name, identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specific dataset. The dataset will be deleted permanently, and the action can't
be undone. Datasets that this dataset was merged with will no longer report the merge. Any
subsequent operation on this dataset will result in a ResourceNotFoundException. This API
can be called with temporary user credentials provided by Cognito Identity or with
developer credentials.

# Arguments
- `dataset_name`: A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  '_' (underscore), '-' (dash), and '.' (dot).
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function delete_dataset(DatasetName, IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("DELETE", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_dataset(dataset_name, identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets meta data about a dataset by identity and dataset name. With Amazon Cognito Sync, each
identity has access only to its own data. Thus, the credentials used to make this API call
need to have access to the identity data. This API can be called with temporary user
credentials provided by Cognito Identity or with developer credentials. You should use
Cognito Identity credentials to make this API call.

# Arguments
- `dataset_name`: A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  '_' (underscore), '-' (dash), and '.' (dot).
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function describe_dataset(DatasetName, IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_identity_pool_usage(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets usage details (for example, data storage) about a particular identity pool. This API
can only be called with developer credentials. You cannot call this API with the temporary
user credentials provided by Cognito Identity.

# Arguments
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function describe_identity_pool_usage(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_identity_usage(identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets usage information for an identity, including number of datasets and data usage. This
API can be called with temporary user credentials provided by Cognito Identity or with
developer credentials.

# Arguments
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function describe_identity_usage(IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_bulk_publish_details(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get the status of the last BulkPublish operation for an identity pool.This API can only be
called with developer credentials. You cannot call this API with the temporary user
credentials provided by Cognito Identity.

# Arguments
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

"""
function get_bulk_publish_details(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/getBulkPublishDetails", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_cognito_events(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the events and the corresponding Lambda functions associated with an identity
pool.This API can only be called with developer credentials. You cannot call this API with
the temporary user credentials provided by Cognito Identity.

# Arguments
- `identity_pool_id`: The Cognito Identity Pool ID for the request

"""
function get_cognito_events(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/events", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_identity_pool_configuration(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the configuration settings of an identity pool.This API can only be called with
developer credentials. You cannot call this API with the temporary user credentials
provided by Cognito Identity.

# Arguments
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. This is the ID
  of the pool for which to return a configuration.

"""
function get_identity_pool_configuration(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/configuration", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_datasets(identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists datasets for an identity. With Amazon Cognito Sync, each identity has access only to
its own data. Thus, the credentials used to make this API call need to have access to the
identity data. ListDatasets can be called with temporary user credentials provided by
Cognito Identity or with developer credentials. You should use the Cognito Identity
credentials to make this API call.

# Arguments
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

# Keyword Parameters
- `max_results`: The maximum number of results to be returned.
- `next_token`: A pagination token for obtaining the next page of results.
"""
function list_datasets(IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_identity_pool_usage(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of identity pools registered with Cognito. ListIdentityPoolUsage can only be
called with developer credentials. You cannot make this API call with the temporary user
credentials provided by Cognito Identity.

# Keyword Parameters
- `max_results`: The maximum number of results to be returned.
- `next_token`: A pagination token for obtaining the next page of results.
"""
function list_identity_pool_usage(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_records(dataset_name, identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets paginated records, optionally changed after a particular sync count for a dataset and
identity. With Amazon Cognito Sync, each identity has access only to its own data. Thus,
the credentials used to make this API call need to have access to the identity data.
ListRecords can be called with temporary user credentials provided by Cognito Identity or
with developer credentials. You should use Cognito Identity credentials to make this API
call.

# Arguments
- `dataset_name`: A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  '_' (underscore), '-' (dash), and '.' (dot).
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.

# Keyword Parameters
- `last_sync_count`: The last server sync count for this record.
- `max_results`: The maximum number of results to be returned.
- `next_token`: A pagination token for obtaining the next page of results.
- `sync_session_token`: A token containing a session ID, identity ID, and expiration.
"""
function list_records(DatasetName, IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("GET", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)/records", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    register_device(identity_id, identity_pool_id, platform, token; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Registers a device to receive push sync notifications.This API can only be called with
temporary credentials provided by Cognito Identity. You cannot call this API with developer
credentials.

# Arguments
- `identity_id`: The unique ID for this identity.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. Here, the ID of
  the pool that the identity belongs to.
- `platform`: The SNS platform type (e.g. GCM, SDM, APNS, APNS_SANDBOX).
- `token`: The push token.

"""
function register_device(IdentityId, IdentityPoolId, Platform, Token; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/identity/$(IdentityId)/device", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Platform"=>Platform, "Token"=>Token), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_cognito_events(events, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sets the AWS Lambda function for a given event type for an identity pool. This request only
updates the key/value pair specified. Other key/values pairs are not updated. To remove a
key value pair, pass a empty value for the particular key.This API can only be called with
developer credentials. You cannot call this API with the temporary user credentials
provided by Cognito Identity.

# Arguments
- `events`: The events to configure
- `identity_pool_id`: The Cognito Identity Pool to use when configuring Cognito Events

"""
function set_cognito_events(Events, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/events", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Events"=>Events), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_identity_pool_configuration(identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sets the necessary configuration for push sync.This API can only be called with developer
credentials. You cannot call this API with the temporary user credentials provided by
Cognito Identity.

# Arguments
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. This is the ID
  of the pool to modify.

# Keyword Parameters
- `cognito_streams`: Options to apply to this identity pool for Amazon Cognito streams.
- `push_sync`: Options to apply to this identity pool for push synchronization.
"""
function set_identity_pool_configuration(IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/configuration", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    subscribe_to_dataset(dataset_name, device_id, identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Subscribes to receive notifications when a dataset is modified by another device.This API
can only be called with temporary credentials provided by Cognito Identity. You cannot call
this API with developer credentials.

# Arguments
- `dataset_name`: The name of the dataset to subcribe to.
- `device_id`: The unique ID generated for this device by Cognito.
- `identity_id`: Unique ID for this identity.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. The ID of the
  pool to which the identity belongs.

"""
function subscribe_to_dataset(DatasetName, DeviceId, IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)/subscriptions/$(DeviceId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    unsubscribe_from_dataset(dataset_name, device_id, identity_id, identity_pool_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Unsubscribes from receiving notifications when a dataset is modified by another device.This
API can only be called with temporary credentials provided by Cognito Identity. You cannot
call this API with developer credentials.

# Arguments
- `dataset_name`: The name of the dataset from which to unsubcribe.
- `device_id`: The unique ID generated for this device by Cognito.
- `identity_id`: Unique ID for this identity.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. The ID of the
  pool to which this identity belongs.

"""
function unsubscribe_from_dataset(DatasetName, DeviceId, IdentityId, IdentityPoolId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("DELETE", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)/subscriptions/$(DeviceId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_records(dataset_name, identity_id, identity_pool_id, sync_session_token; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Posts updates to records and adds and deletes records for a dataset and user. The sync
count in the record patch is your last known sync count for that record. The server will
reject an UpdateRecords request with a ResourceConflictException if you try to patch a
record with a new value but a stale sync count.For example, if the sync count on the server
is 5 for a key called highScore and you try and submit a new highScore with sync count of
4, the request will be rejected. To obtain the current sync count for a record, call
ListRecords. On a successful update of the record, the response returns the new sync count
for that record. You should present that sync count the next time you try to update that
same record. When the record does not exist, specify the sync count as 0. This API can be
called with temporary user credentials provided by Cognito Identity or with developer
credentials.

# Arguments
- `dataset_name`: A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  '_' (underscore), '-' (dash), and '.' (dot).
- `identity_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `identity_pool_id`: A name-spaced GUID (for example,
  us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation
  is unique within a region.
- `sync_session_token`: The SyncSessionToken returned by a previous call to ListRecords for
  this dataset and identity.

# Keyword Parameters
- `client_context`: Intended to supply a device ID that will populate the lastModifiedBy
  field referenced in other methods. The ClientContext field is not yet implemented.
- `device_id`: The unique ID generated for this device by Cognito.
- `record_patches`: A list of patch operations.
"""
function update_records(DatasetName, IdentityId, IdentityPoolId, SyncSessionToken; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return cognito_sync("POST", "/identitypools/$(IdentityPoolId)/identities/$(IdentityId)/datasets/$(DatasetName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SyncSessionToken"=>SyncSessionToken), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
