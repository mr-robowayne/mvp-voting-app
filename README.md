# MVP Infrastructure Project – Terraform, Ansible & Docker

This repository contains an MVP infrastructure project built as part of an Ironhack DevOps & Cloud Computing assignment.

We were provided with an infrastructure diagram and the application code. The goal of this project was to build the complete infrastructure and deploy the application using Infrastructure as Code and automation tools.

The architecture diagram can be found here:
docs/mvp-diagram.png

---

## Project Overview

This MVP project demonstrates a full DevOps workflow:
- Provisioning AWS infrastructure with Terraform
- Deploying services with Docker & Docker Compose
- Automating server configuration using Ansible
- Managing secrets securely with Ansible Vault

---

## Infrastructure Provisioning (Terraform)

The infrastructure was built using Terraform with a modular structure.

- Separate environments for dev and prod
- Reusable Terraform modules
- Infrastructure based on the provided diagram

Terraform environments:
terraform/env/dev
terraform/env/prod

---

## Terraform Modules

- network – VPC, subnets, routing
- security_groups – firewall rules
- compute – EC2 instances
- keypair – SSH access
- s3-bucket – supporting resources

---

## Docker Images

The following Docker images were built and pushed to Docker Hub:
- mvp-result
- mvp-vote
- mvp-worker

Docker Hub username: mrrobofilper

---

## Configuration & Deployment (Ansible)

Each EC2 instance is configured using Ansible roles:
- frontend
- backend
- db

Ansible handles:
- Docker installation
- Docker Compose deployment
- Environment files
- Healthchecks

---

## Secrets Management

Sensitive variables are stored using Ansible Vault.

Encrypted files are located in:
ansible/group_vars/

---

## Repository Structure

ansible/
terraform/
docs/

---

## Goal of This MVP

The goal of this project was to practice:
- Infrastructure as Code
- Containerization
- Automated deployments
- Secure secrets handling

---

## Personal Notes

This MVP project was part of an Ironhack assignment.

We were given an infrastructure diagram together with the application code. I started by creating a clean folder structure for Terraform and Ansible to keep everything organized from the beginning.

First, I focused on building the infrastructure using Terraform. I created several child modules and called them from the main module under the `dev` environment, using a local backend. The setup follows the architecture diagram provided in the `/docs` folder.

After the infrastructure was ready, I built three Docker images: `mvp-result`, `mvp-vote`, and `mvp-worker`. Each image was created using its own Dockerfile and pushed to my Docker Hub account (`mrrobofilper`).

Once the images were available, I worked on the Ansible roles. Each EC2 instance has its own role, and the services are deployed using Docker Compose. Ansible is also responsible for copying required files to the servers, such as `.env` files and healthcheck scripts.

Sensitive credentials and configuration values are stored securely using Ansible Vault and are located in `group_vars`.

This project helped me understand how Terraform, Ansible, and Docker work together in a real-world MVP setup and gave me hands-on experience with building and deploying infrastructure end to end.

