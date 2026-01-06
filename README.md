# Hello World Service with Docker, ECR, and AWS Lambda

This project demonstrates a simple "Hello World" Python service that is containerized with Docker, pushed to Amazon ECR, and deployed to AWS Lambda via GitHub Actions.

## Project Structure

- `hello.py`: Python script with a Lambda-compatible `handler` function.
- `Dockerfile`: Configuration using the AWS Lambda Python base image.
- `.github/workflows/main.yml`: CI/CD pipeline to build, push to ECR, and update Lambda.
- `.env`: (Local only) Stores environment variables and credentials.

## Setup

### 1. AWS Infrastructure (One-time)
Run these commands locally using your AWS CLI to set up the necessary components:

**Create ECR Repository:**
```bash
aws ecr create-repository --repository-name hello-world-service --region eu-central-1
```

**Create Lambda Function (Shell):**
Note: You must first have an execution role for Lambda.
```bash
aws lambda create-function \
    --function-name hello-world-service \
    --package-type Image \
    --code ImageUri=<YOUR_ACCOUNT_ID>.dkr.ecr.eu-central-1.amazonaws.com/hello-world-service:latest \
    --role <YOUR_LAMBDA_ROLE_ARN>
```

### 2. GitHub Secrets
Add these secrets to your GitHub repository:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN` (required for temporary SSO credentials)

## Triggers

- **Push**: Automatically builds and deploys on every push to `main`.
- **On-Demand**: Trigger manually from the "Actions" tab.
- **Schedule**: Triggered automatically via cron.

## Local Testing
To test the Lambda-compatible container locally:
```bash
docker build -t hello-lambda .
docker run -p 9000:8080 hello-lambda
# In another terminal:
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
# hello-world-service
