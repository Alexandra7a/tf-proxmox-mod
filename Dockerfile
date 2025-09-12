# Use a minimal base image for Terraform
FROM hashicorp/terraform:latest AS builder

# Set the working directory
WORKDIR /app

# Copy the necessary Terraform configuration files
COPY . .

# Initialize Terraform
RUN terraform init

# Validate the Terraform configuration
RUN terraform validate

# Plan the Terraform deployment
RUN terraform plan

# Final stage: Use a lightweight image for running Terraform commands
FROM alpine:latest

# Install necessary tools (if any)
RUN apk add --no-cache bash

# Set the working directory
WORKDIR /app

# Copy the Terraform files from the builder stage
COPY --from=builder /app .

# Set environment variables for Terraform
ENV PROXMOX_SSH=${PROXMOX_SSH}
ENV TF_VAR_lxc=${TF_VAR_lxc}

# Default command to run Terraform commands
CMD ["terraform", "validate"]