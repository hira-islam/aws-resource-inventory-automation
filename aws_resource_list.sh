#!/bin/bash

##############################################################
# This script will list all the resources in the AWS account
# Author: Hira Islam
# Version: v0.0.1
#
# Following are the supported AWS services by the scipt
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lamda
# 6. EBS
# 7. ELB
# 8. CloudFront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. CloudFormation
# 15. IAM
#
# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 EC2
############################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
  echo "Usage: $0 <region> <service_name>" # $0 means script name, $1 means region and $3 means service-name
  exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')
#aws_service=$2

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed. Please install it and try again."
  exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
  echo "AWS CLI is not configured. Please configure it and try again."
  exit 1
fi

# Execute the AWS CLI command based on the service name
case $aws_service in
  ec2)
    echo "Listing EC2 Instances in $aws_region"
    aws ec2 describe-instances --region $aws_region
    ;;
  s3)
    echo "Listing S3 Buckets in $aws_region"
    aws s3api list-buckets
    ;;
  rds)
    echo "Listing RDS Instances in $aws_region"
    aws rds describe-db-instances --region $aws_region
  ;;
  dynamodb)
    echo "Listing DynamoDB Tables in $aws_region"
    aws dynamodb list-tables --region $aws_region
    ;;
  lambda)
    echo "Listing Lambda Functions in $aws_region"
    aws lambda list-functions --region $aws_region
    ;;
  ebs)
    echo "Listing EBS Volumes in $aws_region"
    aws ec2 describe-volumes --region $aws_region
    ;;
  elb)
    echo "Listing ELB load-balancer in $aws_region"
    aws elb describe-load-balancers --region $aws_region
    ;;
  cloudfront)
    echo "Listing CloudFront Distributions in $aws_region"
    aws cloudfront list-distributions
    ;;
  cloudwatch)
    echo "Listing CloudWatch Alarms in $aws_region"
    aws cloudwatch list-metrics --region $aws_region
    ;;
  sns)
    echo "Listing SNS Topics in $aws_region"
    aws sns list-topics --region $aws_region
    ;;
  sqs)
    echo "Listing SQS Queues in $aws_region"
    aws sqs list-queues --region $aws_region
    ;;
  route53)
    echo "Listing Route53 Hosted Zones in $aws_region"
    aws route53 list-hosted-zones
    ;;
  vpc)
    echo "Listing VPCs in $aws_region"
    aws ec2 describe-vpcs --region $aws_region
    ;;
  cloudformation)
    echo "Listing CloudFormation Stacks in $aws_region"
    aws cloudformation describe-stacks --region $aws_region
    ;;
  iam)
    echo "Listing IAM Users in $aws_region"
    aws iam list-users
    ;;
  *)

    echo "Invalid service. Please enter a valid service."
    exit 1
    ;;
esac
