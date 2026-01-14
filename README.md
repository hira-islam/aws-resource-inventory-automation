## AWS Resource Inventory Automation

This project contains a Bash script that lists AWS resources using the AWS CLI.
The script accepts an AWS region and service name as input and outputs the
corresponding resources in the account.

### Supported Services
- EC2
- S3
- RDS
- DynamoDB
- Lambda
- EBS
- ELB
- CloudFront
- CloudWatch
- SNS
- SQS
- Route53
- VPC
- CloudFormation
- IAM

### Usage
```bash
chmod +x aws_resource_list.sh OR chmod 755 aws_resource_list.sh
./aws_resource_list.sh us-east-1 ec2
