# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: wellarchitected
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("account_ids" => "AccountIds", "architectural_design" => "ArchitecturalDesign", "aws_regions" => "AwsRegions", "industry" => "Industry", "industry_type" => "IndustryType", "non_aws_regions" => "NonAwsRegions", "notes" => "Notes", "pillar_priorities" => "PillarPriorities", "tags" => "Tags", "max_results" => "MaxResults", "next_token" => "NextToken", "shared_with_prefix" => "SharedWithPrefix", "choice_updates" => "ChoiceUpdates", "is_applicable" => "IsApplicable", "reason" => "Reason", "selected_choices" => "SelectedChoices", "milestone_number" => "MilestoneNumber", "lens_alias" => "LensAlias", "lens_version" => "LensVersion", "workload_id" => "WorkloadId", "description" => "Description", "environment" => "Environment", "improvement_status" => "ImprovementStatus", "is_review_owner_update_acknowledged" => "IsReviewOwnerUpdateAcknowledged", "review_owner" => "ReviewOwner", "workload_name" => "WorkloadName", "pillar_id" => "PillarId", "is_major_version" => "IsMajorVersion", "base_lens_version" => "BaseLensVersion", "target_lens_version" => "TargetLensVersion", "client_request_token" => "ClientRequestToken", "lens_notes" => "LensNotes", "pillar_notes" => "PillarNotes", "workload_name_prefix" => "WorkloadNamePrefix", "lens_name" => "LensName", "lens_status" => "LensStatus", "lens_type" => "LensType", "lens_name_prefix" => "LensNamePrefix", "share_resource_type" => "ShareResourceType")

"""
    associate_lenses(lens_aliases, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associate a lens to a workload. Up to 10 lenses can be associated with a workload in a
single API operation. A maximum of 20 lenses can be associated with a workload.
Disclaimer  By accessing and/or applying custom lenses created by another Amazon Web
Services user or account, you acknowledge that custom lenses created by other users and
shared with you are Third Party Content as defined in the Amazon Web Services Customer
Agreement.

# Arguments
- `lens_aliases`:
- `workload_id`:

"""
function associate_lenses(LensAliases, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)/associateLenses", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LensAliases"=>LensAliases), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_lens_share(client_request_token, lens_alias, shared_with; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a lens share. The owner of a lens can share it with other Amazon Web Services
accounts and IAM users in the same Amazon Web Services Region. Shared access to a lens is
not removed until the lens invitation is deleted.   Disclaimer  By sharing your custom
lenses with other Amazon Web Services accounts, you acknowledge that Amazon Web Services
will make your custom lenses available to those other accounts. Those other accounts may
continue to access and use your shared custom lenses even if you delete the custom lenses
from your own Amazon Web Services account or terminate your Amazon Web Services account.

# Arguments
- `client_request_token`:
- `lens_alias`:
- `shared_with`:

"""
function create_lens_share(ClientRequestToken, LensAlias, SharedWith; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/lenses/$(LensAlias)/shares", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "SharedWith"=>SharedWith), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_lens_version(client_request_token, lens_alias, lens_version; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new lens version. A lens can have up to 100 versions. After a lens has been
imported, create a new lens version to publish it. The owner of a lens can share the lens
with other Amazon Web Services accounts and IAM users in the same Amazon Web Services
Region. Only the owner of a lens can delete it.

# Arguments
- `client_request_token`:
- `lens_alias`:
- `lens_version`: The version of the lens being created.

# Keyword Parameters
- `is_major_version`: Set to true if this new major lens version.
"""
function create_lens_version(ClientRequestToken, LensAlias, LensVersion; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/lenses/$(LensAlias)/versions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "LensVersion"=>LensVersion), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_milestone(client_request_token, milestone_name, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a milestone for an existing workload.

# Arguments
- `client_request_token`:
- `milestone_name`:
- `workload_id`:

"""
function create_milestone(ClientRequestToken, MilestoneName, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/workloads/$(WorkloadId)/milestones", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "MilestoneName"=>MilestoneName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_workload(client_request_token, description, environment, lenses, review_owner, workload_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a new workload. The owner of a workload can share the workload with other Amazon Web
Services accounts and IAM users in the same Amazon Web Services Region. Only the owner of a
workload can delete it. For more information, see Defining a Workload in the
Well-Architected Tool User Guide.

# Arguments
- `client_request_token`:
- `description`:
- `environment`:
- `lenses`:
- `review_owner`:
- `workload_name`:

# Keyword Parameters
- `account_ids`:
- `architectural_design`:
- `aws_regions`:
- `industry`:
- `industry_type`:
- `non_aws_regions`:
- `notes`:
- `pillar_priorities`:
- `tags`: The tags to be associated with the workload.
"""
function create_workload(ClientRequestToken, Description, Environment, Lenses, ReviewOwner, WorkloadName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/workloads", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "Description"=>Description, "Environment"=>Environment, "Lenses"=>Lenses, "ReviewOwner"=>ReviewOwner, "WorkloadName"=>WorkloadName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_workload_share(client_request_token, permission_type, shared_with, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Create a workload share. The owner of a workload can share it with other Amazon Web
Services accounts and IAM users in the same Amazon Web Services Region. Shared access to a
workload is not removed until the workload invitation is deleted. For more information, see
Sharing a Workload in the Well-Architected Tool User Guide.

# Arguments
- `client_request_token`:
- `permission_type`:
- `shared_with`:
- `workload_id`:

"""
function create_workload_share(ClientRequestToken, PermissionType, SharedWith, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/workloads/$(WorkloadId)/shares", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "PermissionType"=>PermissionType, "SharedWith"=>SharedWith), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_lens(client_request_token, lens_alias, lens_status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete an existing lens. Only the owner of a lens can delete it. After the lens is deleted,
Amazon Web Services accounts and IAM users that you shared the lens with can continue to
use it, but they will no longer be able to apply it to new workloads.    Disclaimer  By
sharing your custom lenses with other Amazon Web Services accounts, you acknowledge that
Amazon Web Services will make your custom lenses available to those other accounts. Those
other accounts may continue to access and use your shared custom lenses even if you delete
the custom lenses from your own Amazon Web Services account or terminate your Amazon Web
Services account.

# Arguments
- `client_request_token`:
- `lens_alias`:
- `lens_status`: The status of the lens to be deleted.

"""
function delete_lens(ClientRequestToken, LensAlias, LensStatus; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("DELETE", "/lenses/$(LensAlias)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "LensStatus"=>LensStatus), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_lens_share(client_request_token, lens_alias, share_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete a lens share. After the lens share is deleted, Amazon Web Services accounts and IAM
users that you shared the lens with can continue to use it, but they will no longer be able
to apply it to new workloads.   Disclaimer  By sharing your custom lenses with other Amazon
Web Services accounts, you acknowledge that Amazon Web Services will make your custom
lenses available to those other accounts. Those other accounts may continue to access and
use your shared custom lenses even if you delete the custom lenses from your own Amazon Web
Services account or terminate your Amazon Web Services account.

# Arguments
- `client_request_token`:
- `lens_alias`:
- `share_id`:

"""
function delete_lens_share(ClientRequestToken, LensAlias, ShareId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("DELETE", "/lenses/$(LensAlias)/shares/$(ShareId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_workload(client_request_token, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete an existing workload.

# Arguments
- `client_request_token`:
- `workload_id`:

"""
function delete_workload(ClientRequestToken, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("DELETE", "/workloads/$(WorkloadId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_workload_share(client_request_token, share_id, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Delete a workload share.

# Arguments
- `client_request_token`:
- `share_id`:
- `workload_id`:

"""
function delete_workload_share(ClientRequestToken, ShareId, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("DELETE", "/workloads/$(WorkloadId)/shares/$(ShareId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    disassociate_lenses(lens_aliases, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociate a lens from a workload. Up to 10 lenses can be disassociated from a workload
in a single API operation.  The Amazon Web Services Well-Architected Framework lens
(wellarchitected) cannot be removed from a workload.

# Arguments
- `lens_aliases`:
- `workload_id`:

"""
function disassociate_lenses(LensAliases, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)/disassociateLenses", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LensAliases"=>LensAliases), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    export_lens(lens_alias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Export an existing lens. Lenses are defined in JSON. For more information, see JSON format
specification in the Well-Architected Tool User Guide. Only the owner of a lens can export
it.    Disclaimer  Do not include or gather personal identifiable information (PII) of end
users or other identifiable individuals in or via your custom lenses. If your custom lens
or those shared with you and used in your account do include or collect PII you are
responsible for: ensuring that the included PII is processed in accordance with applicable
law, providing adequate privacy notices, and obtaining necessary consents for processing
such data.

# Arguments
- `lens_alias`:

# Keyword Parameters
- `lens_version`: The lens version to be exported.
"""
function export_lens(LensAlias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/lenses/$(LensAlias)/export", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_answer(lens_alias, question_id, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get the answer to a specific question in a workload review.

# Arguments
- `lens_alias`:
- `question_id`:
- `workload_id`:

# Keyword Parameters
- `milestone_number`:
"""
function get_answer(LensAlias, QuestionId, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/answers/$(QuestionId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_lens(lens_alias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get an existing lens.

# Arguments
- `lens_alias`:

# Keyword Parameters
- `lens_version`: The lens version to be retrieved.
"""
function get_lens(LensAlias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/lenses/$(LensAlias)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_lens_review(lens_alias, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get lens review.

# Arguments
- `lens_alias`:
- `workload_id`:

# Keyword Parameters
- `milestone_number`:
"""
function get_lens_review(LensAlias, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_lens_review_report(lens_alias, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get lens review report.

# Arguments
- `lens_alias`:
- `workload_id`:

# Keyword Parameters
- `milestone_number`:
"""
function get_lens_review_report(LensAlias, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/report", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_lens_version_difference(lens_alias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get lens version differences.

# Arguments
- `lens_alias`:

# Keyword Parameters
- `base_lens_version`: The base version of the lens.
- `target_lens_version`: The lens version to target a difference for.
"""
function get_lens_version_difference(LensAlias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/lenses/$(LensAlias)/versionDifference", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_milestone(milestone_number, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get a milestone for an existing workload.

# Arguments
- `milestone_number`:
- `workload_id`:

"""
function get_milestone(MilestoneNumber, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/milestones/$(MilestoneNumber)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_workload(workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get an existing workload.

# Arguments
- `workload_id`:

"""
function get_workload(WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    import_lens(client_request_token, jsonstring; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Import a new lens. The lens cannot be applied to workloads or shared with other Amazon Web
Services accounts until it's published with CreateLensVersion  Lenses are defined in JSON.
For more information, see JSON format specification in the Well-Architected Tool User
Guide. A custom lens cannot exceed 500 KB in size.   Disclaimer  Do not include or gather
personal identifiable information (PII) of end users or other identifiable individuals in
or via your custom lenses. If your custom lens or those shared with you and used in your
account do include or collect PII you are responsible for: ensuring that the included PII
is processed in accordance with applicable law, providing adequate privacy notices, and
obtaining necessary consents for processing such data.

# Arguments
- `client_request_token`:
- `jsonstring`: The JSON representation of a lens.

# Keyword Parameters
- `lens_alias`:
- `tags`: Tags to associate to a lens.
"""
function import_lens(ClientRequestToken, JSONString; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PUT", "/importLens", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "JSONString"=>JSONString), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_answers(lens_alias, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List of answers.

# Arguments
- `lens_alias`:
- `workload_id`:

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `milestone_number`:
- `next_token`:
- `pillar_id`:
"""
function list_answers(LensAlias, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/answers", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_lens_review_improvements(lens_alias, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List lens review improvements.

# Arguments
- `lens_alias`:
- `workload_id`:

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `milestone_number`:
- `next_token`:
- `pillar_id`:
"""
function list_lens_review_improvements(LensAlias, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/improvements", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_lens_reviews(workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List lens reviews.

# Arguments
- `workload_id`:

# Keyword Parameters
- `max_results`:
- `milestone_number`:
- `next_token`:
"""
function list_lens_reviews(WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/lensReviews", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_lens_shares(lens_alias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the lens shares associated with the lens.

# Arguments
- `lens_alias`:

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `next_token`:
- `shared_with_prefix`: The Amazon Web Services account ID or IAM role with which the lens
  is shared.
"""
function list_lens_shares(LensAlias; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/lenses/$(LensAlias)/shares", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_lenses(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the available lenses.

# Keyword Parameters
- `lens_name`:
- `lens_status`: The status of lenses to be returned.
- `lens_type`: The type of lenses to be returned.
- `max_results`:
- `next_token`:
"""
function list_lenses(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/lenses", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_milestones(workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all milestones for an existing workload.

# Arguments
- `workload_id`:

# Keyword Parameters
- `max_results`:
- `next_token`:
"""
function list_milestones(WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/workloads/$(WorkloadId)/milestonesSummaries", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_notifications(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List lens notifications.

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `next_token`:
- `workload_id`:
"""
function list_notifications(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/notifications", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_share_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the workload invitations.

# Keyword Parameters
- `lens_name_prefix`: An optional string added to the beginning of each lens name returned
  in the results.
- `max_results`: The maximum number of results to return for this request.
- `next_token`:
- `share_resource_type`: The type of share invitations to be returned.
- `workload_name_prefix`:
"""
function list_share_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/shareInvitations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(workload_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the tags for a resource.

# Arguments
- `workload_arn`:

"""
function list_tags_for_resource(WorkloadArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/tags/$(WorkloadArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_workload_shares(workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the workload shares associated with the workload.

# Arguments
- `workload_id`:

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `next_token`:
- `shared_with_prefix`: The Amazon Web Services account ID or IAM role with which the
  workload is shared.
"""
function list_workload_shares(WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("GET", "/workloads/$(WorkloadId)/shares", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_workloads(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List workloads. Paginated.

# Keyword Parameters
- `max_results`: The maximum number of results to return for this request.
- `next_token`:
- `workload_name_prefix`:
"""
function list_workloads(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/workloadsSummaries", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(tags, workload_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds one or more tags to the specified resource.

# Arguments
- `tags`: The tags for the resource.
- `workload_arn`:

"""
function tag_resource(Tags, WorkloadArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("POST", "/tags/$(WorkloadArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(workload_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes specified tags from a resource. To specify multiple tags, use separate tagKeys
parameters, for example:  DELETE /tags/WorkloadArn?tagKeys=key1&amp;tagKeys=key2

# Arguments
- `workload_arn`:
- `tag_keys`: A list of tag keys. Existing tags of the resource whose keys are members of
  this list are removed from the resource.

"""
function untag_resource(WorkloadArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("DELETE", "/tags/$(WorkloadArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_answer(lens_alias, question_id, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update the answer to a specific question in a workload review.

# Arguments
- `lens_alias`:
- `question_id`:
- `workload_id`:

# Keyword Parameters
- `choice_updates`: A list of choices to update on a question in your workload. The String
  key corresponds to the choice ID to be updated.
- `is_applicable`:
- `notes`:
- `reason`: The reason why a question is not applicable to your workload.
- `selected_choices`:
"""
function update_answer(LensAlias, QuestionId, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/answers/$(QuestionId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_lens_review(lens_alias, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update lens review.

# Arguments
- `lens_alias`:
- `workload_id`:

# Keyword Parameters
- `lens_notes`:
- `pillar_notes`:
"""
function update_lens_review(LensAlias, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_share_invitation(share_invitation_action, share_invitation_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update a workload invitation.

# Arguments
- `share_invitation_action`:
- `share_invitation_id`: The ID assigned to the share invitation.

"""
function update_share_invitation(ShareInvitationAction, ShareInvitationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/shareInvitations/$(ShareInvitationId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ShareInvitationAction"=>ShareInvitationAction), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_workload(workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update an existing workload.

# Arguments
- `workload_id`:

# Keyword Parameters
- `account_ids`:
- `architectural_design`:
- `aws_regions`:
- `description`:
- `environment`:
- `improvement_status`:
- `industry`:
- `industry_type`:
- `is_review_owner_update_acknowledged`: Flag indicating whether the workload owner has
  acknowledged that the Review owner field is required. If a Review owner is not added to the
  workload within 60 days of acknowledgement, access to the workload is restricted until an
  owner is added.
- `non_aws_regions`:
- `notes`:
- `pillar_priorities`:
- `review_owner`:
- `workload_name`:
"""
function update_workload(WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_workload_share(permission_type, share_id, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Update a workload share.

# Arguments
- `permission_type`:
- `share_id`:
- `workload_id`:

"""
function update_workload_share(PermissionType, ShareId, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PATCH", "/workloads/$(WorkloadId)/shares/$(ShareId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PermissionType"=>PermissionType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    upgrade_lens_review(lens_alias, milestone_name, workload_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Upgrade lens review.

# Arguments
- `lens_alias`:
- `milestone_name`:
- `workload_id`:

# Keyword Parameters
- `client_request_token`:
"""
function upgrade_lens_review(LensAlias, MilestoneName, WorkloadId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return wellarchitected("PUT", "/workloads/$(WorkloadId)/lensReviews/$(LensAlias)/upgrade", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("MilestoneName"=>MilestoneName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
