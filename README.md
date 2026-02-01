# microservice-cicd-kubernetes-pipeline

Task 1
Create a CI/CD pipeline to build and deploy a microservice container to a Kubernetes cluster.

Working Steps

1. **Source Control**

   * Application code committed to **GitHub (main branch)**

2. **CI – Jenkins**

   * Jenkins checks out source code
   * Builds Docker image using `Dockerfile`
   * Pushes image to container registry

3. **Authentication**

   * Jenkins authenticates to **AWS EKS** using IAM credentials
   * `kubectl` context configured for target cluster

4. **CD – Kubernetes**

   * Kubernetes manifests applied (`Deployment`, `Service`)
   * Pods created with defined CPU & memory requests/limits

5. **Service Exposure**

   * Kubernetes **Service (LoadBalancer)** provisions AWS ELB

6. **Validation**

   * Application accessed via LoadBalancer external IP
   * Deployment verified via browser

Proof of Work (Actual Screenshots)

1️⃣ Jenkins CI/CD Pipeline – Stage View
<img width="1920" height="1020" alt="jankins" src="https://github.com/user-attachments/assets/864db472-2b9d-4347-bab8-dfea969416ed" />

2️⃣ Kubernetes Deployment (Running)

3️⃣ Deployment Features (Self-Healing & Rolling Updates)

4️⃣ AWS EKS Worker Nodes

5️⃣ Service Exposed via AWS LoadBalancer

6️⃣ Application Access (Browser Validation)
