#!/bin/bash
aws configure set aws_access_key_id $AWS_KEY
aws configure set aws_secret_access_key $SECRET_KEY
if [ -n "$SESSION_TOKEN" ]; then
    aws configure set aws_session_token $SESSION_TOKEN
fi
aws iam list-users