# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: lookoutequipment
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = AWS.LittleDict("data_delay_offset_in_minutes" => "DataDelayOffsetInMinutes", "server_side_kms_key_id" => "ServerSideKmsKeyId", "tags" => "Tags", "data_input_configuration" => "DataInputConfiguration", "data_output_configuration" => "DataOutputConfiguration", "data_upload_frequency" => "DataUploadFrequency", "role_arn" => "RoleArn", "dataset_name_begins_with" => "DatasetNameBeginsWith", "max_results" => "MaxResults", "next_token" => "NextToken", "data_pre_processing_configuration" => "DataPreProcessingConfiguration", "dataset_schema" => "DatasetSchema", "evaluation_data_end_time" => "EvaluationDataEndTime", "evaluation_data_start_time" => "EvaluationDataStartTime", "labels_input_configuration" => "LabelsInputConfiguration", "off_condition" => "OffCondition", "training_data_end_time" => "TrainingDataEndTime", "training_data_start_time" => "TrainingDataStartTime", "data_end_time_before" => "DataEndTimeBefore", "data_start_time_after" => "DataStartTimeAfter", "status" => "Status", "model_name_begins_with" => "ModelNameBeginsWith", "dataset_name" => "DatasetName", "inference_scheduler_name_begins_with" => "InferenceSchedulerNameBeginsWith", "model_name" => "ModelName")

"""
    create_dataset(client_token, dataset_name, dataset_schema; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a container for a collection of data being ingested for analysis. The dataset
contains the metadata describing where the data is and what the data actually looks like.
In other words, it contains the location of the data source, the data schema, and other
information. A dataset also contains any tags associated with the ingested data.

# Arguments
- `client_token`:  A unique identifier for the request. If you do not set the client
  request token, Amazon Lookout for Equipment generates one.
- `dataset_name`: The name of the dataset being created.
- `dataset_schema`: A JSON description of the data that is in each time series dataset,
  including names, column names, and data types.

# Keyword Parameters
- `server_side_kms_key_id`: Provides the identifier of the KMS key used to encrypt dataset
  data by Amazon Lookout for Equipment.
- `tags`: Any tags associated with the ingested data described in the dataset.
"""
function create_dataset(ClientToken, DatasetName, DatasetSchema; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("CreateDataset", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DatasetName"=>DatasetName, "DatasetSchema"=>DatasetSchema), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_inference_scheduler(client_token, data_input_configuration, data_output_configuration, data_upload_frequency, inference_scheduler_name, model_name, role_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Creates a scheduled inference. Scheduling an inference is setting up a continuous
real-time inference plan to analyze new measurement data. When setting up the schedule, you
provide an S3 bucket location for the input data, assign it a delimiter between separate
entries in the data, set an offset delay if desired, and set the frequency of inferencing.
You must also provide an S3 bucket location for the output data.

# Arguments
- `client_token`:  A unique identifier for the request. If you do not set the client
  request token, Amazon Lookout for Equipment generates one.
- `data_input_configuration`: Specifies configuration information for the input data for
  the inference scheduler, including delimiter, format, and dataset location.
- `data_output_configuration`: Specifies configuration information for the output results
  for the inference scheduler, including the S3 location for the output.
- `data_upload_frequency`:  How often data is uploaded to the source S3 bucket for the
  input data. The value chosen is the length of time between data uploads. For instance, if
  you select 5 minutes, Amazon Lookout for Equipment will upload the real-time data to the
  source bucket once every 5 minutes. This frequency also determines how often Amazon Lookout
  for Equipment starts a scheduled inference on your data. In this example, it starts once
  every 5 minutes.
- `inference_scheduler_name`: The name of the inference scheduler being created.
- `model_name`: The name of the previously trained ML model being used to create the
  inference scheduler.
- `role_arn`: The Amazon Resource Name (ARN) of a role with permission to access the data
  source being used for the inference.

# Keyword Parameters
- `data_delay_offset_in_minutes`: A period of time (in minutes) by which inference on the
  data is delayed after the data starts. For instance, if you select an offset delay time of
  five minutes, inference will not begin on the data until the first data measurement after
  the five minute mark. For example, if five minutes is selected, the inference scheduler
  will wake up at the configured frequency with the additional five minute delay time to
  check the customer S3 bucket. The customer can upload data at the same frequency and they
  don't need to stop and restart the scheduler when uploading new data.
- `server_side_kms_key_id`: Provides the identifier of the KMS key used to encrypt
  inference scheduler data by Amazon Lookout for Equipment.
- `tags`: Any tags associated with the inference scheduler.
"""
function create_inference_scheduler(ClientToken, DataInputConfiguration, DataOutputConfiguration, DataUploadFrequency, InferenceSchedulerName, ModelName, RoleArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("CreateInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DataInputConfiguration"=>DataInputConfiguration, "DataOutputConfiguration"=>DataOutputConfiguration, "DataUploadFrequency"=>DataUploadFrequency, "InferenceSchedulerName"=>InferenceSchedulerName, "ModelName"=>ModelName, "RoleArn"=>RoleArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_model(client_token, dataset_name, model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an ML model for data inference.  A machine-learning (ML) model is a mathematical
model that finds patterns in your data. In Amazon Lookout for Equipment, the model learns
the patterns of normal behavior and detects abnormal behavior that could be potential
equipment failure (or maintenance events). The models are made by analyzing normal data and
abnormalities in machine behavior that have already occurred. Your model is trained using a
portion of the data from your dataset and uses that data to learn patterns of normal
behavior and abnormal patterns that lead to equipment failure. Another portion of the data
is used to evaluate the model's accuracy.

# Arguments
- `client_token`: A unique identifier for the request. If you do not set the client request
  token, Amazon Lookout for Equipment generates one.
- `dataset_name`: The name of the dataset for the ML model being created.
- `model_name`: The name for the ML model to be created.

# Keyword Parameters
- `data_pre_processing_configuration`: The configuration is the TargetSamplingRate, which
  is the sampling rate of the data after post processing by Amazon Lookout for Equipment. For
  example, if you provide data that has been collected at a 1 second level and you want the
  system to resample the data at a 1 minute rate before training, the TargetSamplingRate is 1
  minute. When providing a value for the TargetSamplingRate, you must attach the prefix
  \"PT\" to the rate you want. The value for a 1 second rate is therefore PT1S, the value for
  a 15 minute rate is PT15M, and the value for a 1 hour rate is PT1H
- `dataset_schema`: The data schema for the ML model being created.
- `evaluation_data_end_time`:  Indicates the time reference in the dataset that should be
  used to end the subset of evaluation data for the ML model.
- `evaluation_data_start_time`: Indicates the time reference in the dataset that should be
  used to begin the subset of evaluation data for the ML model.
- `labels_input_configuration`: The input configuration for the labels being used for the
  ML model that's being created.
- `off_condition`: Indicates that the asset associated with this sensor has been shut off.
  As long as this condition is met, Lookout for Equipment will not use data from this asset
  for training, evaluation, or inference.
- `role_arn`:  The Amazon Resource Name (ARN) of a role with permission to access the data
  source being used to create the ML model.
- `server_side_kms_key_id`: Provides the identifier of the KMS key used to encrypt model
  data by Amazon Lookout for Equipment.
- `tags`:  Any tags associated with the ML model being created.
- `training_data_end_time`: Indicates the time reference in the dataset that should be used
  to end the subset of training data for the ML model.
- `training_data_start_time`: Indicates the time reference in the dataset that should be
  used to begin the subset of training data for the ML model.
"""
function create_model(ClientToken, DatasetName, ModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("CreateModel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DatasetName"=>DatasetName, "ModelName"=>ModelName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_dataset(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Deletes a dataset and associated artifacts. The operation will check to see if any
inference scheduler or data ingestion job is currently using the dataset, and if there
isn't, the dataset, its metadata, and any associated data stored in S3 will be deleted.
This does not affect any models that used this dataset for training and evaluation, but
does prevent it from being used in the future.

# Arguments
- `dataset_name`: The name of the dataset to be deleted.

"""
function delete_dataset(DatasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DeleteDataset", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DatasetName"=>DatasetName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_inference_scheduler(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an inference scheduler that has been set up. Already processed output results are
not affected.

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler to be deleted.

"""
function delete_inference_scheduler(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DeleteInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_model(model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes an ML model currently available for Amazon Lookout for Equipment. This will prevent
it from being used with an inference scheduler, even one that is already set up.

# Arguments
- `model_name`: The name of the ML model to be deleted.

"""
function delete_model(ModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DeleteModel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ModelName"=>ModelName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_data_ingestion_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides information on a specific data ingestion job such as creation time, dataset ARN,
status, and so on.

# Arguments
- `job_id`: The job ID of the data ingestion job.

"""
function describe_data_ingestion_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DescribeDataIngestionJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_dataset(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides a JSON description of the data that is in each time series dataset, including
names, column names, and data types.

# Arguments
- `dataset_name`: The name of the dataset to be described.

"""
function describe_dataset(DatasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DescribeDataset", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DatasetName"=>DatasetName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_inference_scheduler(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Specifies information about the inference scheduler being used, including name, model,
status, and associated metadata

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler being described.

"""
function describe_inference_scheduler(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DescribeInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    describe_model(model_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides a JSON containing the overall information about a specific ML model, including
model name and ARN, dataset, training and evaluation information, status, and so on.

# Arguments
- `model_name`: The name of the ML model to be described.

"""
function describe_model(ModelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("DescribeModel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ModelName"=>ModelName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_data_ingestion_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides a list of all data ingestion jobs, including dataset name and ARN, S3 location of
the input data, status, and so on.

# Keyword Parameters
- `dataset_name`: The name of the dataset being used for the data ingestion job.
- `max_results`:  Specifies the maximum number of data ingestion jobs to list.
- `next_token`:  An opaque pagination token indicating where to continue the listing of
  data ingestion jobs.
- `status`: Indicates the status of the data ingestion job.
"""
function list_data_ingestion_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListDataIngestionJobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_datasets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all datasets currently available in your account, filtering on the dataset name.

# Keyword Parameters
- `dataset_name_begins_with`: The beginning of the name of the datasets to be listed.
- `max_results`:  Specifies the maximum number of datasets to list.
- `next_token`:  An opaque pagination token indicating where to continue the listing of
  datasets.
"""
function list_datasets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListDatasets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_inference_executions(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Lists all inference executions that have been performed by the specified inference
scheduler.

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler for the inference
  execution listed.

# Keyword Parameters
- `data_end_time_before`: The time reference in the inferenced dataset before which Amazon
  Lookout for Equipment stopped the inference execution.
- `data_start_time_after`: The time reference in the inferenced dataset after which Amazon
  Lookout for Equipment started the inference execution.
- `max_results`: Specifies the maximum number of inference executions to list.
- `next_token`: An opaque pagination token indicating where to continue the listing of
  inference executions.
- `status`: The status of the inference execution.
"""
function list_inference_executions(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListInferenceExecutions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_inference_schedulers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of all inference schedulers currently available for your account.

# Keyword Parameters
- `inference_scheduler_name_begins_with`: The beginning of the name of the inference
  schedulers to be listed.
- `max_results`:  Specifies the maximum number of inference schedulers to list.
- `model_name`: The name of the ML model used by the inference scheduler to be listed.
- `next_token`:  An opaque pagination token indicating where to continue the listing of
  inference schedulers.
"""
function list_inference_schedulers(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListInferenceSchedulers", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_models(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Generates a list of all models in the account, including model name and ARN, dataset, and
status.

# Keyword Parameters
- `dataset_name_begins_with`: The beginning of the name of the dataset of the ML models to
  be listed.
- `max_results`:  Specifies the maximum number of ML models to list.
- `model_name_begins_with`: The beginning of the name of the ML models being listed.
- `next_token`:  An opaque pagination token indicating where to continue the listing of ML
  models.
- `status`: The status of the ML model.
"""
function list_models(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListModels", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all the tags for a specified resource, including key and value.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource (such as the dataset or
  model) that is the focus of the ListTagsForResource operation.

"""
function list_tags_for_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_data_ingestion_job(client_token, dataset_name, ingestion_input_configuration, role_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts a data ingestion job. Amazon Lookout for Equipment returns the job status.

# Arguments
- `client_token`:  A unique identifier for the request. If you do not set the client
  request token, Amazon Lookout for Equipment generates one.
- `dataset_name`: The name of the dataset being used by the data ingestion job.
- `ingestion_input_configuration`:  Specifies information for the input data for the data
  ingestion job, including dataset S3 location.
- `role_arn`:  The Amazon Resource Name (ARN) of a role with permission to access the data
  source for the data ingestion job.

"""
function start_data_ingestion_job(ClientToken, DatasetName, IngestionInputConfiguration, RoleArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("StartDataIngestionJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DatasetName"=>DatasetName, "IngestionInputConfiguration"=>IngestionInputConfiguration, "RoleArn"=>RoleArn), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    start_inference_scheduler(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an inference scheduler.

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler to be started.

"""
function start_inference_scheduler(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("StartInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    stop_inference_scheduler(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops an inference scheduler.

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler to be stopped.

"""
function stop_inference_scheduler(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("StopInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates a given tag to a resource in your account. A tag is a key-value pair which can
be added to an Amazon Lookout for Equipment resource as metadata. Tags can be used for
organizing your resources as well as helping you to search and filter by tag. Multiple tags
can be added to a resource, either when you create it, or later. Up to 50 tags can be
associated with each resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the specific resource to which the tag
  should be associated.
- `tags`: The tag or tags to be associated with a specific resource. Both the tag key and
  value are specified.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "Tags"=>Tags), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a specific tag from a given resource. The tag is specified by its key.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to which the tag is
  currently associated.
- `tag_keys`: Specifies the key of the tag to be removed from a specified resource.

"""
function untag_resource(ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_inference_scheduler(inference_scheduler_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates an inference scheduler.

# Arguments
- `inference_scheduler_name`: The name of the inference scheduler to be updated.

# Keyword Parameters
- `data_delay_offset_in_minutes`:  A period of time (in minutes) by which inference on the
  data is delayed after the data starts. For instance, if you select an offset delay time of
  five minutes, inference will not begin on the data until the first data measurement after
  the five minute mark. For example, if five minutes is selected, the inference scheduler
  will wake up at the configured frequency with the additional five minute delay time to
  check the customer S3 bucket. The customer can upload data at the same frequency and they
  don't need to stop and restart the scheduler when uploading new data.
- `data_input_configuration`:  Specifies information for the input data for the inference
  scheduler, including delimiter, format, and dataset location.
- `data_output_configuration`:  Specifies information for the output results from the
  inference scheduler, including the output S3 location.
- `data_upload_frequency`: How often data is uploaded to the source S3 bucket for the input
  data. The value chosen is the length of time between data uploads. For instance, if you
  select 5 minutes, Amazon Lookout for Equipment will upload the real-time data to the source
  bucket once every 5 minutes. This frequency also determines how often Amazon Lookout for
  Equipment starts a scheduled inference on your data. In this example, it starts once every
  5 minutes.
- `role_arn`:  The Amazon Resource Name (ARN) of a role with permission to access the data
  source for the inference scheduler.
"""
function update_inference_scheduler(InferenceSchedulerName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(SERVICE_PARAMETER_MAP, kwargs)
    return lookoutequipment("UpdateInferenceScheduler", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InferenceSchedulerName"=>InferenceSchedulerName), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
