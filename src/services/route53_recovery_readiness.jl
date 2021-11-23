# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: route53_recovery_readiness
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("tags" => "tags", "cells" => "cells", "max_results" => "maxResults", "next_token" => "nextToken", "resource_type" => "resourceType")

"""
    create_cell(cell_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new Cell.

# Arguments
- `cell_name`: The name of the Cell to create

# Keyword Parameters
- `cells`: A list of Cell arns contained within this Cell (for use in nested Cells, e.g.
  regions within which AZs)
- `tags`:
"""
function create_cell(cellName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/cells", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("cellName"=>cellName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_cross_account_authorization(cross_account_authorization; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new cross account readiness authorization.

# Arguments
- `cross_account_authorization`: The cross account authorization

"""
function create_cross_account_authorization(crossAccountAuthorization; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/crossaccountauthorizations", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("crossAccountAuthorization"=>crossAccountAuthorization), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_readiness_check(readiness_check_name, resource_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new Readiness Check.

# Arguments
- `readiness_check_name`: The name of the ReadinessCheck to create
- `resource_set_name`: The name of the ResourceSet to check

# Keyword Parameters
- `tags`:
"""
function create_readiness_check(readinessCheckName, resourceSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/readinesschecks", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("readinessCheckName"=>readinessCheckName, "resourceSetName"=>resourceSetName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_recovery_group(recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new Recovery Group.

# Arguments
- `recovery_group_name`: The name of the RecoveryGroup to create

# Keyword Parameters
- `cells`: A list of Cell arns
- `tags`:
"""
function create_recovery_group(recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/recoverygroups", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("recoveryGroupName"=>recoveryGroupName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_resource_set(resource_set_name, resource_set_type, resources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new Resource Set.

# Arguments
- `resource_set_name`: The name of the ResourceSet to create
- `resource_set_type`: AWS Resource type of the resources in the ResourceSet
- `resources`: A list of Resource objects

# Keyword Parameters
- `tags`:
"""
function create_resource_set(resourceSetName, resourceSetType, resources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/resourcesets", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceSetName"=>resourceSetName, "resourceSetType"=>resourceSetType, "resources"=>resources), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_cell(cell_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an existing Cell.

# Arguments
- `cell_name`: The Cell to delete

"""
function delete_cell(cellName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/cells/$(cellName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_cross_account_authorization(cross_account_authorization; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete cross account readiness authorization

# Arguments
- `cross_account_authorization`: The cross account authorization

"""
function delete_cross_account_authorization(crossAccountAuthorization; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/crossaccountauthorizations/$(crossAccountAuthorization)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_readiness_check(readiness_check_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an existing Readiness Check.

# Arguments
- `readiness_check_name`: The ReadinessCheck to delete

"""
function delete_readiness_check(readinessCheckName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/readinesschecks/$(readinessCheckName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_recovery_group(recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an existing Recovery Group.

# Arguments
- `recovery_group_name`: The RecoveryGroup to delete

"""
function delete_recovery_group(recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/recoverygroups/$(recoveryGroupName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_resource_set(resource_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an existing Resource Set.

# Arguments
- `resource_set_name`: The ResourceSet to delete

"""
function delete_resource_set(resourceSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/resourcesets/$(resourceSetName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_architecture_recommendations(recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of recommendations to improve resilliance and readiness check quality
for a Recovery Group.

# Arguments
- `recovery_group_name`: Name of RecoveryGroup (top level resource) to be analyzed.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token that can be used to resume pagination from the end of the
  collection.
"""
function get_architecture_recommendations(recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/recoverygroups/$(recoveryGroupName)/architectureRecommendations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_cell(cell_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a Cell.

# Arguments
- `cell_name`: The Cell to get

"""
function get_cell(cellName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/cells/$(cellName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_cell_readiness_summary(cell_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about readiness of a Cell.

# Arguments
- `cell_name`: The name of the Cell

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function get_cell_readiness_summary(cellName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/cellreadiness/$(cellName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_readiness_check(readiness_check_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a ReadinessCheck.

# Arguments
- `readiness_check_name`: The ReadinessCheck to get

"""
function get_readiness_check(readinessCheckName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/readinesschecks/$(readinessCheckName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_readiness_check_resource_status(readiness_check_name, resource_identifier; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns detailed information about the status of an individual resource within a Readiness
Check's Resource Set.

# Arguments
- `readiness_check_name`: The ReadinessCheck to get
- `resource_identifier`: The resource ARN or component Id to get

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function get_readiness_check_resource_status(readinessCheckName, resourceIdentifier; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/readinesschecks/$(readinessCheckName)/resource/$(resourceIdentifier)/status", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_readiness_check_status(readiness_check_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the status of a Readiness Check.

# Arguments
- `readiness_check_name`: The ReadinessCheck to get

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function get_readiness_check_status(readinessCheckName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/readinesschecks/$(readinessCheckName)/status", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_recovery_group(recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a Recovery Group.

# Arguments
- `recovery_group_name`: The RecoveryGroup to get

"""
function get_recovery_group(recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/recoverygroups/$(recoveryGroupName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_recovery_group_readiness_summary(recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a Recovery Group.

# Arguments
- `recovery_group_name`: The name of the RecoveryGroup

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function get_recovery_group_readiness_summary(recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/recoverygroupreadiness/$(recoveryGroupName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_set(resource_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a Resource Set.

# Arguments
- `resource_set_name`: The ResourceSet to get

"""
function get_resource_set(resourceSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/resourcesets/$(resourceSetName)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_cells(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of Cells.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function list_cells(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/cells", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_cross_account_authorizations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of cross account readiness authorizations.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function list_cross_account_authorizations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/crossaccountauthorizations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_readiness_checks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of Readiness Checks.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function list_readiness_checks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/readinesschecks", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_recovery_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of Recovery Groups.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function list_recovery_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/recoverygroups", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_resource_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of Resource Sets.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
"""
function list_resource_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/resourcesets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_rules(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a collection of rules that are applied as part of Readiness Checks.

# Keyword Parameters
- `max_results`: Upper bound on number of records to return.
- `next_token`: A token used to resume pagination from the end of a previous request.
- `resource_type`: Filter parameter which specifies the rules to return given a resource
  type.
"""
function list_rules(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/rules", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resources(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of the tags assigned to the specified resource.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) for the resource. You can get this from
  the response to any request to the resource.

"""
function list_tags_for_resources(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("GET", "/tags/$(resource-arn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource-arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds tags to the specified resource. You can specify one or more tags to add.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) for the resource. You can get this from
  the response to any request to the resource.
- `tags`:

"""
function tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("POST", "/tags/$(resource-arn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource-arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes tags from the specified resource. You can specify one or more tags to remove.

# Arguments
- `resource-arn`: The Amazon Resource Name (ARN) for the resource. You can get this from
  the response to any request to the resource.
- `tag_keys`: A comma-separated list of the tag keys to remove from the resource.

"""
function untag_resource(resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("DELETE", "/tags/$(resource-arn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_cell(cell_name, cells; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an existing Cell.

# Arguments
- `cell_name`: The Cell to update
- `cells`: A list of Cell arns, completely replaces previous list

"""
function update_cell(cellName, cells; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("PUT", "/cells/$(cellName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("cells"=>cells), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_readiness_check(readiness_check_name, resource_set_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an exisiting Readiness Check.

# Arguments
- `readiness_check_name`: The ReadinessCheck to update
- `resource_set_name`: The name of the ResourceSet to check

"""
function update_readiness_check(readinessCheckName, resourceSetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("PUT", "/readinesschecks/$(readinessCheckName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceSetName"=>resourceSetName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_recovery_group(cells, recovery_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an existing Recovery Group.

# Arguments
- `cells`: A list of Cell arns, completely replaces previous list
- `recovery_group_name`: The RecoveryGroup to update

"""
function update_recovery_group(cells, recoveryGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("PUT", "/recoverygroups/$(recoveryGroupName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("cells"=>cells), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_resource_set(resource_set_name, resource_set_type, resources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an existing Resource Set.

# Arguments
- `resource_set_name`: The ResourceSet to update
- `resource_set_type`: AWS Resource Type of the resources in the ResourceSet
- `resources`: A list of Resource objects

"""
function update_resource_set(resourceSetName, resourceSetType, resources; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return route53_recovery_readiness("PUT", "/resourcesets/$(resourceSetName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceSetType"=>resourceSetType, "resources"=>resources), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
