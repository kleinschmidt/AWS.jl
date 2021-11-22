# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: elastic_transcoder
using AWS.Compat
using AWS.UUIDs

# Julia syntax for service-level optional parameters to the AWS request syntax
const SERVICE_PARAMETER_MAP = OrderedCollections.LittleDict("ascending" => "Ascending", "page_token" => "PageToken", "aws_kms_key_arn" => "AwsKmsKeyArn", "content_config" => "ContentConfig", "notifications" => "Notifications", "output_bucket" => "OutputBucket", "thumbnail_config" => "ThumbnailConfig", "input_bucket" => "InputBucket", "name" => "Name", "role" => "Role", "input" => "Input", "inputs" => "Inputs", "output" => "Output", "output_key_prefix" => "OutputKeyPrefix", "outputs" => "Outputs", "playlists" => "Playlists", "user_metadata" => "UserMetadata", "audio" => "Audio", "description" => "Description", "thumbnails" => "Thumbnails", "video" => "Video")

"""
    cancel_job(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The CancelJob operation cancels an unfinished job.  You can only cancel a job that has a
status of Submitted. To prevent a pipeline from starting to process a job while you're
getting the job identifier, use UpdatePipelineStatus to temporarily pause the pipeline.

# Arguments
- `id`: The identifier of the job that you want to cancel. To get a list of the jobs
  (including their jobId) that have a status of Submitted, use the ListJobsByStatus API
  action.

"""
function cancel_job(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("DELETE", "/2012-09-25/jobs/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_job(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

When you create a job, Elastic Transcoder returns JSON data that includes the values that
you specified plus information about the job that is created. If you have specified more
than one output for your jobs (for example, one output for the Kindle Fire and another
output for the Apple iPhone 4s), you currently must use the Elastic Transcoder API to list
the jobs (as opposed to the AWS Console).

# Arguments
- `pipeline_id`: The Id of the pipeline that you want Elastic Transcoder to use for
  transcoding. The pipeline determines several settings, including the Amazon S3 bucket from
  which Elastic Transcoder gets the files to transcode and the bucket into which Elastic
  Transcoder puts the transcoded files.

# Keyword Parameters
- `input`: A section of the request body that provides information about the file that is
  being transcoded.
- `inputs`: A section of the request body that provides information about the files that
  are being transcoded.
- `output`:  A section of the request body that provides information about the transcoded
  (target) file. We strongly recommend that you use the Outputs syntax instead of the Output
  syntax.
- `output_key_prefix`: The value, if any, that you want Elastic Transcoder to prepend to
  the names of all files that this job creates, including output files, thumbnails, and
  playlists.
- `outputs`:  A section of the request body that provides information about the transcoded
  (target) files. We recommend that you use the Outputs syntax instead of the Output syntax.
- `playlists`: If you specify a preset in PresetId for which the value of Container is fmp4
  (Fragmented MP4) or ts (MPEG-TS), Playlists contains information about the master playlists
  that you want Elastic Transcoder to create. The maximum number of master playlists in a job
  is 30.
- `user_metadata`: User-defined metadata that you want to associate with an Elastic
  Transcoder job. You specify metadata in key/value pairs, and you can add up to 10 key/value
  pairs per job. Elastic Transcoder does not guarantee that key/value pairs are returned in
  the same order in which you specify them.
"""
function create_job(PipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/jobs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PipelineId"=>PipelineId), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_pipeline(input_bucket, name, role; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The CreatePipeline operation creates a pipeline with settings that you specify.

# Arguments
- `input_bucket`: The Amazon S3 bucket in which you saved the media files that you want to
  transcode.
- `name`: The name of the pipeline. We recommend that the name be unique within the AWS
  account, but uniqueness is not enforced. Constraints: Maximum 40 characters.
- `role`: The IAM Amazon Resource Name (ARN) for the role that you want Elastic Transcoder
  to use to create the pipeline.

# Keyword Parameters
- `aws_kms_key_arn`: The AWS Key Management Service (AWS KMS) key that you want to use with
  this pipeline. If you use either s3 or s3-aws-kms as your Encryption:Mode, you don't need
  to provide a key with your job because a default key, known as an AWS-KMS key, is created
  for you automatically. You need to provide an AWS-KMS key only if you want to use a
  non-default AWS-KMS key, or if you are using an Encryption:Mode of aes-cbc-pkcs7, aes-ctr,
  or aes-gcm.
- `content_config`: The optional ContentConfig object specifies information about the
  Amazon S3 bucket in which you want Elastic Transcoder to save transcoded files and
  playlists: which bucket to use, which users you want to have access to the files, the type
  of access you want users to have, and the storage class that you want to assign to the
  files. If you specify values for ContentConfig, you must also specify values for
  ThumbnailConfig. If you specify values for ContentConfig and ThumbnailConfig, omit the
  OutputBucket object.    Bucket: The Amazon S3 bucket in which you want Elastic Transcoder
  to save transcoded files and playlists.    Permissions (Optional): The Permissions object
  specifies which users you want to have access to transcoded files and the type of access
  you want them to have. You can grant permissions to a maximum of 30 users and/or predefined
  Amazon S3 groups.    Grantee Type: Specify the type of value that appears in the Grantee
  object:     Canonical: The value in the Grantee object is either the canonical user ID for
  an AWS account or an origin access identity for an Amazon CloudFront distribution. For more
  information about canonical user IDs, see Access Control List (ACL) Overview in the Amazon
  Simple Storage Service Developer Guide. For more information about using CloudFront origin
  access identities to require that users use CloudFront URLs instead of Amazon S3 URLs, see
  Using an Origin Access Identity to Restrict Access to Your Amazon S3 Content.  A canonical
  user ID is not the same as an AWS account number.     Email: The value in the Grantee
  object is the registered email address of an AWS account.    Group: The value in the
  Grantee object is one of the following predefined Amazon S3 groups: AllUsers,
  AuthenticatedUsers, or LogDelivery.      Grantee: The AWS user or group that you want to
  have access to transcoded files and playlists. To identify the user or group, you can
  specify the canonical user ID for an AWS account, an origin access identity for a
  CloudFront distribution, the registered email address of an AWS account, or a predefined
  Amazon S3 group     Access: The permission that you want to give to the AWS user that you
  specified in Grantee. Permissions are granted on the files that Elastic Transcoder adds to
  the bucket, including playlists and video files. Valid values include:     READ: The
  grantee can read the objects and metadata for objects that Elastic Transcoder adds to the
  Amazon S3 bucket.    READ_ACP: The grantee can read the object ACL for objects that Elastic
  Transcoder adds to the Amazon S3 bucket.    WRITE_ACP: The grantee can write the ACL for
  the objects that Elastic Transcoder adds to the Amazon S3 bucket.    FULL_CONTROL: The
  grantee has READ, READ_ACP, and WRITE_ACP permissions for the objects that Elastic
  Transcoder adds to the Amazon S3 bucket.      StorageClass: The Amazon S3 storage class,
  Standard or ReducedRedundancy, that you want Elastic Transcoder to assign to the video
  files and playlists that it stores in your Amazon S3 bucket.
- `notifications`: The Amazon Simple Notification Service (Amazon SNS) topic that you want
  to notify to report job status.  To receive notifications, you must also subscribe to the
  new topic in the Amazon SNS console.     Progressing: The topic ARN for the Amazon Simple
  Notification Service (Amazon SNS) topic that you want to notify when Elastic Transcoder has
  started to process a job in this pipeline. This is the ARN that Amazon SNS returned when
  you created the topic. For more information, see Create a Topic in the Amazon Simple
  Notification Service Developer Guide.    Complete: The topic ARN for the Amazon SNS topic
  that you want to notify when Elastic Transcoder has finished processing a job in this
  pipeline. This is the ARN that Amazon SNS returned when you created the topic.    Warning:
  The topic ARN for the Amazon SNS topic that you want to notify when Elastic Transcoder
  encounters a warning condition while processing a job in this pipeline. This is the ARN
  that Amazon SNS returned when you created the topic.    Error: The topic ARN for the Amazon
  SNS topic that you want to notify when Elastic Transcoder encounters an error condition
  while processing a job in this pipeline. This is the ARN that Amazon SNS returned when you
  created the topic.
- `output_bucket`: The Amazon S3 bucket in which you want Elastic Transcoder to save the
  transcoded files. (Use this, or use ContentConfig:Bucket plus ThumbnailConfig:Bucket.)
  Specify this value when all of the following are true:   You want to save transcoded files,
  thumbnails (if any), and playlists (if any) together in one bucket.   You do not want to
  specify the users or groups who have access to the transcoded files, thumbnails, and
  playlists.   You do not want to specify the permissions that Elastic Transcoder grants to
  the files.   When Elastic Transcoder saves files in OutputBucket, it grants full control
  over the files only to the AWS account that owns the role that is specified by Role.    You
  want to associate the transcoded files and thumbnails with the Amazon S3 Standard storage
  class.   If you want to save transcoded files and playlists in one bucket and thumbnails in
  another bucket, specify which users can access the transcoded files or the permissions the
  users have, or change the Amazon S3 storage class, omit OutputBucket and specify values for
  ContentConfig and ThumbnailConfig instead.
- `thumbnail_config`: The ThumbnailConfig object specifies several values, including the
  Amazon S3 bucket in which you want Elastic Transcoder to save thumbnail files, which users
  you want to have access to the files, the type of access you want users to have, and the
  storage class that you want to assign to the files. If you specify values for
  ContentConfig, you must also specify values for ThumbnailConfig even if you don't want to
  create thumbnails. If you specify values for ContentConfig and ThumbnailConfig, omit the
  OutputBucket object.    Bucket: The Amazon S3 bucket in which you want Elastic Transcoder
  to save thumbnail files.    Permissions (Optional): The Permissions object specifies which
  users and/or predefined Amazon S3 groups you want to have access to thumbnail files, and
  the type of access you want them to have. You can grant permissions to a maximum of 30
  users and/or predefined Amazon S3 groups.    GranteeType: Specify the type of value that
  appears in the Grantee object:     Canonical: The value in the Grantee object is either the
  canonical user ID for an AWS account or an origin access identity for an Amazon CloudFront
  distribution.  A canonical user ID is not the same as an AWS account number.     Email: The
  value in the Grantee object is the registered email address of an AWS account.     Group:
  The value in the Grantee object is one of the following predefined Amazon S3 groups:
  AllUsers, AuthenticatedUsers, or LogDelivery.      Grantee: The AWS user or group that you
  want to have access to thumbnail files. To identify the user or group, you can specify the
  canonical user ID for an AWS account, an origin access identity for a CloudFront
  distribution, the registered email address of an AWS account, or a predefined Amazon S3
  group.     Access: The permission that you want to give to the AWS user that you specified
  in Grantee. Permissions are granted on the thumbnail files that Elastic Transcoder adds to
  the bucket. Valid values include:     READ: The grantee can read the thumbnails and
  metadata for objects that Elastic Transcoder adds to the Amazon S3 bucket.    READ_ACP: The
  grantee can read the object ACL for thumbnails that Elastic Transcoder adds to the Amazon
  S3 bucket.    WRITE_ACP: The grantee can write the ACL for the thumbnails that Elastic
  Transcoder adds to the Amazon S3 bucket.    FULL_CONTROL: The grantee has READ, READ_ACP,
  and WRITE_ACP permissions for the thumbnails that Elastic Transcoder adds to the Amazon S3
  bucket.      StorageClass: The Amazon S3 storage class, Standard or ReducedRedundancy, that
  you want Elastic Transcoder to assign to the thumbnails that it stores in your Amazon S3
  bucket.
"""
function create_pipeline(InputBucket, Name, Role; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/pipelines", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InputBucket"=>InputBucket, "Name"=>Name, "Role"=>Role), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    create_preset(container, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The CreatePreset operation creates a preset with settings that you specify.  Elastic
Transcoder checks the CreatePreset settings to ensure that they meet Elastic Transcoder
requirements and to determine whether they comply with H.264 standards. If your settings
are not valid for Elastic Transcoder, Elastic Transcoder returns an HTTP 400 response
(ValidationException) and does not create the preset. If the settings are valid for Elastic
Transcoder but aren't strictly compliant with the H.264 standard, Elastic Transcoder
creates the preset and returns a warning message in the response. This helps you determine
whether your settings comply with the H.264 standard while giving you greater flexibility
with respect to the video that Elastic Transcoder produces.  Elastic Transcoder uses the
H.264 video-compression format. For more information, see the International
Telecommunication Union publication Recommendation ITU-T H.264: Advanced video coding for
generic audiovisual services.

# Arguments
- `container`: The container type for the output file. Valid values include flac, flv,
  fmp4, gif, mp3, mp4, mpg, mxf, oga, ogg, ts, and webm.
- `name`: The name of the preset. We recommend that the name be unique within the AWS
  account, but uniqueness is not enforced.

# Keyword Parameters
- `audio`: A section of the request body that specifies the audio parameters.
- `description`: A description of the preset.
- `thumbnails`: A section of the request body that specifies the thumbnail parameters, if
  any.
- `video`: A section of the request body that specifies the video parameters.
"""
function create_preset(Container, Name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/presets", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Container"=>Container, "Name"=>Name), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_pipeline(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The DeletePipeline operation removes a pipeline.  You can only delete a pipeline that has
never been used or that is not currently in use (doesn't contain any active jobs). If the
pipeline is currently in use, DeletePipeline returns an error.

# Arguments
- `id`: The identifier of the pipeline that you want to delete.

"""
function delete_pipeline(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("DELETE", "/2012-09-25/pipelines/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    delete_preset(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The DeletePreset operation removes a preset that you've added in an AWS region.  You can't
delete the default presets that are included with Elastic Transcoder.

# Arguments
- `id`: The identifier of the preset for which you want to get detailed information.

"""
function delete_preset(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("DELETE", "/2012-09-25/presets/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_jobs_by_pipeline(pipeline_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ListJobsByPipeline operation gets a list of the jobs currently in a pipeline. Elastic
Transcoder returns all of the jobs currently in the specified pipeline. The response body
contains one element for each job that satisfies the search criteria.

# Arguments
- `pipeline_id`: The ID of the pipeline for which you want to get job information.

# Keyword Parameters
- `ascending`:  To list jobs in chronological order by the date and time that they were
  submitted, enter true. To list jobs in reverse chronological order, enter false.
- `page_token`:  When Elastic Transcoder returns more than one page of results, use
  pageToken in subsequent GET requests to get each successive page of results.
"""
function list_jobs_by_pipeline(PipelineId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/jobsByPipeline/$(PipelineId)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_jobs_by_status(status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ListJobsByStatus operation gets a list of jobs that have a specified status. The
response body contains one element for each job that satisfies the search criteria.

# Arguments
- `status`: To get information about all of the jobs associated with the current AWS
  account that have a given status, specify the following status: Submitted, Progressing,
  Complete, Canceled, or Error.

# Keyword Parameters
- `ascending`:  To list jobs in chronological order by the date and time that they were
  submitted, enter true. To list jobs in reverse chronological order, enter false.
- `page_token`:  When Elastic Transcoder returns more than one page of results, use
  pageToken in subsequent GET requests to get each successive page of results.
"""
function list_jobs_by_status(Status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/jobsByStatus/$(Status)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ListPipelines operation gets a list of the pipelines associated with the current AWS
account.

# Keyword Parameters
- `ascending`: To list pipelines in chronological order by the date and time that they were
  created, enter true. To list pipelines in reverse chronological order, enter false.
- `page_token`: When Elastic Transcoder returns more than one page of results, use
  pageToken in subsequent GET requests to get each successive page of results.
"""
function list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/pipelines", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    list_presets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ListPresets operation gets a list of the default presets included with Elastic
Transcoder and the presets that you've added in an AWS region.

# Keyword Parameters
- `ascending`: To list presets in chronological order by the date and time that they were
  created, enter true. To list presets in reverse chronological order, enter false.
- `page_token`: When Elastic Transcoder returns more than one page of results, use
  pageToken in subsequent GET requests to get each successive page of results.
"""
function list_presets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/presets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    read_job(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ReadJob operation returns detailed information about a job.

# Arguments
- `id`: The identifier of the job for which you want to get detailed information.

"""
function read_job(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/jobs/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    read_pipeline(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ReadPipeline operation gets detailed information about a pipeline.

# Arguments
- `id`: The identifier of the pipeline to read.

"""
function read_pipeline(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/pipelines/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    read_preset(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The ReadPreset operation gets detailed information about a preset.

# Arguments
- `id`: The identifier of the preset for which you want to get detailed information.

"""
function read_preset(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("GET", "/2012-09-25/presets/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    test_role(input_bucket, output_bucket, role, topics; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The TestRole operation tests the IAM role used to create the pipeline. The TestRole action
lets you determine whether the IAM role you are using has sufficient permissions to let
Elastic Transcoder perform tasks associated with the transcoding process. The action
attempts to assume the specified IAM role, checks read access to the input and output
buckets, and tries to send a test notification to Amazon SNS topics that you specify.

# Arguments
- `input_bucket`: The Amazon S3 bucket that contains media files to be transcoded. The
  action attempts to read from this bucket.
- `output_bucket`: The Amazon S3 bucket that Elastic Transcoder writes transcoded media
  files to. The action attempts to read from this bucket.
- `role`: The IAM Amazon Resource Name (ARN) for the role that you want Elastic Transcoder
  to test.
- `topics`: The ARNs of one or more Amazon Simple Notification Service (Amazon SNS) topics
  that you want the action to send a test notification to.

"""
function test_role(InputBucket, OutputBucket, Role, Topics; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/roleTests", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InputBucket"=>InputBucket, "OutputBucket"=>OutputBucket, "Role"=>Role, "Topics"=>Topics), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_pipeline(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Use the UpdatePipeline operation to update settings for a pipeline.  When you change
pipeline settings, your changes take effect immediately. Jobs that you have already
submitted and that Elastic Transcoder has not started to process are affected in addition
to jobs that you submit after you change settings.

# Arguments
- `id`: The ID of the pipeline that you want to update.

# Keyword Parameters
- `aws_kms_key_arn`: The AWS Key Management Service (AWS KMS) key that you want to use with
  this pipeline. If you use either s3 or s3-aws-kms as your Encryption:Mode, you don't need
  to provide a key with your job because a default key, known as an AWS-KMS key, is created
  for you automatically. You need to provide an AWS-KMS key only if you want to use a
  non-default AWS-KMS key, or if you are using an Encryption:Mode of aes-cbc-pkcs7, aes-ctr,
  or aes-gcm.
- `content_config`: The optional ContentConfig object specifies information about the
  Amazon S3 bucket in which you want Elastic Transcoder to save transcoded files and
  playlists: which bucket to use, which users you want to have access to the files, the type
  of access you want users to have, and the storage class that you want to assign to the
  files. If you specify values for ContentConfig, you must also specify values for
  ThumbnailConfig. If you specify values for ContentConfig and ThumbnailConfig, omit the
  OutputBucket object.    Bucket: The Amazon S3 bucket in which you want Elastic Transcoder
  to save transcoded files and playlists.    Permissions (Optional): The Permissions object
  specifies which users you want to have access to transcoded files and the type of access
  you want them to have. You can grant permissions to a maximum of 30 users and/or predefined
  Amazon S3 groups.    Grantee Type: Specify the type of value that appears in the Grantee
  object:    Canonical: The value in the Grantee object is either the canonical user ID for
  an AWS account or an origin access identity for an Amazon CloudFront distribution. For more
  information about canonical user IDs, see Access Control List (ACL) Overview in the Amazon
  Simple Storage Service Developer Guide. For more information about using CloudFront origin
  access identities to require that users use CloudFront URLs instead of Amazon S3 URLs, see
  Using an Origin Access Identity to Restrict Access to Your Amazon S3 Content.  A canonical
  user ID is not the same as an AWS account number.     Email: The value in the Grantee
  object is the registered email address of an AWS account.    Group: The value in the
  Grantee object is one of the following predefined Amazon S3 groups: AllUsers,
  AuthenticatedUsers, or LogDelivery.      Grantee: The AWS user or group that you want to
  have access to transcoded files and playlists. To identify the user or group, you can
  specify the canonical user ID for an AWS account, an origin access identity for a
  CloudFront distribution, the registered email address of an AWS account, or a predefined
  Amazon S3 group     Access: The permission that you want to give to the AWS user that you
  specified in Grantee. Permissions are granted on the files that Elastic Transcoder adds to
  the bucket, including playlists and video files. Valid values include:     READ: The
  grantee can read the objects and metadata for objects that Elastic Transcoder adds to the
  Amazon S3 bucket.    READ_ACP: The grantee can read the object ACL for objects that Elastic
  Transcoder adds to the Amazon S3 bucket.     WRITE_ACP: The grantee can write the ACL for
  the objects that Elastic Transcoder adds to the Amazon S3 bucket.    FULL_CONTROL: The
  grantee has READ, READ_ACP, and WRITE_ACP permissions for the objects that Elastic
  Transcoder adds to the Amazon S3 bucket.      StorageClass: The Amazon S3 storage class,
  Standard or ReducedRedundancy, that you want Elastic Transcoder to assign to the video
  files and playlists that it stores in your Amazon S3 bucket.
- `input_bucket`: The Amazon S3 bucket in which you saved the media files that you want to
  transcode and the graphics that you want to use as watermarks.
- `name`: The name of the pipeline. We recommend that the name be unique within the AWS
  account, but uniqueness is not enforced. Constraints: Maximum 40 characters
- `notifications`: The topic ARN for the Amazon Simple Notification Service (Amazon SNS)
  topic that you want to notify to report job status.  To receive notifications, you must
  also subscribe to the new topic in the Amazon SNS console.     Progressing: The topic ARN
  for the Amazon Simple Notification Service (Amazon SNS) topic that you want to notify when
  Elastic Transcoder has started to process jobs that are added to this pipeline. This is the
  ARN that Amazon SNS returned when you created the topic.    Complete: The topic ARN for the
  Amazon SNS topic that you want to notify when Elastic Transcoder has finished processing a
  job. This is the ARN that Amazon SNS returned when you created the topic.    Warning: The
  topic ARN for the Amazon SNS topic that you want to notify when Elastic Transcoder
  encounters a warning condition. This is the ARN that Amazon SNS returned when you created
  the topic.    Error: The topic ARN for the Amazon SNS topic that you want to notify when
  Elastic Transcoder encounters an error condition. This is the ARN that Amazon SNS returned
  when you created the topic.
- `role`: The IAM Amazon Resource Name (ARN) for the role that you want Elastic Transcoder
  to use to transcode jobs for this pipeline.
- `thumbnail_config`: The ThumbnailConfig object specifies several values, including the
  Amazon S3 bucket in which you want Elastic Transcoder to save thumbnail files, which users
  you want to have access to the files, the type of access you want users to have, and the
  storage class that you want to assign to the files. If you specify values for
  ContentConfig, you must also specify values for ThumbnailConfig even if you don't want to
  create thumbnails. If you specify values for ContentConfig and ThumbnailConfig, omit the
  OutputBucket object.    Bucket: The Amazon S3 bucket in which you want Elastic Transcoder
  to save thumbnail files.    Permissions (Optional): The Permissions object specifies which
  users and/or predefined Amazon S3 groups you want to have access to thumbnail files, and
  the type of access you want them to have. You can grant permissions to a maximum of 30
  users and/or predefined Amazon S3 groups.    GranteeType: Specify the type of value that
  appears in the Grantee object:    Canonical: The value in the Grantee object is either the
  canonical user ID for an AWS account or an origin access identity for an Amazon CloudFront
  distribution.  A canonical user ID is not the same as an AWS account number.     Email: The
  value in the Grantee object is the registered email address of an AWS account.    Group:
  The value in the Grantee object is one of the following predefined Amazon S3 groups:
  AllUsers, AuthenticatedUsers, or LogDelivery.      Grantee: The AWS user or group that you
  want to have access to thumbnail files. To identify the user or group, you can specify the
  canonical user ID for an AWS account, an origin access identity for a CloudFront
  distribution, the registered email address of an AWS account, or a predefined Amazon S3
  group.     Access: The permission that you want to give to the AWS user that you specified
  in Grantee. Permissions are granted on the thumbnail files that Elastic Transcoder adds to
  the bucket. Valid values include:     READ: The grantee can read the thumbnails and
  metadata for objects that Elastic Transcoder adds to the Amazon S3 bucket.    READ_ACP: The
  grantee can read the object ACL for thumbnails that Elastic Transcoder adds to the Amazon
  S3 bucket.    WRITE_ACP: The grantee can write the ACL for the thumbnails that Elastic
  Transcoder adds to the Amazon S3 bucket.    FULL_CONTROL: The grantee has READ, READ_ACP,
  and WRITE_ACP permissions for the thumbnails that Elastic Transcoder adds to the Amazon S3
  bucket.       StorageClass: The Amazon S3 storage class, Standard or ReducedRedundancy,
  that you want Elastic Transcoder to assign to the thumbnails that it stores in your Amazon
  S3 bucket.
"""
function update_pipeline(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("PUT", "/2012-09-25/pipelines/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_pipeline_notifications(id, notifications; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

With the UpdatePipelineNotifications operation, you can update Amazon Simple Notification
Service (Amazon SNS) notifications for a pipeline. When you update notifications for a
pipeline, Elastic Transcoder returns the values that you specified in the request.

# Arguments
- `id`: The identifier of the pipeline for which you want to change notification settings.
- `notifications`: The topic ARN for the Amazon Simple Notification Service (Amazon SNS)
  topic that you want to notify to report job status.  To receive notifications, you must
  also subscribe to the new topic in the Amazon SNS console.     Progressing: The topic ARN
  for the Amazon Simple Notification Service (Amazon SNS) topic that you want to notify when
  Elastic Transcoder has started to process jobs that are added to this pipeline. This is the
  ARN that Amazon SNS returned when you created the topic.    Complete: The topic ARN for the
  Amazon SNS topic that you want to notify when Elastic Transcoder has finished processing a
  job. This is the ARN that Amazon SNS returned when you created the topic.    Warning: The
  topic ARN for the Amazon SNS topic that you want to notify when Elastic Transcoder
  encounters a warning condition. This is the ARN that Amazon SNS returned when you created
  the topic.    Error: The topic ARN for the Amazon SNS topic that you want to notify when
  Elastic Transcoder encounters an error condition. This is the ARN that Amazon SNS returned
  when you created the topic.

"""
function update_pipeline_notifications(Id, Notifications; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/pipelines/$(Id)/notifications", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Notifications"=>Notifications), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end

"""
    update_pipeline_status(id, status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

The UpdatePipelineStatus operation pauses or reactivates a pipeline, so that the pipeline
stops or restarts the processing of jobs. Changing the pipeline status is useful if you
want to cancel one or more jobs. You can't cancel jobs after Elastic Transcoder has started
processing them; if you pause the pipeline to which you submitted the jobs, you have more
time to get the job IDs for the jobs that you want to cancel, and to send a CancelJob
request.

# Arguments
- `id`: The identifier of the pipeline to update.
- `status`: The desired status of the pipeline:    Active: The pipeline is processing jobs.
     Paused: The pipeline is not currently processing jobs.

"""
function update_pipeline_status(Id, Status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return elastic_transcoder("POST", "/2012-09-25/pipelines/$(Id)/status", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Status"=>Status), params)); aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
