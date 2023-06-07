# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ivs_realtime
using AWS.Compat
using AWS.UUIDs

"""
    create_participant_token(stage_arn)
    create_participant_token(stage_arn, params::Dict{String,<:Any})

Creates an additional token for a specified stage. This can be done after stage creation or
when tokens expire. Tokens always are scoped to the stage for which they are created.
Encryption keys are owned by Amazon IVS and never used directly by your application.

# Arguments
- `stage_arn`: ARN of the stage to which this token is scoped.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"attributes"`: Application-provided attributes to encode into the token and attach to a
  stage. Map keys and values can contain UTF-8 encoded text. The maximum length of this field
  is 1 KB total. This field is exposed to all stage participants and should not be used for
  personally identifying, confidential, or sensitive information.
- `"capabilities"`: Set of capabilities that the user is allowed to perform in the stage.
  Default: PUBLISH, SUBSCRIBE.
- `"duration"`: Duration (in minutes), after which the token expires. Default: 720 (12
  hours).
- `"userId"`: Name that can be specified to help identify the token. This can be any UTF-8
  encoded text. This field is exposed to all stage participants and should not be used for
  personally identifying, confidential, or sensitive information.
"""
function create_participant_token(
    stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/CreateParticipantToken",
        Dict{String,Any}("stageArn" => stageArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_participant_token(
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/CreateParticipantToken",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("stageArn" => stageArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_stage()
    create_stage(params::Dict{String,<:Any})

Creates a new stage (and optionally participant tokens).

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"name"`: Optional name that can be specified for the stage being created.
- `"participantTokenConfigurations"`: Array of participant token configuration objects to
  attach to the new stage.
- `"tags"`: Tags attached to the resource. Array of maps, each of the form string:string
  (key:value). See Tagging AWS Resources for details, including restrictions that apply to
  tags and \"Tag naming limits and requirements\"; Amazon IVS has no constraints on tags
  beyond what is documented there.
"""
function create_stage(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST", "/CreateStage"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function create_stage(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/CreateStage",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_stage(arn)
    delete_stage(arn, params::Dict{String,<:Any})

Shuts down and deletes the specified stage (disconnecting all participants).

# Arguments
- `arn`: ARN of the stage to be deleted.

"""
function delete_stage(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST",
        "/DeleteStage",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_stage(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/DeleteStage",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disconnect_participant(participant_id, stage_arn)
    disconnect_participant(participant_id, stage_arn, params::Dict{String,<:Any})

Disconnects a specified participant and revokes the participant permanently from a
specified stage.

# Arguments
- `participant_id`: Identifier of the participant to be disconnected. This is assigned by
  IVS and returned by CreateParticipantToken.
- `stage_arn`: ARN of the stage to which the participant is attached.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"reason"`: Description of why this participant is being disconnected.
"""
function disconnect_participant(
    participantId, stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/DisconnectParticipant",
        Dict{String,Any}("participantId" => participantId, "stageArn" => stageArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function disconnect_participant(
    participantId,
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/DisconnectParticipant",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("participantId" => participantId, "stageArn" => stageArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_participant(participant_id, session_id, stage_arn)
    get_participant(participant_id, session_id, stage_arn, params::Dict{String,<:Any})

Gets information about the specified participant token.

# Arguments
- `participant_id`: Unique identifier for the participant. This is assigned by IVS and
  returned by CreateParticipantToken.
- `session_id`: ID of a session within the stage.
- `stage_arn`: Stage ARN.

"""
function get_participant(
    participantId, sessionId, stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/GetParticipant",
        Dict{String,Any}(
            "participantId" => participantId,
            "sessionId" => sessionId,
            "stageArn" => stageArn,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_participant(
    participantId,
    sessionId,
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/GetParticipant",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "participantId" => participantId,
                    "sessionId" => sessionId,
                    "stageArn" => stageArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_stage(arn)
    get_stage(arn, params::Dict{String,<:Any})

Gets information for the specified stage.

# Arguments
- `arn`: ARN of the stage for which the information is to be retrieved.

"""
function get_stage(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST",
        "/GetStage",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_stage(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/GetStage",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_stage_session(session_id, stage_arn)
    get_stage_session(session_id, stage_arn, params::Dict{String,<:Any})

Gets information for the specified stage session.

# Arguments
- `session_id`: ID of a session within the stage.
- `stage_arn`: ARN of the stage for which the information is to be retrieved.

"""
function get_stage_session(
    sessionId, stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/GetStageSession",
        Dict{String,Any}("sessionId" => sessionId, "stageArn" => stageArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_stage_session(
    sessionId,
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/GetStageSession",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("sessionId" => sessionId, "stageArn" => stageArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_participant_events(participant_id, session_id, stage_arn)
    list_participant_events(participant_id, session_id, stage_arn, params::Dict{String,<:Any})

Lists events for a specified participant that occurred during a specified stage session.

# Arguments
- `participant_id`: Unique identifier for this participant. This is assigned by IVS and
  returned by CreateParticipantToken.
- `session_id`: ID of a session within the stage.
- `stage_arn`: Stage ARN.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of results to return. Default: 50.
- `"nextToken"`: The first participant to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_participant_events(
    participantId, sessionId, stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/ListParticipantEvents",
        Dict{String,Any}(
            "participantId" => participantId,
            "sessionId" => sessionId,
            "stageArn" => stageArn,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_participant_events(
    participantId,
    sessionId,
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/ListParticipantEvents",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "participantId" => participantId,
                    "sessionId" => sessionId,
                    "stageArn" => stageArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_participants(session_id, stage_arn)
    list_participants(session_id, stage_arn, params::Dict{String,<:Any})

Lists all participants in a specified stage session.

# Arguments
- `session_id`: ID of the session within the stage.
- `stage_arn`: Stage ARN.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filterByPublished"`: Filters the response list to only show participants who published
  during the stage session. Only one of filterByUserId, filterByPublished, or filterByState
  can be provided per request.
- `"filterByState"`: Filters the response list to only show participants in the specified
  state. Only one of filterByUserId, filterByPublished, or filterByState can be provided per
  request.
- `"filterByUserId"`: Filters the response list to match the specified user ID. Only one of
  filterByUserId, filterByPublished, or filterByState can be provided per request. A userId
  is a customer-assigned name to help identify the token; this can be used to link a
  participant to a user in the customer’s own systems.
- `"maxResults"`: Maximum number of results to return. Default: 50.
- `"nextToken"`: The first participant to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_participants(
    sessionId, stageArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/ListParticipants",
        Dict{String,Any}("sessionId" => sessionId, "stageArn" => stageArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_participants(
    sessionId,
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/ListParticipants",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("sessionId" => sessionId, "stageArn" => stageArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_stage_sessions(stage_arn)
    list_stage_sessions(stage_arn, params::Dict{String,<:Any})

Gets all sessions for a specified stage.

# Arguments
- `stage_arn`: Stage ARN.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of results to return. Default: 50.
- `"nextToken"`: The first stage to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_stage_sessions(stageArn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST",
        "/ListStageSessions",
        Dict{String,Any}("stageArn" => stageArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_stage_sessions(
    stageArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/ListStageSessions",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("stageArn" => stageArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_stages()
    list_stages(params::Dict{String,<:Any})

Gets summary information about all stages in your account, in the AWS region where the API
request is processed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of results to return. Default: 50.
- `"nextToken"`: The first stage to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_stages(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST", "/ListStages"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_stages(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/ListStages",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Gets information about AWS tags for the specified ARN.

# Arguments
- `resource_arn`: The ARN of the resource to be retrieved. The ARN must be URL-encoded.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "GET",
        "/tags/$(resourceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds or updates tags for the AWS resource with the specified ARN.

# Arguments
- `resource_arn`: The ARN of the resource to be tagged. The ARN must be URL-encoded.
- `tags`: Array of tags to be added or updated. Array of maps, each of the form
  string:string (key:value). See Tagging AWS Resources for details, including restrictions
  that apply to tags and \"Tag naming limits and requirements\"; Amazon IVS has no
  constraints beyond what is documented there.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from the resource with the specified ARN.

# Arguments
- `resource_arn`: The ARN of the resource to be untagged. The ARN must be URL-encoded.
- `tag_keys`: Array of tags to be removed. Array of maps, each of the form string:string
  (key:value). See Tagging AWS Resources for details, including restrictions that apply to
  tags and \"Tag naming limits and requirements\"; Amazon IVS has no constraints beyond what
  is documented there.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs_realtime(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_stage(arn)
    update_stage(arn, params::Dict{String,<:Any})

Updates a stage’s configuration.

# Arguments
- `arn`: ARN of the stage to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"name"`: Name of the stage to be updated.
"""
function update_stage(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs_realtime(
        "POST",
        "/UpdateStage",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_stage(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs_realtime(
        "POST",
        "/UpdateStage",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end