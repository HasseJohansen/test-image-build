# Use the ECR Public mirror of Alpine to avoid Docker Hub anonymous
# pull-rate limits on shared CodeBuild egress IPs.
FROM public.ecr.aws/docker/library/alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install some basic utilities for testing
RUN apk add --no-cache \
    curl \
    wget \
    bash \
    git \
    python3 \
    py3-pip

# Copy a test script into the container
COPY test_script.sh .

# Make the script executable
RUN chmod +x test_script.sh

# Define the command to run when the container starts
CMD ["./test_script.sh"]
