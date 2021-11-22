# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: amplify
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("auto_sub_domain_creation_patterns" => "autoSubDomainCreationPatterns", "auto_sub_domain_iamrole" => "autoSubDomainIAMRole", "enable_auto_sub_domain" => "enableAutoSubDomain", "job_id" => "jobId", "source_url" => "sourceUrl", "file_map" => "fileMap", "commit_id" => "commitId", "commit_message" => "commitMessage", "commit_time" => "commitTime", "job_reason" => "jobReason", "max_results" => "maxResults", "next_token" => "nextToken", "backend_environment_arn" => "backendEnvironmentArn", "basic_auth_credentials" => "basicAuthCredentials", "build_spec" => "buildSpec", "description" => "description", "display_name" => "displayName", "enable_auto_build" => "enableAutoBuild", "enable_basic_auth" => "enableBasicAuth", "enable_notification" => "enableNotification", "enable_performance_mode" => "enablePerformanceMode", "enable_pull_request_preview" => "enablePullRequestPreview", "environment_variables" => "environmentVariables", "framework" => "framework", "pull_request_environment_name" => "pullRequestEnvironmentName", "stage" => "stage", "tags" => "tags", "ttl" => "ttl", "end_time" => "endTime", "start_time" => "startTime", "access_token" => "accessToken", "auto_branch_creation_config" => "autoBranchCreationConfig", "auto_branch_creation_patterns" => "autoBranchCreationPatterns", "custom_headers" => "customHeaders", "custom_rules" => "customRules", "enable_auto_branch_creation" => "enableAutoBranchCreation", "enable_branch_auto_build" => "enableBranchAutoBuild", "enable_branch_auto_deletion" => "enableBranchAutoDeletion", "iam_service_role_arn" => "iamServiceRoleArn", "name" => "name", "oauth_token" => "oauthToken", "platform" => "platform", "repository" => "repository", "deployment_artifacts" => "deploymentArtifacts", "stack_name" => "stackName", "branch_name" => "branchName", "environment_name" => "environmentName")

"""
    create_app(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new Amplify app.

# Arguments
- `name`:  The name for an Amplify app.

# Keyword Parameters
- `access_token`:  The personal access token for a third-party source control system for an
  Amplify app. The personal access token is used to create a webhook and a read-only deploy
  key. The token is not stored.
- `auto_branch_creation_config`:  The automated branch creation configuration for an
  Amplify app.
- `auto_branch_creation_patterns`:  The automated branch creation glob patterns for an
  Amplify app.
- `basic_auth_credentials`:  The credentials for basic authorization for an Amplify app.
- `build_spec`:  The build specification (build spec) for an Amplify app.
- `custom_headers`: The custom HTTP headers for an Amplify app.
- `custom_rules`:  The custom rewrite and redirect rules for an Amplify app.
- `description`:  The description for an Amplify app.
- `enable_auto_branch_creation`:  Enables automated branch creation for an Amplify app.
- `enable_basic_auth`:  Enables basic authorization for an Amplify app. This will apply to
  all branches that are part of this app.
- `enable_branch_auto_build`:  Enables the auto building of branches for an Amplify app.
- `enable_branch_auto_deletion`:  Automatically disconnects a branch in the Amplify Console
  when you delete a branch from your Git repository.
- `environment_variables`:  The environment variables map for an Amplify app.
- `iam_service_role_arn`:  The AWS Identity and Access Management (IAM) service role for an
  Amplify app.
- `oauth_token`:  The OAuth token for a third-party source control system for an Amplify
  app. The OAuth token is used to create a webhook and a read-only deploy key. The OAuth
  token is not stored.
- `platform`:  The platform or framework for an Amplify app.
- `repository`:  The repository for an Amplify app.
- `tags`:  The tag for an Amplify app.
"""
function create_app(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("name"=>name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_backend_environment(app_id, environment_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new backend environment for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `environment_name`:  The name for the backend environment.

# Keyword Parameters
- `deployment_artifacts`:  The name of deployment artifacts.
- `stack_name`:  The AWS CloudFormation stack name of a backend environment.
"""
function create_backend_environment(appId, environmentName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/backendenvironments", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("environmentName"=>environmentName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_branch(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new branch for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch.

# Keyword Parameters
- `backend_environment_arn`:  The Amazon Resource Name (ARN) for a backend environment that
  is part of an Amplify app.
- `basic_auth_credentials`:  The basic authorization credentials for the branch.
- `build_spec`:  The build specification (build spec) for the branch.
- `description`:  The description for the branch.
- `display_name`:  The display name for a branch. This is used as the default domain
  prefix.
- `enable_auto_build`:  Enables auto building for the branch.
- `enable_basic_auth`:  Enables basic authorization for the branch.
- `enable_notification`:  Enables notifications for the branch.
- `enable_performance_mode`: Enables performance mode for the branch. Performance mode
  optimizes for faster hosting performance by keeping content cached at the edge for a longer
  interval. When performance mode is enabled, hosting configuration or code changes can take
  up to 10 minutes to roll out.
- `enable_pull_request_preview`:  Enables pull request previews for this branch.
- `environment_variables`:  The environment variables for the branch.
- `framework`:  The framework for the branch.
- `pull_request_environment_name`:  The Amplify environment name for the pull request.
- `stage`:  Describes the current stage for the branch.
- `tags`:  The tag for the branch.
- `ttl`:  The content Time To Live (TTL) for the website in seconds.
"""
function create_branch(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/branches", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("branchName"=>branchName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_deployment(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a deployment for a manually deployed Amplify app. Manually deployed apps are not
connected to a repository.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch, for the job.

# Keyword Parameters
- `file_map`:  An optional file map that contains the file name as the key and the file
  content md5 hash as the value. If this argument is provided, the service will generate a
  unique upload URL per file. Otherwise, the service will only generate a single upload URL
  for the zipped files.
"""
function create_deployment(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/branches/$(branchName)/deployments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_domain_association(app_id, domain_name, sub_domain_settings; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new domain association for an Amplify app. This action associates a custom
domain with the Amplify app

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `domain_name`:  The domain name for the domain association.
- `sub_domain_settings`:  The setting for the subdomain.

# Keyword Parameters
- `auto_sub_domain_creation_patterns`:  Sets the branch patterns for automatic subdomain
  creation.
- `auto_sub_domain_iamrole`:  The required AWS Identity and Access Management (IAM) service
  role for the Amazon Resource Name (ARN) for automatically creating subdomains.
- `enable_auto_sub_domain`:  Enables the automated creation of subdomains for branches.
"""
function create_domain_association(appId, domainName, subDomainSettings; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/domains", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("domainName"=>domainName, "subDomainSettings"=>subDomainSettings), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_webhook(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new webhook on an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for a branch that is part of an Amplify app.

# Keyword Parameters
- `description`:  The description for a webhook.
"""
function create_webhook(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/webhooks", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("branchName"=>branchName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_app(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes an existing Amplify app specified by an app ID.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

"""
function delete_app(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_backend_environment(app_id, environment_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a backend environment for an Amplify app.

# Arguments
- `app_id`:  The unique ID of an Amplify app.
- `environment_name`:  The name of a backend environment of an Amplify app.

"""
function delete_backend_environment(appId, environmentName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)/backendenvironments/$(environmentName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_branch(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a branch for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch.

"""
function delete_branch(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)/branches/$(branchName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_domain_association(app_id, domain_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a domain association for an Amplify app.

# Arguments
- `app_id`:  The unique id for an Amplify app.
- `domain_name`:  The name of the domain.

"""
function delete_domain_association(appId, domainName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)/domains/$(domainName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_job(app_id, branch_name, job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a job for a branch of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch, for the job.
- `job_id`:  The unique ID for the job.

"""
function delete_job(appId, branchName, jobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)/branches/$(branchName)/jobs/$(jobId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_webhook(webhook_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a webhook.

# Arguments
- `webhook_id`:  The unique ID for a webhook.

"""
function delete_webhook(webhookId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/webhooks/$(webhookId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    generate_access_logs(app_id, domain_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the website access logs for a specific time range using a presigned URL.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `domain_name`:  The name of the domain.

# Keyword Parameters
- `end_time`:  The time at which the logs should end. The time range specified is inclusive
  of the end time.
- `start_time`:  The time at which the logs should start. The time range specified is
  inclusive of the start time.
"""
function generate_access_logs(appId, domainName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/accesslogs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("domainName"=>domainName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_app(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns an existing Amplify app by appID.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

"""
function get_app(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_artifact_url(artifact_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the artifact info that corresponds to an artifact id.

# Arguments
- `artifact_id`:  The unique ID for an artifact.

"""
function get_artifact_url(artifactId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/artifacts/$(artifactId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_backend_environment(app_id, environment_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a backend environment for an Amplify app.

# Arguments
- `app_id`:  The unique id for an Amplify app.
- `environment_name`:  The name for the backend environment.

"""
function get_backend_environment(appId, environmentName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/backendenvironments/$(environmentName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_branch(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a branch for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch.

"""
function get_branch(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/branches/$(branchName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_domain_association(app_id, domain_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the domain information for an Amplify app.

# Arguments
- `app_id`:  The unique id for an Amplify app.
- `domain_name`:  The name of the domain.

"""
function get_domain_association(appId, domainName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/domains/$(domainName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_job(app_id, branch_name, job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a job for a branch of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The branch name for the job.
- `job_id`:  The unique ID for the job.

"""
function get_job(appId, branchName, jobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/branches/$(branchName)/jobs/$(jobId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_webhook(webhook_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the webhook information that corresponds to a specified webhook ID.

# Arguments
- `webhook_id`:  The unique ID for a webhook.

"""
function get_webhook(webhookId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/webhooks/$(webhookId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_apps(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of the existing Amplify apps.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. If non-null, the pagination token is returned in a
  result. Pass its value in another request to retrieve more entries.
"""
function list_apps(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_artifacts(app_id, branch_name, job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of artifacts for a specified app, branch, and job.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name of a branch that is part of an Amplify app.
- `job_id`:  The unique ID for a job.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing artifacts from start. If
  a non-null pagination token is returned in a result, pass its value in here to list more
  artifacts.
"""
function list_artifacts(appId, branchName, jobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/branches/$(branchName)/jobs/$(jobId)/artifacts", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_backend_environments(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Lists the backend environments for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

# Keyword Parameters
- `environment_name`:  The name of the backend environment
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing backend environments from
  the start. If a non-null pagination token is returned in a result, pass its value in here
  to list more backend environments.
"""
function list_backend_environments(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/backendenvironments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_branches(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Lists the branches of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing branches from the start.
  If a non-null pagination token is returned in a result, pass its value in here to list more
  branches.
"""
function list_branches(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/branches", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_domain_associations(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the domain associations for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing apps from the start. If
  non-null, a pagination token is returned in a result. Pass its value in here to list more
  projects.
"""
function list_domain_associations(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/domains", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_jobs(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Lists the jobs for a branch of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for a branch.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing steps from the start. If
  a non-null pagination token is returned in a result, pass its value in here to list more
  steps.
"""
function list_jobs(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/branches/$(branchName)/jobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of tags for a specified Amazon Resource Name (ARN).

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) to use to list tags.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_webhooks(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of webhooks for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

# Keyword Parameters
- `max_results`:  The maximum number of records to list in a single response.
- `next_token`:  A pagination token. Set to null to start listing webhooks from the start.
  If non-null,the pagination token is returned in a result. Pass its value in here to list
  more webhooks.
"""
function list_webhooks(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("GET", "/apps/$(appId)/webhooks", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_deployment(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Starts a deployment for a manually deployed app. Manually deployed apps are not connected
to a repository.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch, for the job.

# Keyword Parameters
- `job_id`:  The job ID for this deployment, generated by the create deployment request.
- `source_url`:  The source URL for this deployment, used when calling start deployment
  without create deployment. The source URL can be any HTTP GET URL that is publicly
  accessible and downloads a single .zip file.
"""
function start_deployment(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/branches/$(branchName)/deployments/start", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_job(app_id, branch_name, job_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Starts a new job for a branch of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The branch name for the job.
- `job_type`:  Describes the type for the job. The job type RELEASE starts a new job with
  the latest change from the specified branch. This value is available only for apps that are
  connected to a repository. The job type RETRY retries an existing job. If the job type
  value is RETRY, the jobId is also required.

# Keyword Parameters
- `commit_id`:  The commit ID from a third-party repository provider for the job.
- `commit_message`:  The commit message from a third-party repository provider for the job.
- `commit_time`:  The commit date and time for the job.
- `job_id`:  The unique ID for an existing job. This is required if the value of jobType is
  RETRY.
- `job_reason`:  A descriptive reason for starting this job.
"""
function start_job(appId, branchName, jobType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/branches/$(branchName)/jobs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("jobType"=>jobType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_job(app_id, branch_name, job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Stops a job that is in progress for a branch of an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch, for the job.
- `job_id`:  The unique id for the job.

"""
function stop_job(appId, branchName, jobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/apps/$(appId)/branches/$(branchName)/jobs/$(jobId)/stop", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Tags the resource with a tag key and value.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) to use to tag a resource.
- `tags`:  The tags used to tag the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Untags a resource with a specified Amazon Resource Name (ARN).

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) to use to untag a resource.
- `tag_keys`:  The tag keys to use to untag a resource.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_app(app_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates an existing Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.

# Keyword Parameters
- `access_token`:  The personal access token for a third-party source control system for an
  Amplify app. The token is used to create webhook and a read-only deploy key. The token is
  not stored.
- `auto_branch_creation_config`:  The automated branch creation configuration for an
  Amplify app.
- `auto_branch_creation_patterns`:  Describes the automated branch creation glob patterns
  for an Amplify app.
- `basic_auth_credentials`:  The basic authorization credentials for an Amplify app.
- `build_spec`:  The build specification (build spec) for an Amplify app.
- `custom_headers`: The custom HTTP headers for an Amplify app.
- `custom_rules`:  The custom redirect and rewrite rules for an Amplify app.
- `description`:  The description for an Amplify app.
- `enable_auto_branch_creation`:  Enables automated branch creation for an Amplify app.
- `enable_basic_auth`:  Enables basic authorization for an Amplify app.
- `enable_branch_auto_build`:  Enables branch auto-building for an Amplify app.
- `enable_branch_auto_deletion`:  Automatically disconnects a branch in the Amplify Console
  when you delete a branch from your Git repository.
- `environment_variables`:  The environment variables for an Amplify app.
- `iam_service_role_arn`:  The AWS Identity and Access Management (IAM) service role for an
  Amplify app.
- `name`:  The name for an Amplify app.
- `oauth_token`:  The OAuth token for a third-party source control system for an Amplify
  app. The token is used to create a webhook and a read-only deploy key. The OAuth token is
  not stored.
- `platform`:  The platform for an Amplify app.
- `repository`:  The name of the repository for an Amplify app
"""
function update_app(appId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_branch(app_id, branch_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates a branch for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `branch_name`:  The name for the branch.

# Keyword Parameters
- `backend_environment_arn`:  The Amazon Resource Name (ARN) for a backend environment that
  is part of an Amplify app.
- `basic_auth_credentials`:  The basic authorization credentials for the branch.
- `build_spec`:  The build specification (build spec) for the branch.
- `description`:  The description for the branch.
- `display_name`:  The display name for a branch. This is used as the default domain
  prefix.
- `enable_auto_build`:  Enables auto building for the branch.
- `enable_basic_auth`:  Enables basic authorization for the branch.
- `enable_notification`:  Enables notifications for the branch.
- `enable_performance_mode`: Enables performance mode for the branch. Performance mode
  optimizes for faster hosting performance by keeping content cached at the edge for a longer
  interval. When performance mode is enabled, hosting configuration or code changes can take
  up to 10 minutes to roll out.
- `enable_pull_request_preview`:  Enables pull request previews for this branch.
- `environment_variables`:  The environment variables for the branch.
- `framework`:  The framework for the branch.
- `pull_request_environment_name`:  The Amplify environment name for the pull request.
- `stage`:  Describes the current stage for the branch.
- `ttl`:  The content Time to Live (TTL) for the website in seconds.
"""
function update_branch(appId, branchName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/branches/$(branchName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_domain_association(app_id, domain_name, sub_domain_settings; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a new domain association for an Amplify app.

# Arguments
- `app_id`:  The unique ID for an Amplify app.
- `domain_name`:  The name of the domain.
- `sub_domain_settings`:  Describes the settings for the subdomain.

# Keyword Parameters
- `auto_sub_domain_creation_patterns`:  Sets the branch patterns for automatic subdomain
  creation.
- `auto_sub_domain_iamrole`:  The required AWS Identity and Access Management (IAM) service
  role for the Amazon Resource Name (ARN) for automatically creating subdomains.
- `enable_auto_sub_domain`:  Enables the automated creation of subdomains for branches.
"""
function update_domain_association(appId, domainName, subDomainSettings; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/apps/$(appId)/domains/$(domainName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("subDomainSettings"=>subDomainSettings), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_webhook(webhook_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates a webhook.

# Arguments
- `webhook_id`:  The unique ID for a webhook.

# Keyword Parameters
- `branch_name`:  The name for a branch that is part of an Amplify app.
- `description`:  The description for a webhook.
"""
function update_webhook(webhookId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return amplify("POST", "/webhooks/$(webhookId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
