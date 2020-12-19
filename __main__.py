import json
import mimetypes
import os

from pulumi import export, FileAsset
from pulumi_aws import s3

src_html = "amdocs.html"
tgt_html = "index.html"

web_bucket = s3.Bucket('infra-challenge',
    website=s3.BucketWebsiteArgs(
        index_document=tgt_html,
    ))

mime_type, _ = mimetypes.guess_type(src_html)
obj = s3.BucketObject(tgt_html,
    bucket=web_bucket.id,
    source=FileAsset(src_html),
    content_type=mime_type)

def public_read_policy_for_bucket(bucket_name):
    return json.dumps({
        "Version": "2012-10-17",
        "Statement": [{
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                f"arn:aws:s3:::{bucket_name}/*",
            ]
        }]
    })

bucket_name = web_bucket.id
bucket_policy = s3.BucketPolicy("bucket-policy",
    bucket=bucket_name,
    policy=bucket_name.apply(public_read_policy_for_bucket))

export("bucket_name", web_bucket.id)
export("website_url", web_bucket.website_endpoint)