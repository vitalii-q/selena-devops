# IAM Policy для CloudWatch Agent
resource "aws_iam_policy" "cloudwatch_agent_policy" {
  name        = "CloudWatchAgentServerPolicy"
  description = "Policy for CloudWatch Agent to push logs and metrics"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:PutLogEvents",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups",
          "logs:CreateLogStream",
          "logs:CreateLogGroup",
          "logs:PutRetentionPolicy",
          "cloudwatch:PutMetricData",
          "ec2:DescribeTags",
          "ssm:GetParameter"
        ]
        Resource = "*"
      }
    ]
  })
}

# IAM Role для EC2 (CloudWatch Agent)
resource "aws_iam_role" "cloudwatch_agent_role" {
  name = "CloudWatchAgentServerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

