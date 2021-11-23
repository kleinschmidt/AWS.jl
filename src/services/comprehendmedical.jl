# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: comprehendmedical
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("client_request_token" => "ClientRequestToken", "job_name" => "JobName", "kmskey" => "KMSKey", "filter" => "Filter", "max_results" => "MaxResults", "next_token" => "NextToken")

"""
    describe_entities_detection_v2_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the properties associated with a medical entities detection job. Use this operation to
get the status of a detection job.

# Arguments
- `job_id`: The identifier that Amazon Comprehend Medical generated for the job. The
  StartEntitiesDetectionV2Job operation returns this identifier in its response.

"""
function describe_entities_detection_v2_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DescribeEntitiesDetectionV2Job", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_icd10_cminference_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the properties associated with an InferICD10CM job. Use this operation to get the
status of an inference job.

# Arguments
- `job_id`: The identifier that Amazon Comprehend Medical generated for the job. The
  StartICD10CMInferenceJob operation returns this identifier in its response.

"""
function describe_icd10_cminference_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DescribeICD10CMInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_phidetection_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the properties associated with a protected health information (PHI) detection job. Use
this operation to get the status of a detection job.

# Arguments
- `job_id`: The identifier that Amazon Comprehend Medical generated for the job. The
  StartPHIDetectionJob operation returns this identifier in its response.

"""
function describe_phidetection_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DescribePHIDetectionJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_rx_norm_inference_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the properties associated with an InferRxNorm job. Use this operation to get the
status of an inference job.

# Arguments
- `job_id`: The identifier that Amazon Comprehend Medical generated for the job. The
  StartRxNormInferenceJob operation returns this identifier in its response.

"""
function describe_rx_norm_inference_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DescribeRxNormInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    detect_entities(text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The DetectEntities operation is deprecated. You should use the DetectEntitiesV2 operation
instead.  Inspects the clinical text for a variety of medical entities and returns specific
information about them such as entity category, location, and confidence score on that
information .

# Arguments
- `text`:  A UTF-8 text string containing the clinical content being examined for entities.
  Each string must contain fewer than 20,000 bytes of characters.

"""
function detect_entities(Text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DetectEntities", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Text"=>Text), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    detect_entities_v2(text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Inspects the clinical text for a variety of medical entities and returns specific
information about them such as entity category, location, and confidence score on that
information. Amazon Comprehend Medical only detects medical entities in English language
texts. The DetectEntitiesV2 operation replaces the DetectEntities operation. This new
action uses a different model for determining the entities in your medical text and changes
the way that some entities are returned in the output. You should use the DetectEntitiesV2
operation in all new applications. The DetectEntitiesV2 operation returns the Acuity and
Direction entities as attributes instead of types.

# Arguments
- `text`: A UTF-8 string containing the clinical content being examined for entities. Each
  string must contain fewer than 20,000 bytes of characters.

"""
function detect_entities_v2(Text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DetectEntitiesV2", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Text"=>Text), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    detect_phi(text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Inspects the clinical text for protected health information (PHI) entities and returns the
entity category, location, and confidence score for each entity. Amazon Comprehend Medical
only detects entities in English language texts.

# Arguments
- `text`:  A UTF-8 text string containing the clinical content being examined for PHI
  entities. Each string must contain fewer than 20,000 bytes of characters.

"""
function detect_phi(Text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("DetectPHI", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Text"=>Text), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    infer_icd10_cm(text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

InferICD10CM detects medical conditions as entities listed in a patient record and links
those entities to normalized concept identifiers in the ICD-10-CM knowledge base from the
Centers for Disease Control. Amazon Comprehend Medical only detects medical entities in
English language texts.

# Arguments
- `text`: The input text used for analysis. The input for InferICD10CM is a string from 1
  to 10000 characters.

"""
function infer_icd10_cm(Text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("InferICD10CM", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Text"=>Text), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    infer_rx_norm(text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

InferRxNorm detects medications as entities listed in a patient record and links to the
normalized concept identifiers in the RxNorm database from the National Library of
Medicine. Amazon Comprehend Medical only detects medical entities in English language
texts.

# Arguments
- `text`: The input text used for analysis. The input for InferRxNorm is a string from 1 to
  10000 characters.

"""
function infer_rx_norm(Text; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("InferRxNorm", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Text"=>Text), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_entities_detection_v2_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of medical entity detection jobs that you have submitted.

# Keyword Parameters
- `filter`: Filters the jobs that are returned. You can filter jobs based on their names,
  status, or the date and time that they were submitted. You can only set one filter at a
  time.
- `max_results`: The maximum number of results to return in each page. The default is 100.
- `next_token`: Identifies the next page of results to return.
"""
function list_entities_detection_v2_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("ListEntitiesDetectionV2Jobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_icd10_cminference_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of InferICD10CM jobs that you have submitted.

# Keyword Parameters
- `filter`: Filters the jobs that are returned. You can filter jobs based on their names,
  status, or the date and time that they were submitted. You can only set one filter at a
  time.
- `max_results`: The maximum number of results to return in each page. The default is 100.
- `next_token`: Identifies the next page of results to return.
"""
function list_icd10_cminference_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("ListICD10CMInferenceJobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_phidetection_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of protected health information (PHI) detection jobs that you have submitted.

# Keyword Parameters
- `filter`: Filters the jobs that are returned. You can filter jobs based on their names,
  status, or the date and time that they were submitted. You can only set one filter at a
  time.
- `max_results`: The maximum number of results to return in each page. The default is 100.
- `next_token`: Identifies the next page of results to return.
"""
function list_phidetection_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("ListPHIDetectionJobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_rx_norm_inference_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of InferRxNorm jobs that you have submitted.

# Keyword Parameters
- `filter`: Filters the jobs that are returned. You can filter jobs based on their names,
  status, or the date and time that they were submitted. You can only set one filter at a
  time.
- `max_results`: Identifies the next page of results to return.
- `next_token`: Identifies the next page of results to return.
"""
function list_rx_norm_inference_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("ListRxNormInferenceJobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_entities_detection_v2_job(data_access_role_arn, input_data_config, language_code, output_data_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an asynchronous medical entity detection job for a collection of documents. Use the
DescribeEntitiesDetectionV2Job operation to track the status of a job.

# Arguments
- `data_access_role_arn`: The Amazon Resource Name (ARN) of the AWS Identity and Access
  Management (IAM) role that grants Amazon Comprehend Medical read access to your input data.
  For more information, see  Role-Based Permissions Required for Asynchronous Operations.
- `input_data_config`: Specifies the format and location of the input data for the job.
- `language_code`: The language of the input documents. All documents must be in the same
  language.
- `output_data_config`: Specifies where to send the output files.

# Keyword Parameters
- `client_request_token`: A unique identifier for the request. If you don't set the client
  request token, Amazon Comprehend Medical generates one.
- `job_name`: The identifier of the job.
- `kmskey`: An AWS Key Management Service key to encrypt your output files. If you do not
  specify a key, the files are written in plain text.
"""
function start_entities_detection_v2_job(DataAccessRoleArn, InputDataConfig, LanguageCode, OutputDataConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StartEntitiesDetectionV2Job", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DataAccessRoleArn"=>DataAccessRoleArn, "InputDataConfig"=>InputDataConfig, "LanguageCode"=>LanguageCode, "OutputDataConfig"=>OutputDataConfig, "client_request_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_icd10_cminference_job(data_access_role_arn, input_data_config, language_code, output_data_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM
ontology. Use the DescribeICD10CMInferenceJob operation to track the status of a job.

# Arguments
- `data_access_role_arn`: The Amazon Resource Name (ARN) of the AWS Identity and Access
  Management (IAM) role that grants Amazon Comprehend Medical read access to your input data.
  For more information, see  Role-Based Permissions Required for Asynchronous Operations.
- `input_data_config`: Specifies the format and location of the input data for the job.
- `language_code`: The language of the input documents. All documents must be in the same
  language.
- `output_data_config`: Specifies where to send the output files.

# Keyword Parameters
- `client_request_token`: A unique identifier for the request. If you don't set the client
  request token, Amazon Comprehend Medical generates one.
- `job_name`: The identifier of the job.
- `kmskey`: An AWS Key Management Service key to encrypt your output files. If you do not
  specify a key, the files are written in plain text.
"""
function start_icd10_cminference_job(DataAccessRoleArn, InputDataConfig, LanguageCode, OutputDataConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StartICD10CMInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DataAccessRoleArn"=>DataAccessRoleArn, "InputDataConfig"=>InputDataConfig, "LanguageCode"=>LanguageCode, "OutputDataConfig"=>OutputDataConfig, "client_request_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_phidetection_job(data_access_role_arn, input_data_config, language_code, output_data_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an asynchronous job to detect protected health information (PHI). Use the
DescribePHIDetectionJob operation to track the status of a job.

# Arguments
- `data_access_role_arn`: The Amazon Resource Name (ARN) of the AWS Identity and Access
  Management (IAM) role that grants Amazon Comprehend Medical read access to your input data.
  For more information, see  Role-Based Permissions Required for Asynchronous Operations.
- `input_data_config`: Specifies the format and location of the input data for the job.
- `language_code`: The language of the input documents. All documents must be in the same
  language.
- `output_data_config`: Specifies where to send the output files.

# Keyword Parameters
- `client_request_token`: A unique identifier for the request. If you don't set the client
  request token, Amazon Comprehend Medical generates one.
- `job_name`: The identifier of the job.
- `kmskey`: An AWS Key Management Service key to encrypt your output files. If you do not
  specify a key, the files are written in plain text.
"""
function start_phidetection_job(DataAccessRoleArn, InputDataConfig, LanguageCode, OutputDataConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StartPHIDetectionJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DataAccessRoleArn"=>DataAccessRoleArn, "InputDataConfig"=>InputDataConfig, "LanguageCode"=>LanguageCode, "OutputDataConfig"=>OutputDataConfig, "client_request_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_rx_norm_inference_job(data_access_role_arn, input_data_config, language_code, output_data_config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an asynchronous job to detect medication entities and link them to the RxNorm
ontology. Use the DescribeRxNormInferenceJob operation to track the status of a job.

# Arguments
- `data_access_role_arn`: The Amazon Resource Name (ARN) of the AWS Identity and Access
  Management (IAM) role that grants Amazon Comprehend Medical read access to your input data.
  For more information, see  Role-Based Permissions Required for Asynchronous Operations.
- `input_data_config`: Specifies the format and location of the input data for the job.
- `language_code`: The language of the input documents. All documents must be in the same
  language.
- `output_data_config`: Specifies where to send the output files.

# Keyword Parameters
- `client_request_token`: A unique identifier for the request. If you don't set the client
  request token, Amazon Comprehend Medical generates one.
- `job_name`: The identifier of the job.
- `kmskey`: An AWS Key Management Service key to encrypt your output files. If you do not
  specify a key, the files are written in plain text.
"""
function start_rx_norm_inference_job(DataAccessRoleArn, InputDataConfig, LanguageCode, OutputDataConfig; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StartRxNormInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DataAccessRoleArn"=>DataAccessRoleArn, "InputDataConfig"=>InputDataConfig, "LanguageCode"=>LanguageCode, "OutputDataConfig"=>OutputDataConfig, "client_request_token"=>string(uuid4())), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_entities_detection_v2_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a medical entities detection job in progress.

# Arguments
- `job_id`: The identifier of the medical entities job to stop.

"""
function stop_entities_detection_v2_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StopEntitiesDetectionV2Job", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_icd10_cminference_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops an InferICD10CM inference job in progress.

# Arguments
- `job_id`: The identifier of the job.

"""
function stop_icd10_cminference_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StopICD10CMInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_phidetection_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops a protected health information (PHI) detection job in progress.

# Arguments
- `job_id`: The identifier of the PHI detection job to stop.

"""
function stop_phidetection_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StopPHIDetectionJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_rx_norm_inference_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops an InferRxNorm inference job in progress.

# Arguments
- `job_id`: The identifier of the job.

"""
function stop_rx_norm_inference_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return comprehendmedical("StopRxNormInferenceJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
