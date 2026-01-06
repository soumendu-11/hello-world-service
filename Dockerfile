# Use the AWS Lambda Python 3.9 base image
FROM public.ecr.aws/lambda/python:3.9

# Copy the function code to the Lambda task root
COPY hello.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler
CMD [ "hello.handler" ]

