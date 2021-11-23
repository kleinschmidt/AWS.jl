# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: sagemaker_edge
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("agent_metrics" => "AgentMetrics", "models" => "Models")

"""
    get_device_registration(device_fleet_name, device_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Use to check if a device is registered with SageMaker Edge Manager.

# Arguments
- `device_fleet_name`: The name of the fleet that the device belongs to.
- `device_name`: The unique name of the device you want to get the registration status from.

"""
function get_device_registration(DeviceFleetName, DeviceName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return sagemaker_edge("POST", "/GetDeviceRegistration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DeviceFleetName"=>DeviceFleetName, "DeviceName"=>DeviceName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    send_heartbeat(agent_version, device_fleet_name, device_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Use to get the current status of devices registered on SageMaker Edge Manager.

# Arguments
- `agent_version`: Returns the version of the agent.
- `device_fleet_name`: The name of the fleet that the device belongs to.
- `device_name`: The unique name of the device.

# Keyword Parameters
- `agent_metrics`: For internal use. Returns a list of SageMaker Edge Manager agent
  operating metrics.
- `models`: Returns a list of models deployed on the the device.
"""
function send_heartbeat(AgentVersion, DeviceFleetName, DeviceName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return sagemaker_edge("POST", "/SendHeartbeat", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AgentVersion"=>AgentVersion, "DeviceFleetName"=>DeviceFleetName, "DeviceName"=>DeviceName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
