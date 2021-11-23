# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: applicationcostprofiler
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("max_results" => "maxResults", "next_token" => "nextToken")

"""
    delete_report_definition(report_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified report definition in AWS Application Cost Profiler. This stops the
report from being generated.

# Arguments
- `report_id`: Required. ID of the report to delete.

"""
function delete_report_definition(reportId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("DELETE", "/reportDefinition/$(reportId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    get_report_definition(report_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the definition of a report already configured in AWS Application Cost Profiler.

# Arguments
- `report_id`: ID of the report to retrieve.

"""
function get_report_definition(reportId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("GET", "/reportDefinition/$(reportId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    import_application_usage(source_s3_location; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Ingests application usage data from Amazon Simple Storage Service (Amazon S3). The data
must already exist in the S3 location. As part of the action, AWS Application Cost Profiler
copies the object from your S3 bucket to an S3 bucket owned by Amazon for processing
asynchronously.

# Arguments
- `source_s3_location`: Amazon S3 location to import application usage data from.

"""
function import_application_usage(sourceS3Location; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("POST", "/importApplicationUsage", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("sourceS3Location"=>sourceS3Location), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_report_definitions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of all reports and their configurations for your AWS account. The maximum
number of reports is one.

# Keyword Parameters
- `max_results`: The maximum number of results to return.
- `next_token`: The token value from a previous call to access the next page of results.
"""
function list_report_definitions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("GET", "/reportDefinition", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    put_report_definition(destination_s3_location, format, report_description, report_frequency, report_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates the report definition for a report in Application Cost Profiler.

# Arguments
- `destination_s3_location`: Required. Amazon Simple Storage Service (Amazon S3) location
  where Application Cost Profiler uploads the report.
- `format`: Required. The format to use for the generated report.
- `report_description`: Required. Description of the report.
- `report_frequency`: Required. The cadence to generate the report.
- `report_id`: Required. ID of the report. You can choose any valid string matching the
  pattern for the ID.

"""
function put_report_definition(destinationS3Location, format, reportDescription, reportFrequency, reportId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("POST", "/reportDefinition", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationS3Location"=>destinationS3Location, "format"=>format, "reportDescription"=>reportDescription, "reportFrequency"=>reportFrequency, "reportId"=>reportId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_report_definition(destination_s3_location, format, report_description, report_frequency, report_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates existing report in AWS Application Cost Profiler.

# Arguments
- `destination_s3_location`: Required. Amazon Simple Storage Service (Amazon S3) location
  where Application Cost Profiler uploads the report.
- `format`: Required. The format to use for the generated report.
- `report_description`: Required. Description of the report.
- `report_frequency`: Required. The cadence to generate the report.
- `report_id`: Required. ID of the report to update.

"""
function update_report_definition(destinationS3Location, format, reportDescription, reportFrequency, reportId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return applicationcostprofiler("PUT", "/reportDefinition/$(reportId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationS3Location"=>destinationS3Location, "format"=>format, "reportDescription"=>reportDescription, "reportFrequency"=>reportFrequency), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
