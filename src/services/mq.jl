# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mq
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("authentication_strategy" => "authenticationStrategy", "auto_minor_version_upgrade" => "autoMinorVersionUpgrade", "configuration" => "configuration", "engine_version" => "engineVersion", "host_instance_type" => "hostInstanceType", "ldap_server_metadata" => "ldapServerMetadata", "logs" => "logs", "maintenance_window_start_time" => "maintenanceWindowStartTime", "security_groups" => "securityGroups", "console_access" => "consoleAccess", "groups" => "groups", "engine_type" => "engineType", "max_results" => "maxResults", "next_token" => "nextToken", "password" => "password", "tags" => "tags", "storage_type" => "storageType", "description" => "description", "creator_request_id" => "creatorRequestId", "encryption_options" => "encryptionOptions", "subnet_ids" => "subnetIds")

"""
    create_broker(auto_minor_version_upgrade, broker_name, deployment_mode, engine_type, engine_version, host_instance_type, publicly_accessible, users; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a broker. Note: This API is asynchronous. To create a broker, you must either use
the AmazonMQFullAccess IAM policy or include the following EC2 permissions in your IAM
policy. ec2:CreateNetworkInterface This permission is required to allow Amazon MQ to create
an elastic network interface (ENI) on behalf of your account.
ec2:CreateNetworkInterfacePermission This permission is required to attach the ENI to the
broker instance. ec2:DeleteNetworkInterface ec2:DeleteNetworkInterfacePermission
ec2:DetachNetworkInterface ec2:DescribeInternetGateways ec2:DescribeNetworkInterfaces
ec2:DescribeNetworkInterfacePermissions ec2:DescribeRouteTables ec2:DescribeSecurityGroups
ec2:DescribeSubnets ec2:DescribeVpcs For more information, see Create an IAM User and Get
Your AWS Credentials and Never Modify or Delete the Amazon MQ Elastic Network Interface in
the Amazon MQ Developer Guide.

# Arguments
- `auto_minor_version_upgrade`: Enables automatic upgrades to new minor versions for
  brokers, as new versions are released and supported by Amazon MQ. Automatic upgrades occur
  during the scheduled maintenance window of the broker or after a manual broker reboot. Set
  to true by default, if no value is specified.
- `broker_name`: Required. The broker's name. This value must be unique in your AWS
  account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores,
  and must not contain white spaces, brackets, wildcard characters, or special characters.
- `deployment_mode`: Required. The broker's deployment mode.
- `engine_type`: Required. The type of broker engine. Currently, Amazon MQ supports
  ACTIVEMQ and RABBITMQ.
- `engine_version`: Required. The broker engine's version. For a list of supported engine
  versions, see Supported engines.
- `host_instance_type`: Required. The broker's instance type.
- `publicly_accessible`: Enables connections from applications outside of the VPC that
  hosts the broker's subnets. Set to false by default, if no value is provided.
- `users`: Required. The list of broker users (persons or applications) who can access
  queues and topics. This value can contain only alphanumeric characters, dashes, periods,
  underscores, and tildes (- . _ ~). This value must be 2-100 characters long. Amazon MQ for
  RabbitMQ When you create an Amazon MQ for RabbitMQ broker, one and only one administrative
  user is accepted and created when a broker is first provisioned. All subsequent broker
  users are created by making RabbitMQ API calls directly to brokers or via the RabbitMQ web
  console.

# Keyword Parameters
- `authentication_strategy`: Optional. The authentication strategy used to secure the
  broker. The default is SIMPLE.
- `configuration`: A list of information about the configuration.
- `creator_request_id`: The unique ID that the requester receives for the created broker.
  Amazon MQ passes your ID with the API action. Note: We recommend using a Universally Unique
  Identifier (UUID) for the creatorRequestId. You may omit the creatorRequestId if your
  application doesn't require idempotency.
- `encryption_options`: Encryption options for the broker. Does not apply to RabbitMQ
  brokers.
- `ldap_server_metadata`: Optional. The metadata of the LDAP server used to authenticate
  and authorize connections to the broker. Does not apply to RabbitMQ brokers.
- `logs`: Enables Amazon CloudWatch logging for brokers.
- `maintenance_window_start_time`: The parameters that determine the WeeklyStartTime.
- `security_groups`: The list of rules (1 minimum, 125 maximum) that authorize connections
  to brokers.
- `storage_type`: The broker's storage type.
- `subnet_ids`: The list of groups that define which subnets and IP ranges the broker can
  use from different Availability Zones. If you specify more than one subnet, the subnets
  must be in different Availability Zones. Amazon MQ will not be able to create VPC endpoints
  for your broker with multiple subnets in the same Availability Zone. A SINGLE_INSTANCE
  deployment requires one subnet (for example, the default subnet). An
  ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires two subnets. A
  CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no subnet requirements when deployed
  with public accessibility. Deployment without public accessibility requires at least one
  subnet. If you specify subnets in a shared VPC for a RabbitMQ broker, the associated VPC to
  which the specified subnets belong must be owned by your AWS account. Amazon MQ will not be
  able to create VPC endpoints in VPCs that are not owned by your AWS account.
- `tags`: Create tags when creating the broker.
"""
function create_broker(autoMinorVersionUpgrade, brokerName, deploymentMode, engineType, engineVersion, hostInstanceType, publiclyAccessible, users; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("POST", "/v1/brokers", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("autoMinorVersionUpgrade"=>autoMinorVersionUpgrade, "brokerName"=>brokerName, "deploymentMode"=>deploymentMode, "engineType"=>engineType, "engineVersion"=>engineVersion, "hostInstanceType"=>hostInstanceType, "publiclyAccessible"=>publiclyAccessible, "users"=>users, "creator_request_id"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_configuration(engine_type, engine_version, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new configuration for the specified configuration name. Amazon MQ uses the
default configuration (the engine type and version).

# Arguments
- `engine_type`: Required. The type of broker engine. Currently, Amazon MQ supports
  ACTIVEMQ and RABBITMQ.
- `engine_version`: Required. The broker engine's version. For a list of supported engine
  versions, see Supported engines.
- `name`: Required. The name of the configuration. This value can contain only alphanumeric
  characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150
  characters long.

# Keyword Parameters
- `authentication_strategy`: Optional. The authentication strategy associated with the
  configuration. The default is SIMPLE.
- `tags`: Create tags when creating the configuration.
"""
function create_configuration(engineType, engineVersion, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("POST", "/v1/configurations", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("engineType"=>engineType, "engineVersion"=>engineVersion, "name"=>name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_tags(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Add a tag to a resource.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.

# Keyword Parameters
- `tags`: The key-value pair for the resource tag.
"""
function create_tags(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("POST", "/v1/tags/$(resource-arn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_user(broker-id, password, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an ActiveMQ user.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `password`: Required. The password of the user. This value must be at least 12 characters
  long, must contain at least 4 unique characters, and must not contain commas, colons, or
  equal signs (,:=).
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric
  characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100
  characters long.

# Keyword Parameters
- `console_access`: Enables access to the ActiveMQ Web Console for the ActiveMQ user.
- `groups`: The list of groups (20 maximum) to which the ActiveMQ user belongs. This value
  can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  ~). This value must be 2-100 characters long.
"""
function create_user(broker_id, password, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("POST", "/v1/brokers/$(broker-id)/users/$(username)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("password"=>password), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_broker(broker-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a broker. Note: This API is asynchronous.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

"""
function delete_broker(broker_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("DELETE", "/v1/brokers/$(broker-id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_tags(resource-arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a tag from a resource.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.
- `tag_keys`: An array of tag keys to delete

"""
function delete_tags(resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("DELETE", "/v1/tags/$(resource-arn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_user(broker-id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an ActiveMQ user.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric
  characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100
  characters long.

"""
function delete_user(broker_id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("DELETE", "/v1/brokers/$(broker-id)/users/$(username)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_broker(broker-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the specified broker.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

"""
function describe_broker(broker_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/brokers/$(broker-id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_broker_engine_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describe available engine types and versions.

# Keyword Parameters
- `engine_type`: Filter response by engine type.
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
"""
function describe_broker_engine_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/broker-engine-types", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_broker_instance_options(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describe available broker instance options.

# Keyword Parameters
- `engine_type`: Filter response by engine type.
- `host_instance_type`: Filter response by host instance type.
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
- `storage_type`: Filter response by storage type.
"""
function describe_broker_instance_options(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/broker-instance-options", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_configuration(configuration-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the specified configuration.

# Arguments
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.

"""
function describe_configuration(configuration_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/configurations/$(configuration-id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_configuration_revision(configuration-id, configuration-revision; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the specified configuration revision for the specified configuration.

# Arguments
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.
- `configuration-revision`: The revision of the configuration.

"""
function describe_configuration_revision(configuration_id, configuration_revision; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/configurations/$(configuration-id)/revisions/$(configuration-revision)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_user(broker-id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about an ActiveMQ user.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric
  characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100
  characters long.

"""
function describe_user(broker_id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/brokers/$(broker-id)/users/$(username)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_brokers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of all brokers.

# Keyword Parameters
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
"""
function list_brokers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/brokers", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_configuration_revisions(configuration-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of all revisions for the specified configuration.

# Arguments
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.

# Keyword Parameters
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
"""
function list_configuration_revisions(configuration_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/configurations/$(configuration-id)/revisions", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_configurations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of all configurations.

# Keyword Parameters
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
"""
function list_configurations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/configurations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists tags for a resource.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.

"""
function list_tags(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/tags/$(resource-arn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_users(broker-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of all ActiveMQ users.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

# Keyword Parameters
- `max_results`: The maximum number of brokers that Amazon MQ can return per page (20 by
  default). This value must be an integer from 5 to 100.
- `next_token`: The token that specifies the next page of results Amazon MQ should return.
  To request the first page, leave nextToken empty.
"""
function list_users(broker_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("GET", "/v1/brokers/$(broker-id)/users", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    reboot_broker(broker-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Reboots a broker. Note: This API is asynchronous.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

"""
function reboot_broker(broker_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("POST", "/v1/brokers/$(broker-id)/reboot", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_broker(broker-id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds a pending configuration change to a broker.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

# Keyword Parameters
- `authentication_strategy`: Optional. The authentication strategy used to secure the
  broker. The default is SIMPLE.
- `auto_minor_version_upgrade`: Enables automatic upgrades to new minor versions for
  brokers, as new versions are released and supported by Amazon MQ. Automatic upgrades occur
  during the scheduled maintenance window of the broker or after a manual broker reboot.
- `configuration`: A list of information about the configuration.
- `engine_version`: The broker engine version. For a list of supported engine versions, see
  Supported engines.
- `host_instance_type`: The broker's host instance type to upgrade to. For a list of
  supported instance types, see Broker instance types.
- `ldap_server_metadata`: Optional. The metadata of the LDAP server used to authenticate
  and authorize connections to the broker. Does not apply to RabbitMQ brokers.
- `logs`: Enables Amazon CloudWatch logging for brokers.
- `maintenance_window_start_time`: The parameters that determine the WeeklyStartTime.
- `security_groups`: The list of security groups (1 minimum, 5 maximum) that authorizes
  connections to brokers.
"""
function update_broker(broker_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("PUT", "/v1/brokers/$(broker-id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_configuration(configuration-id, data; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the specified configuration.

# Arguments
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.
- `data`: Required. The base64-encoded XML configuration.

# Keyword Parameters
- `description`: The description of the configuration.
"""
function update_configuration(configuration_id, data; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("PUT", "/v1/configurations/$(configuration-id)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("data"=>data), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_user(broker-id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the information for an ActiveMQ user.

# Arguments
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric
  characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100
  characters long.

# Keyword Parameters
- `console_access`: Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
- `groups`: The list of groups (20 maximum) to which the ActiveMQ user belongs. This value
  can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  ~). This value must be 2-100 characters long.
- `password`: The password of the user. This value must be at least 12 characters long,
  must contain at least 4 unique characters, and must not contain commas, colons, or equal
  signs (,:=).
"""
function update_user(broker_id, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return mq("PUT", "/v1/brokers/$(broker-id)/users/$(username)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
