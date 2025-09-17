{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "states:Start*",
            "Resource": "${account_provisioning_customizations_sfn_arn}"
        },
        {
            "Effect": "Allow",
            "Action": "SNS:Publish",
            "Resource": "${sns_topic_arn}"
        }
    ]
}
