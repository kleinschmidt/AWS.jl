# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: appconfig
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("description" => "Description", "latest_version_number" => "Latest-Version-Number", "final_bake_time_in_minutes" => "FinalBakeTimeInMinutes", "growth_type" => "GrowthType", "tags" => "Tags", "deployment_duration_in_minutes" => "DeploymentDurationInMinutes", "growth_factor" => "GrowthFactor", "monitors" => "Monitors", "max_results" => "max_results", "next_token" => "next_token", "name" => "Name", "client_configuration_version" => "client_configuration_version", "retrieval_role_arn" => "RetrievalRoleArn", "type" => "type", "validators" => "Validators")

"""
    create_application(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an application. An application in AppConfig is a logical unit of code that provides
capabilities for your customers. For example, an application can be a microservice that
runs on Amazon EC2 instances, a mobile application installed by your users, a serverless
application using Amazon API Gateway and Lambda, or any system you run on behalf of others.

# Arguments
- `name`: A name for the application.

# Keyword Parameters
- `description`: A description of the application.
- `tags`: Metadata to assign to the application. Tags help organize and categorize your
  AppConfig resources. Each tag consists of a key and an optional value, both of which you
  define.
"""
function create_application(Name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_configuration_profile(application_id, location_uri, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a configuration profile, which is information that enables AppConfig to access the
configuration source. Valid configuration sources include the AppConfig hosted
configuration store, Amazon Web Services Systems Manager (SSM) documents, SSM Parameter
Store parameters, Amazon S3 objects, or any integration source action supported by
CodePipeline. A configuration profile includes the following information:   The URI
location of the configuration data.   The Identity and Access Management (IAM) role that
provides access to the configuration data.   A validator for the configuration data.
Available validators include either a JSON Schema or an Lambda function.   For more
information, see Create a Configuration and a Configuration Profile in the AppConfig User
Guide.

# Arguments
- `application_id`: The application ID.
- `location_uri`: A URI to locate the configuration. You can specify the AppConfig hosted
  configuration store, Systems Manager (SSM) document, an SSM Parameter Store parameter, or
  an Amazon S3 object. For the hosted configuration store and for feature flags, specify
  hosted. For an SSM document, specify either the document name in the format
  ssm-document://&lt;Document_name&gt; or the Amazon Resource Name (ARN). For a parameter,
  specify either the parameter name in the format ssm-parameter://&lt;Parameter_name&gt; or
  the ARN. For an Amazon S3 object, specify the URI in the following format:
  s3://&lt;bucket&gt;/&lt;objectKey&gt; . Here is an example:
  s3://my-bucket/my-app/us-east-1/my-config.json
- `name`: A name for the configuration profile.

# Keyword Parameters
- `description`: A description of the configuration profile.
- `retrieval_role_arn`: The ARN of an IAM role with permission to access the configuration
  at the specified LocationUri.  A retrieval role ARN is not required for configurations
  stored in the AppConfig hosted configuration store. It is required for all other sources
  that store your configuration.
- `tags`: Metadata to assign to the configuration profile. Tags help organize and
  categorize your AppConfig resources. Each tag consists of a key and an optional value, both
  of which you define.
- `type`: The type of configurations that the configuration profile contains. A
  configuration can be a feature flag used for enabling or disabling new features or a
  free-form configuration used for distributing configurations to your application.
- `validators`: A list of methods for validating the configuration.
"""
function create_configuration_profile(ApplicationId, LocationUri, Name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications/$(ApplicationId)/configurationprofiles", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LocationUri"=>LocationUri, "Name"=>Name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_deployment_strategy(deployment_duration_in_minutes, growth_factor, name, replicate_to; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a deployment strategy that defines important criteria for rolling out your
configuration to the designated targets. A deployment strategy includes the overall
duration required, a percentage of targets to receive the deployment during each interval,
an algorithm that defines how percentage grows, and bake time.

# Arguments
- `deployment_duration_in_minutes`: Total amount of time for a deployment to last.
- `growth_factor`: The percentage of targets to receive a deployed configuration during
  each interval.
- `name`: A name for the deployment strategy.
- `replicate_to`: Save the deployment strategy to a Systems Manager (SSM) document.

# Keyword Parameters
- `description`: A description of the deployment strategy.
- `final_bake_time_in_minutes`: The amount of time AppConfig monitors for alarms before
  considering the deployment to be complete and no longer eligible for automatic roll back.
- `growth_type`: The algorithm used to define how percentage grows over time. AppConfig
  supports the following growth types:  Linear: For this type, AppConfig processes the
  deployment by dividing the total number of targets by the value specified for Step
  percentage. For example, a linear deployment that uses a Step percentage of 10 deploys the
  configuration to 10 percent of the hosts. After those deployments are complete, the system
  deploys the configuration to the next 10 percent. This continues until 100% of the targets
  have successfully received the configuration.  Exponential: For this type, AppConfig
  processes the deployment exponentially using the following formula: G*(2^N). In this
  formula, G is the growth factor specified by the user and N is the number of steps until
  the configuration is deployed to all targets. For example, if you specify a growth factor
  of 2, then the system rolls out the configuration as follows:  2*(2^0)   2*(2^1)   2*(2^2)
  Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the
  targets, 8% of the targets, and continues until the configuration has been deployed to all
  targets.
- `tags`: Metadata to assign to the deployment strategy. Tags help organize and categorize
  your AppConfig resources. Each tag consists of a key and an optional value, both of which
  you define.
"""
function create_deployment_strategy(DeploymentDurationInMinutes, GrowthFactor, Name, ReplicateTo; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/deploymentstrategies", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DeploymentDurationInMinutes"=>DeploymentDurationInMinutes, "GrowthFactor"=>GrowthFactor, "Name"=>Name, "ReplicateTo"=>ReplicateTo), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_environment(application_id, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an environment. For each application, you define one or more environments. An
environment is a logical deployment group of AppConfig targets, such as applications in a
Beta or Production environment. You can also define environments for application
subcomponents such as the Web, Mobile and Back-end components for your application. You can
configure Amazon CloudWatch alarms for each environment. The system monitors alarms during
a configuration deployment. If an alarm is triggered, the system rolls back the
configuration.

# Arguments
- `application_id`: The application ID.
- `name`: A name for the environment.

# Keyword Parameters
- `description`: A description of the environment.
- `monitors`: Amazon CloudWatch alarms to monitor during the deployment process.
- `tags`: Metadata to assign to the environment. Tags help organize and categorize your
  AppConfig resources. Each tag consists of a key and an optional value, both of which you
  define.
"""
function create_environment(ApplicationId, Name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications/$(ApplicationId)/environments", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_hosted_configuration_version(application_id, configuration_profile_id, content, content-_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new configuration in the AppConfig hosted configuration store.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.
- `content`: The content of the configuration or the configuration data.
- `content-_type`: A standard MIME type describing the format of the configuration content.
  For more information, see Content-Type.

# Keyword Parameters
- `description`: A description of the configuration.
- `latest_version_number`: An optional locking token used to prevent race conditions from
  overwriting configuration updates when creating a new version. To ensure your data is not
  overwritten when creating multiple hosted configuration versions in rapid succession,
  specify the version number of the latest hosted configuration version.
"""
function create_hosted_configuration_version(ApplicationId, ConfigurationProfileId, Content, Content_Type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)/hostedconfigurationversions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Content"=>Content, "headers"=>Dict{String, Any}("Content-Type"=>Content_Type)), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_application(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an application. Deleting an application does not delete a configuration from a host.

# Arguments
- `application_id`: The ID of the application to delete.

"""
function delete_application(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/applications/$(ApplicationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_configuration_profile(application_id, configuration_profile_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a configuration profile. Deleting a configuration profile does not delete a
configuration from a host.

# Arguments
- `application_id`: The application ID that includes the configuration profile you want to
  delete.
- `configuration_profile_id`: The ID of the configuration profile you want to delete.

"""
function delete_configuration_profile(ApplicationId, ConfigurationProfileId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_deployment_strategy(deployment_strategy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a deployment strategy. Deleting a deployment strategy does not delete a
configuration from a host.

# Arguments
- `deployment_strategy_id`: The ID of the deployment strategy you want to delete.

"""
function delete_deployment_strategy(DeploymentStrategyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/deployementstrategies/$(DeploymentStrategyId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_environment(application_id, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an environment. Deleting an environment does not delete a configuration from a host.

# Arguments
- `application_id`: The application ID that includes the environment that you want to
  delete.
- `environment_id`: The ID of the environment that you want to delete.

"""
function delete_environment(ApplicationId, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/applications/$(ApplicationId)/environments/$(EnvironmentId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_hosted_configuration_version(application_id, configuration_profile_id, version_number; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a version of a configuration from the AppConfig hosted configuration store.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.
- `version_number`: The versions number to delete.

"""
function delete_hosted_configuration_version(ApplicationId, ConfigurationProfileId, VersionNumber; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)/hostedconfigurationversions/$(VersionNumber)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_application(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about an application.

# Arguments
- `application_id`: The ID of the application you want to get.

"""
function get_application(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_configuration(application, configuration, environment, client_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a configuration.  AppConfig uses the value of the
ClientConfigurationVersion parameter to identify the configuration version on your clients.
If you don’t send ClientConfigurationVersion with each call to GetConfiguration, your
clients receive the current configuration. You are charged each time your clients receive a
configuration. To avoid excess charges, we recommend that you include the
ClientConfigurationVersion value with every call to GetConfiguration. This value must be
saved on your client. Subsequent calls to GetConfiguration must pass this value by using
the ClientConfigurationVersion parameter.

# Arguments
- `application`: The application to get. Specify either the application name or the
  application ID.
- `configuration`: The configuration to get. Specify either the configuration name or the
  configuration ID.
- `environment`: The environment to get. Specify either the environment name or the
  environment ID.
- `client_id`: The clientId parameter in the following command is a unique, user-specified
  ID to identify the client for the configuration. This ID enables AppConfig to deploy the
  configuration in intervals, as defined in the deployment strategy.

# Keyword Parameters
- `client_configuration_version`: The configuration version returned in the most recent
  GetConfiguration response.  AppConfig uses the value of the ClientConfigurationVersion
  parameter to identify the configuration version on your clients. If you don’t send
  ClientConfigurationVersion with each call to GetConfiguration, your clients receive the
  current configuration. You are charged each time your clients receive a configuration. To
  avoid excess charges, we recommend that you include the ClientConfigurationVersion value
  with every call to GetConfiguration. This value must be saved on your client. Subsequent
  calls to GetConfiguration must pass this value by using the ClientConfigurationVersion
  parameter.   For more information about working with configurations, see Retrieving the
  Configuration in the AppConfig User Guide.
"""
function get_configuration(Application, Configuration, Environment, client_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(Application)/environments/$(Environment)/configurations/$(Configuration)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("client_id"=>client_id), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_configuration_profile(application_id, configuration_profile_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a configuration profile.

# Arguments
- `application_id`: The ID of the application that includes the configuration profile you
  want to get.
- `configuration_profile_id`: The ID of the configuration profile that you want to get.

"""
function get_configuration_profile(ApplicationId, ConfigurationProfileId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_deployment(application_id, deployment_number, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a configuration deployment.

# Arguments
- `application_id`: The ID of the application that includes the deployment you want to get.
- `deployment_number`: The sequence number of the deployment.
- `environment_id`: The ID of the environment that includes the deployment you want to get.

"""
function get_deployment(ApplicationId, DeploymentNumber, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/environments/$(EnvironmentId)/deployments/$(DeploymentNumber)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_deployment_strategy(deployment_strategy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a deployment strategy. A deployment strategy defines important
criteria for rolling out your configuration to the designated targets. A deployment
strategy includes the overall duration required, a percentage of targets to receive the
deployment during each interval, an algorithm that defines how percentage grows, and bake
time.

# Arguments
- `deployment_strategy_id`: The ID of the deployment strategy to get.

"""
function get_deployment_strategy(DeploymentStrategyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/deploymentstrategies/$(DeploymentStrategyId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_environment(application_id, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about an environment. An environment is a logical deployment group of
AppConfig applications, such as applications in a Production environment or in an EU_Region
environment. Each configuration deployment targets an environment. You can enable one or
more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a
deployment, AppConfig roles back the configuration.

# Arguments
- `application_id`: The ID of the application that includes the environment you want to get.
- `environment_id`: The ID of the environment that you want to get.

"""
function get_environment(ApplicationId, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/environments/$(EnvironmentId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_hosted_configuration_version(application_id, configuration_profile_id, version_number; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a specific configuration version.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.
- `version_number`: The version.

"""
function get_hosted_configuration_version(ApplicationId, ConfigurationProfileId, VersionNumber; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)/hostedconfigurationversions/$(VersionNumber)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_applications(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all applications in your Amazon Web Services account.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Next token is a pagination token generated by
  AppConfig to describe what page the previous List call ended on. For the first List
  request, the nextToken should not be set. On subsequent calls, the nextToken parameter
  should be set to the previous responses nextToken value. Use this token to get the next set
  of results.
"""
function list_applications(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_configuration_profiles(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the configuration profiles for an application.

# Arguments
- `application_id`: The application ID.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Use this token to get the next set of results.
- `type`: A filter based on the type of configurations that the configuration profile
  contains. A configuration can be a feature flag or a free-form configuration.
"""
function list_configuration_profiles(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/configurationprofiles", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_deployment_strategies(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists deployment strategies.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Use this token to get the next set of results.
"""
function list_deployment_strategies(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/deploymentstrategies", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_deployments(application_id, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the deployments for an environment.

# Arguments
- `application_id`: The application ID.
- `environment_id`: The environment ID.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Use this token to get the next set of results.
"""
function list_deployments(ApplicationId, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/environments/$(EnvironmentId)/deployments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_environments(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the environments for an application.

# Arguments
- `application_id`: The application ID.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Use this token to get the next set of results.
"""
function list_environments(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/environments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_hosted_configuration_versions(application_id, configuration_profile_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists configurations stored in the AppConfig hosted configuration store by version.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.

# Keyword Parameters
- `max_results`: The maximum number of items to return for this call. The call also returns
  a token that you can specify in a subsequent call to get the next set of results.
- `next_token`: A token to start the list. Use this token to get the next set of results.
"""
function list_hosted_configuration_versions(ApplicationId, ConfigurationProfileId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)/hostedconfigurationversions", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the list of key-value tags assigned to the resource.

# Arguments
- `resource_arn`: The resource ARN.

"""
function list_tags_for_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("GET", "/tags/$(ResourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_deployment(application_id, configuration_profile_id, configuration_version, deployment_strategy_id, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts a deployment.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.
- `configuration_version`: The configuration version to deploy.
- `deployment_strategy_id`: The deployment strategy ID.
- `environment_id`: The environment ID.

# Keyword Parameters
- `description`: A description of the deployment.
- `tags`: Metadata to assign to the deployment. Tags help organize and categorize your
  AppConfig resources. Each tag consists of a key and an optional value, both of which you
  define.
"""
function start_deployment(ApplicationId, ConfigurationProfileId, ConfigurationVersion, DeploymentStrategyId, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications/$(ApplicationId)/environments/$(EnvironmentId)/deployments", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConfigurationProfileId"=>ConfigurationProfileId, "ConfigurationVersion"=>ConfigurationVersion, "DeploymentStrategyId"=>DeploymentStrategyId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_deployment(application_id, deployment_number, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a deployment. This API action works only on deployments that have a status of
DEPLOYING. This action moves the deployment to a status of ROLLED_BACK.

# Arguments
- `application_id`: The application ID.
- `deployment_number`: The sequence number of the deployment.
- `environment_id`: The environment ID.

"""
function stop_deployment(ApplicationId, DeploymentNumber, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/applications/$(ApplicationId)/environments/$(EnvironmentId)/deployments/$(DeploymentNumber)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Assigns metadata to an AppConfig resource. Tags help organize and categorize your AppConfig
resources. Each tag consists of a key and an optional value, both of which you define. You
can specify a maximum of 50 tags for a resource.

# Arguments
- `resource_arn`: The ARN of the resource for which to retrieve tags.
- `tags`: The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key
  can be up to 128 characters and must not start with aws:. The tag value can be up to 256
  characters.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a tag key and value from an AppConfig resource.

# Arguments
- `resource_arn`: The ARN of the resource for which to remove tags.
- `tag_keys`: The tag keys to delete.

"""
function untag_resource(ResourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("DELETE", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_application(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an application.

# Arguments
- `application_id`: The application ID.

# Keyword Parameters
- `description`: A description of the application.
- `name`: The name of the application.
"""
function update_application(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("PATCH", "/applications/$(ApplicationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_configuration_profile(application_id, configuration_profile_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a configuration profile.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The ID of the configuration profile.

# Keyword Parameters
- `description`: A description of the configuration profile.
- `name`: The name of the configuration profile.
- `retrieval_role_arn`: The ARN of an IAM role with permission to access the configuration
  at the specified LocationUri.
- `validators`: A list of methods for validating the configuration.
"""
function update_configuration_profile(ApplicationId, ConfigurationProfileId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("PATCH", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_deployment_strategy(deployment_strategy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a deployment strategy.

# Arguments
- `deployment_strategy_id`: The deployment strategy ID.

# Keyword Parameters
- `deployment_duration_in_minutes`: Total amount of time for a deployment to last.
- `description`: A description of the deployment strategy.
- `final_bake_time_in_minutes`: The amount of time that AppConfig monitors for alarms
  before considering the deployment to be complete and no longer eligible for automatic
  rollback.
- `growth_factor`: The percentage of targets to receive a deployed configuration during
  each interval.
- `growth_type`: The algorithm used to define how percentage grows over time. AppConfig
  supports the following growth types:  Linear: For this type, AppConfig processes the
  deployment by increments of the growth factor evenly distributed over the deployment time.
  For example, a linear deployment that uses a growth factor of 20 initially makes the
  configuration available to 20 percent of the targets. After 1/5th of the deployment time
  has passed, the system updates the percentage to 40 percent. This continues until 100% of
  the targets are set to receive the deployed configuration.  Exponential: For this type,
  AppConfig processes the deployment exponentially using the following formula: G*(2^N). In
  this formula, G is the growth factor specified by the user and N is the number of steps
  until the configuration is deployed to all targets. For example, if you specify a growth
  factor of 2, then the system rolls out the configuration as follows:  2*(2^0)   2*(2^1)
  2*(2^2)  Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4%
  of the targets, 8% of the targets, and continues until the configuration has been deployed
  to all targets.
"""
function update_deployment_strategy(DeploymentStrategyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("PATCH", "/deploymentstrategies/$(DeploymentStrategyId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_environment(application_id, environment_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an environment.

# Arguments
- `application_id`: The application ID.
- `environment_id`: The environment ID.

# Keyword Parameters
- `description`: A description of the environment.
- `monitors`: Amazon CloudWatch alarms to monitor during the deployment process.
- `name`: The name of the environment.
"""
function update_environment(ApplicationId, EnvironmentId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("PATCH", "/applications/$(ApplicationId)/environments/$(EnvironmentId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    validate_configuration(application_id, configuration_profile_id, configuration_version; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Uses the validators in a configuration profile to validate a configuration.

# Arguments
- `application_id`: The application ID.
- `configuration_profile_id`: The configuration profile ID.
- `configuration_version`: The version of the configuration to validate.

"""
function validate_configuration(ApplicationId, ConfigurationProfileId, configuration_version; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return appconfig("POST", "/applications/$(ApplicationId)/configurationprofiles/$(ConfigurationProfileId)/validators", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("configuration_version"=>configuration_version), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
