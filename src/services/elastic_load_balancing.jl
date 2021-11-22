# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: elastic_load_balancing
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("load_balancer_name" => "LoadBalancerName", "policy_names" => "PolicyNames", "load_balancer_names" => "LoadBalancerNames", "marker" => "Marker", "page_size" => "PageSize", "policy_type_names" => "PolicyTypeNames", "availability_zones" => "AvailabilityZones", "scheme" => "Scheme", "security_groups" => "SecurityGroups", "subnets" => "Subnets", "tags" => "Tags", "policy_attributes" => "PolicyAttributes", "cookie_expiration_period" => "CookieExpirationPeriod", "instances" => "Instances")

"""
    add_tags(load_balancer_names, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified tags to the specified load balancer. Each load balancer can have a
maximum of 10 tags. Each tag consists of a key and an optional value. If a tag with the
same key is already associated with the load balancer, AddTags updates its value. For more
information, see Tag Your Classic Load Balancer in the Classic Load Balancers Guide.

# Arguments
- `load_balancer_names`: The name of the load balancer. You can specify one load balancer
  only.
- `tags`: The tags.

"""
function add_tags(LoadBalancerNames, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("AddTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerNames"=>LoadBalancerNames, "Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    apply_security_groups_to_load_balancer(load_balancer_name, security_groups; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates one or more security groups with your load balancer in a virtual private cloud
(VPC). The specified security groups override the previously associated security groups.
For more information, see Security Groups for Load Balancers in a VPC in the Classic Load
Balancers Guide.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `security_groups`: The IDs of the security groups to associate with the load balancer.
  Note that you cannot specify the name of the security group.

"""
function apply_security_groups_to_load_balancer(LoadBalancerName, SecurityGroups; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("ApplySecurityGroupsToLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "SecurityGroups"=>SecurityGroups), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    attach_load_balancer_to_subnets(load_balancer_name, subnets; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds one or more subnets to the set of configured subnets for the specified load balancer.
The load balancer evenly distributes requests across all registered subnets. For more
information, see Add or Remove Subnets for Your Load Balancer in a VPC in the Classic Load
Balancers Guide.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `subnets`: The IDs of the subnets to add. You can add only one subnet per Availability
  Zone.

"""
function attach_load_balancer_to_subnets(LoadBalancerName, Subnets; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("AttachLoadBalancerToSubnets", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "Subnets"=>Subnets), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    configure_health_check(health_check, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Specifies the health check settings to use when evaluating the health state of your EC2
instances. For more information, see Configure Health Checks for Your Load Balancer in the
Classic Load Balancers Guide.

# Arguments
- `health_check`: The configuration information.
- `load_balancer_name`: The name of the load balancer.

"""
function configure_health_check(HealthCheck, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("ConfigureHealthCheck", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HealthCheck"=>HealthCheck, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_app_cookie_stickiness_policy(cookie_name, load_balancer_name, policy_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Generates a stickiness policy with sticky session lifetimes that follow that of an
application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.
This policy is similar to the policy created by CreateLBCookieStickinessPolicy, except that
the lifetime of the special Elastic Load Balancing cookie, AWSELB, follows the lifetime of
the application-generated cookie specified in the policy configuration. The load balancer
only inserts a new stickiness cookie when the application response includes a new
application cookie. If the application cookie is explicitly removed or expires, the session
stops being sticky until a new application cookie is issued. For more information, see
Application-Controlled Session Stickiness in the Classic Load Balancers Guide.

# Arguments
- `cookie_name`: The name of the application cookie used for stickiness.
- `load_balancer_name`: The name of the load balancer.
- `policy_name`: The name of the policy being created. Policy names must consist of
  alphanumeric characters and dashes (-). This name must be unique within the set of policies
  for this load balancer.

"""
function create_app_cookie_stickiness_policy(CookieName, LoadBalancerName, PolicyName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("CreateAppCookieStickinessPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("CookieName"=>CookieName, "LoadBalancerName"=>LoadBalancerName, "PolicyName"=>PolicyName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_lbcookie_stickiness_policy(load_balancer_name, policy_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of
the browser (user-agent) or a specified expiration period. This policy can be associated
only with HTTP/HTTPS listeners. When a load balancer implements this policy, the load
balancer uses a special cookie to track the instance for each request. When the load
balancer receives a request, it first checks to see if this cookie is present in the
request. If so, the load balancer sends the request to the application server specified in
the cookie. If not, the load balancer sends the request to a server that is chosen based on
the existing load-balancing algorithm. A cookie is inserted into the response for binding
subsequent requests from the same user to that server. The validity of the cookie is based
on the cookie expiration time, which is specified in the policy configuration. For more
information, see Duration-Based Session Stickiness in the Classic Load Balancers Guide.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `policy_name`: The name of the policy being created. Policy names must consist of
  alphanumeric characters and dashes (-). This name must be unique within the set of policies
  for this load balancer.

# Keyword Parameters
- `cookie_expiration_period`: The time period, in seconds, after which the cookie should be
  considered stale. If you do not specify this parameter, the default value is 0, which
  indicates that the sticky session should last for the duration of the browser session.
"""
function create_lbcookie_stickiness_policy(LoadBalancerName, PolicyName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("CreateLBCookieStickinessPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "PolicyName"=>PolicyName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_load_balancer(listeners, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a Classic Load Balancer. You can add listeners, security groups, subnets, and tags
when you create your load balancer, or you can add them later using
CreateLoadBalancerListeners, ApplySecurityGroupsToLoadBalancer,
AttachLoadBalancerToSubnets, and AddTags. To describe your current load balancers, see
DescribeLoadBalancers. When you are finished with a load balancer, you can delete it using
DeleteLoadBalancer. You can create up to 20 load balancers per region per account. You can
request an increase for the number of load balancers for your account. For more
information, see Limits for Your Classic Load Balancer in the Classic Load Balancers Guide.

# Arguments
- `listeners`: The listeners. For more information, see Listeners for Your Classic Load
  Balancer in the Classic Load Balancers Guide.
- `load_balancer_name`: The name of the load balancer. This name must be unique within your
  set of load balancers for the region, must have a maximum of 32 characters, must contain
  only alphanumeric characters or hyphens, and cannot begin or end with a hyphen.

# Keyword Parameters
- `availability_zones`: One or more Availability Zones from the same region as the load
  balancer. You must specify at least one Availability Zone. You can add more Availability
  Zones after you create the load balancer using EnableAvailabilityZonesForLoadBalancer.
- `scheme`: The type of a load balancer. Valid only for load balancers in a VPC. By
  default, Elastic Load Balancing creates an Internet-facing load balancer with a DNS name
  that resolves to public IP addresses. For more information about Internet-facing and
  Internal load balancers, see Load Balancer Scheme in the Elastic Load Balancing User Guide.
  Specify internal to create a load balancer with a DNS name that resolves to private IP
  addresses.
- `security_groups`: The IDs of the security groups to assign to the load balancer.
- `subnets`: The IDs of the subnets in your VPC to attach to the load balancer. Specify one
  subnet per Availability Zone specified in AvailabilityZones.
- `tags`: A list of tags to assign to the load balancer. For more information about tagging
  your load balancer, see Tag Your Classic Load Balancer in the Classic Load Balancers Guide.
"""
function create_load_balancer(Listeners, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("CreateLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Listeners"=>Listeners, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_load_balancer_listeners(listeners, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates one or more listeners for the specified load balancer. If a listener with the
specified port does not already exist, it is created; otherwise, the properties of the new
listener must match the properties of the existing listener. For more information, see
Listeners for Your Classic Load Balancer in the Classic Load Balancers Guide.

# Arguments
- `listeners`: The listeners.
- `load_balancer_name`: The name of the load balancer.

"""
function create_load_balancer_listeners(Listeners, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("CreateLoadBalancerListeners", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Listeners"=>Listeners, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_load_balancer_policy(load_balancer_name, policy_name, policy_type_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a policy with the specified attributes for the specified load balancer. Policies
are settings that are saved for your load balancer and that can be applied to the listener
or the application server, depending on the policy type.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `policy_name`: The name of the load balancer policy to be created. This name must be
  unique within the set of policies for this load balancer.
- `policy_type_name`: The name of the base policy type. To get the list of policy types,
  use DescribeLoadBalancerPolicyTypes.

# Keyword Parameters
- `policy_attributes`: The policy attributes.
"""
function create_load_balancer_policy(LoadBalancerName, PolicyName, PolicyTypeName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("CreateLoadBalancerPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "PolicyName"=>PolicyName, "PolicyTypeName"=>PolicyTypeName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_load_balancer(load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified load balancer. If you are attempting to recreate a load balancer, you
must reconfigure all settings. The DNS name associated with a deleted load balancer are no
longer usable. The name and associated DNS record of the deleted load balancer no longer
exist and traffic sent to any of its IP addresses is no longer delivered to your instances.
If the load balancer does not exist or has already been deleted, the call to
DeleteLoadBalancer still succeeds.

# Arguments
- `load_balancer_name`: The name of the load balancer.

"""
function delete_load_balancer(LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DeleteLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_load_balancer_listeners(load_balancer_name, load_balancer_ports; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified listeners from the specified load balancer.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `load_balancer_ports`: The client port numbers of the listeners.

"""
function delete_load_balancer_listeners(LoadBalancerName, LoadBalancerPorts; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DeleteLoadBalancerListeners", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "LoadBalancerPorts"=>LoadBalancerPorts), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_load_balancer_policy(load_balancer_name, policy_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified policy from the specified load balancer. This policy must not be
enabled for any listeners.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `policy_name`: The name of the policy.

"""
function delete_load_balancer_policy(LoadBalancerName, PolicyName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DeleteLoadBalancerPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "PolicyName"=>PolicyName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    deregister_instances_from_load_balancer(instances, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deregisters the specified instances from the specified load balancer. After the instance is
deregistered, it no longer receives traffic from the load balancer. You can use
DescribeLoadBalancers to verify that the instance is deregistered from the load balancer.
For more information, see Register or De-Register EC2 Instances in the Classic Load
Balancers Guide.

# Arguments
- `instances`: The IDs of the instances.
- `load_balancer_name`: The name of the load balancer.

"""
function deregister_instances_from_load_balancer(Instances, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DeregisterInstancesFromLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Instances"=>Instances, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_account_limits(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the current Elastic Load Balancing resource limits for your AWS account. For more
information, see Limits for Your Classic Load Balancer in the Classic Load Balancers Guide.

# Keyword Parameters
- `marker`: The marker for the next set of results. (You received this marker from a
  previous call.)
- `page_size`: The maximum number of results to return with this call.
"""
function describe_account_limits(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeAccountLimits", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_instance_health(load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the state of the specified instances with respect to the specified load balancer.
If no instances are specified, the call describes the state of all instances that are
currently registered with the load balancer. If instances are specified, their state is
returned even if they are no longer registered with the load balancer. The state of
terminated instances is not returned.

# Arguments
- `load_balancer_name`: The name of the load balancer.

# Keyword Parameters
- `instances`: The IDs of the instances.
"""
function describe_instance_health(LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeInstanceHealth", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_load_balancer_attributes(load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the attributes for the specified load balancer.

# Arguments
- `load_balancer_name`: The name of the load balancer.

"""
function describe_load_balancer_attributes(LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeLoadBalancerAttributes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_load_balancer_policies(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the specified policies. If you specify a load balancer name, the action returns
the descriptions of all policies created for the load balancer. If you specify a policy
name associated with your load balancer, the action returns the description of that policy.
If you don't specify a load balancer name, the action returns descriptions of the specified
sample policies, or descriptions of all sample policies. The names of the sample policies
have the ELBSample- prefix.

# Keyword Parameters
- `load_balancer_name`: The name of the load balancer.
- `policy_names`: The names of the policies.
"""
function describe_load_balancer_policies(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeLoadBalancerPolicies", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_load_balancer_policy_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the specified load balancer policy types or all load balancer policy types. The
description of each type indicates how it can be used. For example, some policies can be
used only with layer 7 listeners, some policies can be used only with layer 4 listeners,
and some policies can be used only with your EC2 instances. You can use
CreateLoadBalancerPolicy to create a policy configuration for any of these policy types.
Then, depending on the policy type, use either SetLoadBalancerPoliciesOfListener or
SetLoadBalancerPoliciesForBackendServer to set the policy.

# Keyword Parameters
- `policy_type_names`: The names of the policy types. If no names are specified, describes
  all policy types defined by Elastic Load Balancing.
"""
function describe_load_balancer_policy_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeLoadBalancerPolicyTypes", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_load_balancers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the specified the load balancers. If no load balancers are specified, the call
describes all of your load balancers.

# Keyword Parameters
- `load_balancer_names`: The names of the load balancers.
- `marker`: The marker for the next set of results. (You received this marker from a
  previous call.)
- `page_size`: The maximum number of results to return with this call (a number from 1 to
  400). The default is 400.
"""
function describe_load_balancers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeLoadBalancers", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_tags(load_balancer_names; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the tags associated with the specified load balancers.

# Arguments
- `load_balancer_names`: The names of the load balancers.

"""
function describe_tags(LoadBalancerNames; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DescribeTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerNames"=>LoadBalancerNames), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    detach_load_balancer_from_subnets(load_balancer_name, subnets; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified subnets from the set of configured subnets for the load balancer.
After a subnet is removed, all EC2 instances registered with the load balancer in the
removed subnet go into the OutOfService state. Then, the load balancer balances the traffic
among the remaining routable subnets.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `subnets`: The IDs of the subnets.

"""
function detach_load_balancer_from_subnets(LoadBalancerName, Subnets; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DetachLoadBalancerFromSubnets", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "Subnets"=>Subnets), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    disable_availability_zones_for_load_balancer(availability_zones, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified Availability Zones from the set of Availability Zones for the
specified load balancer in EC2-Classic or a default VPC. For load balancers in a
non-default VPC, use DetachLoadBalancerFromSubnets. There must be at least one Availability
Zone registered with a load balancer at all times. After an Availability Zone is removed,
all instances registered with the load balancer that are in the removed Availability Zone
go into the OutOfService state. Then, the load balancer attempts to equally balance the
traffic among its remaining Availability Zones. For more information, see Add or Remove
Availability Zones in the Classic Load Balancers Guide.

# Arguments
- `availability_zones`: The Availability Zones.
- `load_balancer_name`: The name of the load balancer.

"""
function disable_availability_zones_for_load_balancer(AvailabilityZones, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("DisableAvailabilityZonesForLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AvailabilityZones"=>AvailabilityZones, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    enable_availability_zones_for_load_balancer(availability_zones, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified Availability Zones to the set of Availability Zones for the specified
load balancer in EC2-Classic or a default VPC. For load balancers in a non-default VPC, use
AttachLoadBalancerToSubnets. The load balancer evenly distributes requests across all its
registered Availability Zones that contain instances. For more information, see Add or
Remove Availability Zones in the Classic Load Balancers Guide.

# Arguments
- `availability_zones`: The Availability Zones. These must be in the same region as the
  load balancer.
- `load_balancer_name`: The name of the load balancer.

"""
function enable_availability_zones_for_load_balancer(AvailabilityZones, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("EnableAvailabilityZonesForLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AvailabilityZones"=>AvailabilityZones, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    modify_load_balancer_attributes(load_balancer_attributes, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Modifies the attributes of the specified load balancer. You can modify the load balancer
attributes, such as AccessLogs, ConnectionDraining, and CrossZoneLoadBalancing by either
enabling or disabling them. Or, you can modify the load balancer attribute
ConnectionSettings by specifying an idle connection timeout value for your load balancer.
For more information, see the following in the Classic Load Balancers Guide:    Cross-Zone
Load Balancing     Connection Draining     Access Logs     Idle Connection Timeout

# Arguments
- `load_balancer_attributes`: The attributes for the load balancer.
- `load_balancer_name`: The name of the load balancer.

"""
function modify_load_balancer_attributes(LoadBalancerAttributes, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("ModifyLoadBalancerAttributes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerAttributes"=>LoadBalancerAttributes, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    register_instances_with_load_balancer(instances, load_balancer_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified instances to the specified load balancer. The instance must be a running
instance in the same network as the load balancer (EC2-Classic or the same VPC). If you
have EC2-Classic instances and a load balancer in a VPC with ClassicLink enabled, you can
link the EC2-Classic instances to that VPC and then register the linked EC2-Classic
instances with the load balancer in the VPC. Note that RegisterInstanceWithLoadBalancer
completes when the request has been registered. Instance registration takes a little time
to complete. To check the state of the registered instances, use DescribeLoadBalancers or
DescribeInstanceHealth. After the instance is registered, it starts receiving traffic and
requests from the load balancer. Any instance that is not in one of the Availability Zones
registered for the load balancer is moved to the OutOfService state. If an Availability
Zone is added to the load balancer later, any instances registered with the load balancer
move to the InService state. To deregister instances from a load balancer, use
DeregisterInstancesFromLoadBalancer. For more information, see Register or De-Register EC2
Instances in the Classic Load Balancers Guide.

# Arguments
- `instances`: The IDs of the instances.
- `load_balancer_name`: The name of the load balancer.

"""
function register_instances_with_load_balancer(Instances, LoadBalancerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("RegisterInstancesWithLoadBalancer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Instances"=>Instances, "LoadBalancerName"=>LoadBalancerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    remove_tags(load_balancer_names, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes one or more tags from the specified load balancer.

# Arguments
- `load_balancer_names`: The name of the load balancer. You can specify a maximum of one
  load balancer name.
- `tags`: The list of tag keys to remove.

"""
function remove_tags(LoadBalancerNames, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("RemoveTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerNames"=>LoadBalancerNames, "Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_load_balancer_listener_sslcertificate(load_balancer_name, load_balancer_port, sslcertificate_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sets the certificate that terminates the specified listener's SSL connections. The
specified certificate replaces any prior certificate that was used on the same load
balancer and port. For more information about updating your SSL certificate, see Replace
the SSL Certificate for Your Load Balancer in the Classic Load Balancers Guide.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `load_balancer_port`: The port that uses the specified SSL certificate.
- `sslcertificate_id`: The Amazon Resource Name (ARN) of the SSL certificate.

"""
function set_load_balancer_listener_sslcertificate(LoadBalancerName, LoadBalancerPort, SSLCertificateId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("SetLoadBalancerListenerSSLCertificate", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "LoadBalancerPort"=>LoadBalancerPort, "SSLCertificateId"=>SSLCertificateId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_load_balancer_policies_for_backend_server(instance_port, load_balancer_name, policy_names; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Replaces the set of policies associated with the specified port on which the EC2 instance
is listening with a new set of policies. At this time, only the back-end server
authentication policy type can be applied to the instance ports; this policy type is
composed of multiple public key policies. Each time you use
SetLoadBalancerPoliciesForBackendServer to enable the policies, use the PolicyNames
parameter to list the policies that you want to enable. You can use DescribeLoadBalancers
or DescribeLoadBalancerPolicies to verify that the policy is associated with the EC2
instance. For more information about enabling back-end instance authentication, see
Configure Back-end Instance Authentication in the Classic Load Balancers Guide. For more
information about Proxy Protocol, see Configure Proxy Protocol Support in the Classic Load
Balancers Guide.

# Arguments
- `instance_port`: The port number associated with the EC2 instance.
- `load_balancer_name`: The name of the load balancer.
- `policy_names`: The names of the policies. If the list is empty, then all current polices
  are removed from the EC2 instance.

"""
function set_load_balancer_policies_for_backend_server(InstancePort, LoadBalancerName, PolicyNames; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("SetLoadBalancerPoliciesForBackendServer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InstancePort"=>InstancePort, "LoadBalancerName"=>LoadBalancerName, "PolicyNames"=>PolicyNames), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    set_load_balancer_policies_of_listener(load_balancer_name, load_balancer_port, policy_names; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Replaces the current set of policies for the specified load balancer port with the
specified set of policies. To enable back-end server authentication, use
SetLoadBalancerPoliciesForBackendServer. For more information about setting policies, see
Update the SSL Negotiation Configuration, Duration-Based Session Stickiness, and
Application-Controlled Session Stickiness in the Classic Load Balancers Guide.

# Arguments
- `load_balancer_name`: The name of the load balancer.
- `load_balancer_port`: The external port of the load balancer.
- `policy_names`: The names of the policies. This list must include all policies to be
  enabled. If you omit a policy that is currently enabled, it is disabled. If the list is
  empty, all current policies are disabled.

"""
function set_load_balancer_policies_of_listener(LoadBalancerName, LoadBalancerPort, PolicyNames; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_load_balancing("SetLoadBalancerPoliciesOfListener", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("LoadBalancerName"=>LoadBalancerName, "LoadBalancerPort"=>LoadBalancerPort, "PolicyNames"=>PolicyNames), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
