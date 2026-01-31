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

📌 Architecture diagram available at:

```
docs/architecture/system-architecture.png
```

---

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

---

## 📁 Repository Structure

```
realestate-api/
├── Dockerfile
├── package.json
├── README.md
├── SECURITY.md
│
├── src/
│   ├── index.js
│   ├── app.js
│   ├── routes/
│   ├── controllers/
│   ├── models/
│   └── utils/
│
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── containerapp.tf
│   ├── cosmosdb.tf
│   └── loganalytics.tf
│
├── docs/
│   ├── architecture/
│   ├── terraform/
│   ├── docker/
│   └── troubleshooting/
│
└── notes/
    ├── 01_initial-setup.txt
    ├── 02_repo-cleanup.txt
    ├── 03_terraform-deployment.txt
    ├── 04_docker-build-and-push.txt
    ├── 05_azure-container-apps.txt
    ├── 06_secrets-and-env-vars.txt
    ├── 07_revision-debugging.txt
    ├── 08_imagekit-integration.txt
    ├── 09_cosmosdb-integration.txt
    └── 10_final-deployment.txt
```

---

## 🚀 Local Development

### Install dependencies
```bash
npm install
```

### Environment variables
Create a `.env` file:

```env
MONGO_URI=
IMAGEKIT_PUBLIC_KEY=
IMAGEKIT_PRIVATE_KEY=
IMAGEKIT_URL_ENDPOINT=
SMTP_USER=
SMTP_PASS=
PORT=4000
```

### Run locally
```bash
npm run dev
```

---

## 🐳 Docker

### Build image
```bash
docker build -t <dockerhub-username>/realestate-api .
```

### Push image
```bash
docker push <dockerhub-username>/realestate-api
```

---

## ☁️ Azure Deployment (Terraform)

From the `terraform/` directory:

```bash
terraform init
terraform plan
terraform apply
```

Terraform provisions:

- Resource Group
- Log Analytics Workspace
- Container Apps Environment
- Cosmos DB (Mongo API)
- Azure Container App

---

## 🔐 Secret Management

Secrets are never committed to source control.

- Secrets are stored using **Azure Container Apps secrets**
- Environment variables reference secrets using `secretref`

Example:
```text
MONGO_URI=secretref:mongo-uri
```

Detailed steps are documented in:

```
notes/06_secrets-and-env-vars.txt
```

---

## 🧪 API Testing

Postman collection:

```
notes/scripts/postman-collection.json
```

Run tests:
```bash
newman run notes/scripts/postman-collection.json
```

---

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

Original project forked from:

https://github.com/AAYUSH412/Real-Estate-Website

This repository extends the original work by focusing on:

- Docker containerization
- Terraform Infrastructure-as-Code
- Azure cloud deployment
- Security-first configuration
- Comprehensive documentation
