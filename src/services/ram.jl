# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ram
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("association_status" => "associationStatus", "max_results" => "maxResults", "next_token" => "nextToken", "principal" => "principal", "resource_arn" => "resourceArn", "resource_share_arns" => "resourceShareArns", "permission_version" => "permissionVersion", "principals" => "principals", "resource_type" => "resourceType", "resource_share_invitation_arns" => "resourceShareInvitationArns", "allow_external_principals" => "allowExternalPrincipals", "client_token" => "clientToken", "name" => "name", "permission_arns" => "permissionArns", "resource_arns" => "resourceArns", "tags" => "tags", "permission_arn" => "permissionArn", "resource_share_status" => "resourceShareStatus", "tag_filters" => "tagFilters", "replace" => "replace")

"""
    accept_resource_share_invitation(resource_share_invitation_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Accepts an invitation to a resource share from another Amazon Web Services account.

# Arguments
- `resource_share_invitation_arn`: The Amazon Resource Name (ARN) of the invitation.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
"""
function accept_resource_share_invitation(resourceShareInvitationArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/acceptresourceshareinvitation", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareInvitationArn"=>resourceShareInvitationArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    associate_resource_share(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates the specified resource share with the specified principals and resources.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `principals`: The principals to associate with the resource share. The possible values
  are:   An Amazon Web Services account ID   An Amazon Resource Name (ARN) of an organization
  in Organizations   An ARN of an organizational unit (OU) in Organizations   An ARN of an
  IAM role   An ARN of an IAM user    Not all resource types can be shared with IAM roles and
  IAM users. For more information, see Sharing with IAM roles and IAM users in the Resource
  Access Manager User Guide.
- `resource_arns`: The Amazon Resource Names (ARNs) of the resources.
"""
function associate_resource_share(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/associateresourceshare", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    associate_resource_share_permission(permission_arn, resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates a permission with a resource share.

# Arguments
- `permission_arn`: The Amazon Resource Name (ARN) of the RAM permission to associate with
  the resource share.
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `permission_version`: The version of the RAM permissions to associate with the resource
  share.
- `replace`: Indicates whether the permission should replace the permissions that are
  currently associated with the resource share. Use true to replace the current permissions.
  Use false to add the permission to the current permission.
"""
function associate_resource_share_permission(permissionArn, resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/associateresourcesharepermission", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("permissionArn"=>permissionArn, "resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_resource_share(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a resource share. You must provide a list of the Amazon Resource Names (ARNs) for
the resources you want to share. You must also specify who you want to share the resources
with, and the permissions that you grant them.  Sharing a resource makes it available for
use by principals outside of the Amazon Web Services account that created the resource.
Sharing doesn't change any permissions or quotas that apply to the resource in the account
that created it.

# Arguments
- `name`: The name of the resource share.

# Keyword Parameters
- `allow_external_principals`: Indicates whether principals outside your organization in
  Organizations can be associated with a resource share.
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `permission_arns`: The Amazon Resource Names (ARNs) of the permissions to associate with
  the resource share. If you do not specify an ARN for the permission, RAM automatically
  attaches the default version of the permission for each resource type. Only one permission
  can be associated with each resource type in a resource share.
- `principals`: The principals to associate with the resource share. The possible values
  are:   An Amazon Web Services account ID   An Amazon Resource Name (ARN) of an organization
  in Organizations   An ARN of an organizational unit (OU) in Organizations   An ARN of an
  IAM role   An ARN of an IAM user    Not all resource types can be shared with IAM roles and
  IAM users. For more information, see Sharing with IAM roles and IAM users in the Resource
  Access Manager User Guide.
- `resource_arns`: The ARNs of the resources to associate with the resource share.
- `tags`: One or more tags.
"""
function create_resource_share(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/createresourceshare", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("name"=>name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_resource_share(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified resource share.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
"""
function delete_resource_share(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("DELETE", "/deleteresourceshare", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    disassociate_resource_share(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates the specified principals or resources from the specified resource share.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `principals`: The principals.
- `resource_arns`: The Amazon Resource Names (ARNs) of the resources.
"""
function disassociate_resource_share(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/disassociateresourceshare", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    disassociate_resource_share_permission(permission_arn, resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates an RAM permission from a resource share.

# Arguments
- `permission_arn`: The Amazon Resource Name (ARN) of the permission to disassociate from
  the resource share.
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
"""
function disassociate_resource_share_permission(permissionArn, resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/disassociateresourcesharepermission", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("permissionArn"=>permissionArn, "resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    enable_sharing_with_aws_organization(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Enables resource sharing within your organization in Organizations. The caller must be the
master account for the organization.

"""
function enable_sharing_with_aws_organization(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/enablesharingwithawsorganization", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_permission(permission_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the contents of an RAM permission in JSON format.

# Arguments
- `permission_arn`: The Amazon Resource Name (ARN) of the permission.

# Keyword Parameters
- `permission_version`: The identifier for the version of the permission.
"""
function get_permission(permissionArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/getpermission", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("permissionArn"=>permissionArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_policies(resource_arns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the policies for the specified resources that you own and have shared.

# Arguments
- `resource_arns`: The Amazon Resource Names (ARNs) of the resources.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `principal`: The principal.
"""
function get_resource_policies(resourceArns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/getresourcepolicies", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceArns"=>resourceArns), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_share_associations(association_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the resources or principals for the resource shares that you own.

# Arguments
- `association_type`: The association type. Specify PRINCIPAL to list the principals that
  are associated with the specified resource share. Specify RESOURCE to list the resources
  that are associated with the specified resource share.

# Keyword Parameters
- `association_status`: The association status.
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `principal`: The principal. You cannot specify this parameter if the association type is
  RESOURCE.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource. You cannot specify this
  parameter if the association type is PRINCIPAL.
- `resource_share_arns`: The Amazon Resource Names (ARN) of the resource shares.
"""
function get_resource_share_associations(associationType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/getresourceshareassociations", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("associationType"=>associationType), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_share_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the invitations that you have received for resource shares.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `resource_share_arns`: The Amazon Resource Names (ARN) of the resource shares.
- `resource_share_invitation_arns`: The Amazon Resource Names (ARN) of the invitations.
"""
function get_resource_share_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/getresourceshareinvitations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_resource_shares(resource_owner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the resource shares that you own or the resource shares that are shared with you.

# Arguments
- `resource_owner`: The type of owner.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `name`: The name of the resource share.
- `next_token`: The token for the next page of results.
- `permission_arn`: The Amazon Resource Name (ARN) of the RAM permission that is associated
  with the resource share.
- `resource_share_arns`: The Amazon Resource Names (ARNs) of the resource shares.
- `resource_share_status`: The status of the resource share.
- `tag_filters`: One or more tag filters.
"""
function get_resource_shares(resourceOwner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/getresourceshares", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceOwner"=>resourceOwner), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_pending_invitation_resources(resource_share_invitation_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the resources in a resource share that is shared with you but that the invitation is
still pending for.

# Arguments
- `resource_share_invitation_arn`: The Amazon Resource Name (ARN) of the invitation.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_pending_invitation_resources(resourceShareInvitationArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listpendinginvitationresources", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareInvitationArn"=>resourceShareInvitationArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_permissions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the RAM permissions.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `resource_type`: Specifies the resource type for which to list permissions. For example,
  to list only permissions that apply to EC2 subnets, specify ec2:Subnet.
"""
function list_permissions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listpermissions", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_principals(resource_owner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the principals that you have shared resources with or that have shared resources with
you.

# Arguments
- `resource_owner`: The type of owner.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `principals`: The principals.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `resource_share_arns`: The Amazon Resource Names (ARN) of the resource shares.
- `resource_type`: The resource type. Valid values: acm-pca:CertificateAuthority |
  appmesh:Mesh | codebuild:Project | codebuild:ReportGroup | ec2:CapacityReservation |
  ec2:DedicatedHost | ec2:LocalGatewayRouteTable | ec2:PrefixList | ec2:Subnet |
  ec2:TrafficMirrorTarget | ec2:TransitGateway | imagebuilder:Component | imagebuilder:Image
  | imagebuilder:ImageRecipe | imagebuilder:ContainerRecipe | glue:Catalog | glue:Database |
  glue:Table | license-manager:LicenseConfiguration I network-firewall:FirewallPolicy |
  network-firewall:StatefulRuleGroup | network-firewall:StatelessRuleGroup | outposts:Outpost
  | resource-groups:Group | rds:Cluster | route53resolver:FirewallRuleGroup
  |route53resolver:ResolverQueryLogConfig | route53resolver:ResolverRule |
  s3-outposts:Outpost | ssm-contacts:Contact | ssm-incidents:ResponsePlan
"""
function list_principals(resourceOwner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listprincipals", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceOwner"=>resourceOwner), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_resource_share_permissions(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the RAM permissions that are associated with a resource share.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_resource_share_permissions(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listresourcesharepermissions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_resource_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the shareable resource types supported by RAM.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
"""
function list_resource_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listresourcetypes", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_resources(resource_owner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the resources that you added to a resource shares or the resources that are shared
with you.

# Arguments
- `resource_owner`: The type of owner.

# Keyword Parameters
- `max_results`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `next_token`: The token for the next page of results.
- `principal`: The principal.
- `resource_arns`: The Amazon Resource Names (ARNs) of the resources.
- `resource_share_arns`: The Amazon Resource Names (ARN) of the resource shares.
- `resource_type`: The resource type. Valid values: acm-pca:CertificateAuthority |
  appmesh:Mesh | codebuild:Project | codebuild:ReportGroup | ec2:CapacityReservation |
  ec2:DedicatedHost | ec2:LocalGatewayRouteTable | ec2:PrefixList | ec2:Subnet |
  ec2:TrafficMirrorTarget | ec2:TransitGateway | imagebuilder:Component | imagebuilder:Image
  | imagebuilder:ImageRecipe | imagebuilder:ContainerRecipe | glue:Catalog | glue:Database |
  glue:Table | license-manager:LicenseConfiguration I network-firewall:FirewallPolicy |
  network-firewall:StatefulRuleGroup | network-firewall:StatelessRuleGroup | outposts:Outpost
  | resource-groups:Group | rds:Cluster | route53resolver:FirewallRuleGroup
  |route53resolver:ResolverQueryLogConfig | route53resolver:ResolverRule |
  s3-outposts:Outpost | ssm-contacts:Contact | ssm-incidents:ResponsePlan
"""
function list_resources(resourceOwner; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/listresources", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceOwner"=>resourceOwner), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    promote_resource_share_created_from_policy(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Resource shares that were created by attaching a policy to a resource are visible only to
the resource share owner, and the resource share cannot be modified in RAM. Use this API
action to promote the resource share. When you promote the resource share, it becomes:
Visible to all principals that it is shared with.   Modifiable in RAM.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share to promote.

"""
function promote_resource_share_created_from_policy(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/promoteresourcesharecreatedfrompolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    reject_resource_share_invitation(resource_share_invitation_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Rejects an invitation to a resource share from another Amazon Web Services account.

# Arguments
- `resource_share_invitation_arn`: The Amazon Resource Name (ARN) of the invitation.

# Keyword Parameters
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
"""
function reject_resource_share_invitation(resourceShareInvitationArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/rejectresourceshareinvitation", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareInvitationArn"=>resourceShareInvitationArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_share_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified tags to the specified resource share that you own.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.
- `tags`: One or more tags.

"""
function tag_resource(resourceShareArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/tagresource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn, "tags"=>tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_share_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified tags from the specified resource share that you own.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.
- `tag_keys`: The tag keys of the tags to remove.

"""
function untag_resource(resourceShareArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/untagresource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn, "tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_resource_share(resource_share_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the specified resource share that you own.

# Arguments
- `resource_share_arn`: The Amazon Resource Name (ARN) of the resource share.

# Keyword Parameters
- `allow_external_principals`: Indicates whether principals outside your organization in
  Organizations can be associated with a resource share.
- `client_token`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request.
- `name`: The name of the resource share.
"""
function update_resource_share(resourceShareArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return ram("POST", "/updateresourceshare", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceShareArn"=>resourceShareArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
