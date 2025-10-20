# Virtual Job Simulation Platform - DevOps Deployment

## Overview
This project demonstrates how to deploy a containerized virtual internship simulation platform using Docker and Kubernetes.

## Steps to Run Locally
1. Install Docker and Node.js.
2. Build and run:
   ```bash
   docker-compose up --build
   ```
3. Visit http://localhost:8080

## Steps for Kubernetes Deployment
1. Build and push the Docker image:
   ```bash
   docker build -t jagadeeshbabu1601/virtual-sim:latest .
   docker push jagadeeshbabu1601/virtual-sim:latest
   ```
2. Deploy to cluster:
   ```bash
   kubectl apply -f k8s/
   ```

## CI/CD
GitHub Actions automatically builds and pushes images on commits to `main` or `develop` branches.

## Architecture Diagram
```mermaid
flowchart LR
  A[GitHub Repo] -->|push| B(CI - GitHub Actions)
  B -->|build/push| C[Docker Hub]
  C --> D[Kubernetes Cluster]
  D --> E[Ingress]
  E --> F[App Deployment (Pods)]
  F --> G[(Postgres PVC)]
  D --> H[Prometheus & Grafana]
  D --> I[EFK Logging]
  D --> J[Velero Backups -> S3]
```

## Troubleshooting
- Run `docker logs <container>` for errors.
- Use `kubectl logs` to debug pods.
- Ensure ingress controller and service ports are correct.


