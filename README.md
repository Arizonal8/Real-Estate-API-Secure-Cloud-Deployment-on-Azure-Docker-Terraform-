<p align="center">
  <img src="docs/banner/realestate-azure-banner.png" alt="Real Estate API on Azure" />
</p>

<h1 align="center">Real Estate API – Azure Cloud Deployment with Terraform</h1>

<p align="center">
  <strong>Production-ready Node.js backend deployed on Microsoft Azure using Terraform, Docker, and security-first practices.</strong>
</p>

---

## 📖 Overview

This repository demonstrates how an open-source Node.js backend can be transformed into a **cloud-native, production-ready service** running on **Azure Container Apps**.

The project started from a fork of an existing real estate application and focuses on **infrastructure design, containerization, deployment automation, and security**, rather than feature development.

All cloud resources are provisioned using **Terraform**, enabling a fully reproducible and auditable Infrastructure-as-Code (IaC) workflow.

---

## 🎯 Project Objectives

- Deploy a real-world backend application to Azure
- Containerize the application using Docker
- Provision infrastructure using Terraform (IaC)
- Integrate Azure Cosmos DB (Mongo API)
- Implement secure secret and configuration management
- Use Azure Container Apps for scalable execution
- Document architecture, decisions, and troubleshooting

---

## 🏗️ Architecture Overview

The deployed system consists of:

- **Azure Container Apps** – runs the Node.js API
- **Azure Container Apps Environment** – networking, revisions, logging
- **Azure Cosmos DB (Mongo API)** – persistent data storage
- **Azure Log Analytics Workspace** – centralized observability
- **ImageKit** – image upload and CDN delivery
- **Terraform** – declarative infrastructure provisioning


## 🧰 Technology Stack

### Backend
- Node.js / Express
- Mongoose
- MongoDB (Cosmos DB – Mongo API)
- ImageKit SDK
- SMTP (email notifications)

### Cloud & Infrastructure
- Terraform (azurerm provider)
- Azure Container Apps
- Azure Cosmos DB
- Azure Log Analytics
- Azure Resource Groups

### DevOps & Tooling
- Docker & Docker Hub
- Azure CLI
- Git & GitHub
- Postman / Newman


Terraform provisions:

- Resource Group
- Log Analytics Workspace
- Container Apps Environment
- Cosmos DB (Mongo API)
- Azure Container App


## 🛡️ Security

Security considerations and best practices are documented in:

```
SECURITY.md
```

---

## 📘 Engineering Notes

The `notes/` directory serves as a **developer diary**, documenting:

- Design decisions
- Terraform troubleshooting
- Azure Container Apps revisions
- Integration challenges and resolutions

---

## 🙌 Credits & Attribution

The read estate web-app project forked from:

https://github.com/AAYUSH412/Real-Estate-Website

This repository extends the original work by focusing on:

- Docker containerization
- Terraform Infrastructure-as-Code
- Azure cloud deployment
- Security-first configuration
- Comprehensive documentation

## 📊 Project Scope & Cost Management

**Important:** This project demonstrates a **production-ready deployment setup**, but the Azure resources were intentionally decommissioned after validation to avoid unnecessary cloud costs. This reflects real-world practices where:

1. Infrastructure is provisioned on-demand
2. Development/test environments are torn down after use
3. Cloud cost optimization is a priority

**Validation Proof:** All deployment screenshots in the `/Azure Images` directory show the fully functional, running infrastructure before teardown.

**Estimated Runtime Cost:** ~$2-4/day (Container Apps + Cosmos DB)
**Total Project Cost:** <$20 for full deployment lifecycle
