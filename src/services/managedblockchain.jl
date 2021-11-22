# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: managedblockchain
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("log_publishing_configuration" => "LogPublishingConfiguration", "description" => "Description", "framework_configuration" => "FrameworkConfiguration", "tags" => "Tags", "member_id" => "MemberId", "max_results" => "maxResults", "next_token" => "nextToken", "status" => "status", "is_owned" => "isOwned", "name" => "name", "framework" => "framework")

"""
    create_member(client_request_token, invitation_id, member_configuration, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a member within a Managed Blockchain network. Applies only to Hyperledger Fabric.

# Arguments
- `client_request_token`: A unique, case-sensitive identifier that you provide to ensure
  the idempotency of the operation. An idempotent operation completes no more than one time.
  This identifier is required only if you make a service request directly using an HTTP
  client. It is generated automatically if you use an AWS SDK or the AWS CLI.
- `invitation_id`: The unique identifier of the invitation that is sent to the member to
  join the network.
- `member_configuration`: Member configuration parameters.
- `network_id`: The unique identifier of the network in which the member is created.

"""
function create_member(ClientRequestToken, InvitationId, MemberConfiguration, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/networks/$(networkId)/members", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "InvitationId"=>InvitationId, "MemberConfiguration"=>MemberConfiguration), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_network(client_request_token, framework, framework_version, member_configuration, name, voting_policy; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new blockchain network using Amazon Managed Blockchain. Applies only to
Hyperledger Fabric.

# Arguments
- `client_request_token`: A unique, case-sensitive identifier that you provide to ensure
  the idempotency of the operation. An idempotent operation completes no more than one time.
  This identifier is required only if you make a service request directly using an HTTP
  client. It is generated automatically if you use an AWS SDK or the AWS CLI.
- `framework`: The blockchain framework that the network uses.
- `framework_version`: The version of the blockchain framework that the network uses.
- `member_configuration`: Configuration properties for the first member within the network.
- `name`: The name of the network.
- `voting_policy`:  The voting rules used by the network to determine if a proposal is
  approved.

# Keyword Parameters
- `description`: An optional description for the network.
- `framework_configuration`:  Configuration properties of the blockchain framework relevant
  to the network configuration.
- `tags`: Tags to assign to the network. Each tag consists of a key and optional value.
  When specifying tags during creation, you can specify multiple key-value pairs in a single
  request, with an overall maximum of 50 tags added to each resource. For more information
  about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer
  Guide, or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer
  Guide.
"""
function create_network(ClientRequestToken, Framework, FrameworkVersion, MemberConfiguration, Name, VotingPolicy; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/networks", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "Framework"=>Framework, "FrameworkVersion"=>FrameworkVersion, "MemberConfiguration"=>MemberConfiguration, "Name"=>Name, "VotingPolicy"=>VotingPolicy), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_node(client_request_token, node_configuration, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a node on the specified blockchain network. Applies to Hyperledger Fabric and
Ethereum.

# Arguments
- `client_request_token`: A unique, case-sensitive identifier that you provide to ensure
  the idempotency of the operation. An idempotent operation completes no more than one time.
  This identifier is required only if you make a service request directly using an HTTP
  client. It is generated automatically if you use an AWS SDK or the AWS CLI.
- `node_configuration`: The properties of a node configuration.
- `network_id`: The unique identifier of the network for the node. Ethereum public networks
  have the following NetworkIds:    n-ethereum-mainnet     n-ethereum-rinkeby
  n-ethereum-ropsten

# Keyword Parameters
- `member_id`: The unique identifier of the member that owns this node. Applies only to
  Hyperledger Fabric.
- `tags`: Tags to assign to the node. Each tag consists of a key and optional value. When
  specifying tags during creation, you can specify multiple key-value pairs in a single
  request, with an overall maximum of 50 tags added to each resource. For more information
  about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer
  Guide, or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer
  Guide.
"""
function create_node(ClientRequestToken, NodeConfiguration, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/networks/$(networkId)/nodes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "NodeConfiguration"=>NodeConfiguration), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_proposal(actions, client_request_token, member_id, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a proposal for a change to the network that other members of the network can vote
on, for example, a proposal to add a new member to the network. Any member can create a
proposal. Applies only to Hyperledger Fabric.

# Arguments
- `actions`: The type of actions proposed, such as inviting a member or removing a member.
  The types of Actions in a proposal are mutually exclusive. For example, a proposal with
  Invitations actions cannot also contain Removals actions.
- `client_request_token`: A unique, case-sensitive identifier that you provide to ensure
  the idempotency of the operation. An idempotent operation completes no more than one time.
  This identifier is required only if you make a service request directly using an HTTP
  client. It is generated automatically if you use an AWS SDK or the AWS CLI.
- `member_id`: The unique identifier of the member that is creating the proposal. This
  identifier is especially useful for identifying the member making the proposal when
  multiple members exist in a single AWS account.
- `network_id`:  The unique identifier of the network for which the proposal is made.

# Keyword Parameters
- `description`: A description for the proposal that is visible to voting members, for
  example, \"Proposal to add Example Corp. as member.\"
- `tags`: Tags to assign to the proposal. Each tag consists of a key and optional value.
  When specifying tags during creation, you can specify multiple key-value pairs in a single
  request, with an overall maximum of 50 tags added to each resource. If the proposal is for
  a network invitation, the invitation inherits the tags added to the proposal. For more
  information about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum
  Developer Guide, or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
  Developer Guide.
"""
function create_proposal(Actions, ClientRequestToken, MemberId, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/networks/$(networkId)/proposals", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Actions"=>Actions, "ClientRequestToken"=>ClientRequestToken, "MemberId"=>MemberId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_member(member_id, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a member. Deleting a member removes the member and all associated resources from
the network. DeleteMember can only be called for a specified MemberId if the principal
performing the action is associated with the AWS account that owns the member. In all other
cases, the DeleteMember action is carried out as the result of an approved proposal to
remove a member. If MemberId is the last member in a network specified by the last AWS
account, the network is deleted also. Applies only to Hyperledger Fabric.

# Arguments
- `member_id`: The unique identifier of the member to remove.
- `network_id`: The unique identifier of the network from which the member is removed.

"""
function delete_member(memberId, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("DELETE", "/networks/$(networkId)/members/$(memberId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_node(network_id, node_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a node that your AWS account owns. All data on the node is lost and cannot be
recovered. Applies to Hyperledger Fabric and Ethereum.

# Arguments
- `network_id`: The unique identifier of the network that the node is on. Ethereum public
  networks have the following NetworkIds:    n-ethereum-mainnet     n-ethereum-rinkeby
  n-ethereum-ropsten
- `node_id`: The unique identifier of the node.

# Keyword Parameters
- `member_id`: The unique identifier of the member that owns this node. Applies only to
  Hyperledger Fabric and is required for Hyperledger Fabric.
"""
function delete_node(networkId, nodeId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("DELETE", "/networks/$(networkId)/nodes/$(nodeId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_member(member_id, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns detailed information about a member. Applies only to Hyperledger Fabric.

# Arguments
- `member_id`: The unique identifier of the member.
- `network_id`: The unique identifier of the network to which the member belongs.

"""
function get_member(memberId, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/members/$(memberId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_network(network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns detailed information about a network. Applies to Hyperledger Fabric and Ethereum.

# Arguments
- `network_id`: The unique identifier of the network to get information about.

"""
function get_network(networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_node(network_id, node_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns detailed information about a node. Applies to Hyperledger Fabric and Ethereum.

# Arguments
- `network_id`: The unique identifier of the network that the node is on.
- `node_id`: The unique identifier of the node.

# Keyword Parameters
- `member_id`: The unique identifier of the member that owns the node. Applies only to
  Hyperledger Fabric and is required for Hyperledger Fabric.
"""
function get_node(networkId, nodeId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/nodes/$(nodeId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_proposal(network_id, proposal_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns detailed information about a proposal. Applies only to Hyperledger Fabric.

# Arguments
- `network_id`: The unique identifier of the network for which the proposal is made.
- `proposal_id`: The unique identifier of the proposal.

"""
function get_proposal(networkId, proposalId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/proposals/$(proposalId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of all invitations for the current AWS account. Applies only to Hyperledger
Fabric.

# Keyword Parameters
- `max_results`: The maximum number of invitations to return.
- `next_token`: The pagination token that indicates the next set of results to retrieve.
"""
function list_invitations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/invitations", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_members(network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of the members in a network and properties of their configurations. Applies
only to Hyperledger Fabric.

# Arguments
- `network_id`: The unique identifier of the network for which to list members.

# Keyword Parameters
- `is_owned`: An optional Boolean value. If provided, the request is limited either to
  members that the current AWS account owns (true) or that other AWS accounts own (false). If
  omitted, all members are listed.
- `max_results`: The maximum number of members to return in the request.
- `name`: The optional name of the member to list.
- `next_token`: The pagination token that indicates the next set of results to retrieve.
- `status`: An optional status specifier. If provided, only members currently in this
  status are listed.
"""
function list_members(networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/members", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_networks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the networks in which the current AWS account participates.
Applies to Hyperledger Fabric and Ethereum.

# Keyword Parameters
- `framework`: An optional framework specifier. If provided, only networks of this
  framework type are listed.
- `max_results`: The maximum number of networks to list.
- `name`: The name of the network.
- `next_token`: The pagination token that indicates the next set of results to retrieve.
- `status`: An optional status specifier. If provided, only networks currently in this
  status are listed. Applies only to Hyperledger Fabric.
"""
function list_networks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_nodes(network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the nodes within a network. Applies to Hyperledger Fabric and
Ethereum.

# Arguments
- `network_id`: The unique identifier of the network for which to list nodes.

# Keyword Parameters
- `max_results`: The maximum number of nodes to list.
- `member_id`: The unique identifier of the member who owns the nodes to list. Applies only
  to Hyperledger Fabric and is required for Hyperledger Fabric.
- `next_token`: The pagination token that indicates the next set of results to retrieve.
- `status`: An optional status specifier. If provided, only nodes currently in this status
  are listed.
"""
function list_nodes(networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/nodes", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_proposal_votes(network_id, proposal_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the list of votes for a specified proposal, including the value of each vote and
the unique identifier of the member that cast the vote. Applies only to Hyperledger Fabric.

# Arguments
- `network_id`:  The unique identifier of the network.
- `proposal_id`:  The unique identifier of the proposal.

# Keyword Parameters
- `max_results`:  The maximum number of votes to return.
- `next_token`:  The pagination token that indicates the next set of results to retrieve.
"""
function list_proposal_votes(networkId, proposalId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/proposals/$(proposalId)/votes", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_proposals(network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of proposals for the network. Applies only to Hyperledger Fabric.

# Arguments
- `network_id`:  The unique identifier of the network.

# Keyword Parameters
- `max_results`:  The maximum number of proposals to return.
- `next_token`:  The pagination token that indicates the next set of results to retrieve.
"""
function list_proposals(networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/networks/$(networkId)/proposals", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of tags for the specified resource. Each tag consists of a key and optional
value. For more information about tags, see Tagging Resources in the Amazon Managed
Blockchain Ethereum Developer Guide, or Tagging Resources in the Amazon Managed Blockchain
Hyperledger Fabric Developer Guide.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource. For more information
  about ARNs and their format, see Amazon Resource Names (ARNs) in the AWS General Reference.

"""
function list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("GET", "/tags/$(resourceArn)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    reject_invitation(invitation_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Rejects an invitation to join a network. This action can be called by a principal in an AWS
account that has received an invitation to create a member and join a network. Applies only
to Hyperledger Fabric.

# Arguments
- `invitation_id`: The unique identifier of the invitation to reject.

"""
function reject_invitation(invitationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("DELETE", "/invitations/$(invitationId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(tags, resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds or overwrites the specified tags for the specified Amazon Managed Blockchain resource.
Each tag consists of a key and optional value. When you specify a tag key that already
exists, the tag value is overwritten with the new value. Use UntagResource to remove tag
keys. A resource can have up to 50 tags. If you try to create more than 50 tags for a
resource, your request fails and returns an error. For more information about tags, see
Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide, or Tagging
Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide.

# Arguments
- `tags`: The tags to assign to the specified resource. Tag values can be empty, for
  example, \"MyTagKey\" : \"\". You can specify multiple key-value pairs in a single request,
  with an overall maximum of 50 tags added to each resource.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource. For more information
  about ARNs and their format, see Amazon Resource Names (ARNs) in the AWS General Reference.

"""
function tag_resource(Tags, resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified tags from the Amazon Managed Blockchain resource. For more
information about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum
Developer Guide, or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
Developer Guide.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource. For more information
  about ARNs and their format, see Amazon Resource Names (ARNs) in the AWS General Reference.
- `tag_keys`: The tag keys.

"""
function untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_member(member_id, network_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a member configuration with new parameters. Applies only to Hyperledger Fabric.

# Arguments
- `member_id`: The unique identifier of the member.
- `network_id`: The unique identifier of the Managed Blockchain network to which the member
  belongs.

# Keyword Parameters
- `log_publishing_configuration`: Configuration properties for publishing to Amazon
  CloudWatch Logs.
"""
function update_member(memberId, networkId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("PATCH", "/networks/$(networkId)/members/$(memberId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_node(network_id, node_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a node configuration with new parameters. Applies only to Hyperledger Fabric.

# Arguments
- `network_id`: The unique identifier of the network that the node is on.
- `node_id`: The unique identifier of the node.

# Keyword Parameters
- `log_publishing_configuration`: Configuration properties for publishing to Amazon
  CloudWatch Logs.
- `member_id`: The unique identifier of the member that owns the node. Applies only to
  Hyperledger Fabric.
"""
function update_node(networkId, nodeId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("PATCH", "/networks/$(networkId)/nodes/$(nodeId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    vote_on_proposal(vote, voter_member_id, network_id, proposal_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Casts a vote for a specified ProposalId on behalf of a member. The member to vote as,
specified by VoterMemberId, must be in the same AWS account as the principal that calls the
action. Applies only to Hyperledger Fabric.

# Arguments
- `vote`:  The value of the vote.
- `voter_member_id`: The unique identifier of the member casting the vote.
- `network_id`:  The unique identifier of the network.
- `proposal_id`:  The unique identifier of the proposal.

"""
function vote_on_proposal(Vote, VoterMemberId, networkId, proposalId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return managedblockchain("POST", "/networks/$(networkId)/proposals/$(proposalId)/votes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Vote"=>Vote, "VoterMemberId"=>VoterMemberId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
