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
<img width="1920" height="556" alt="deployment" src="https://github.com/user-attachments/assets/e75ab321-1f93-45c7-ac6e-ba5bd315e538" />

3️⃣ Deployment Features (Self-Healing & Rolling Updates)
<img width="1920" height="1020" alt="EKS worker nodes, running on AWS, managed by Kubernetes" src="https://github.com/user-attachments/assets/b5ce13bb-fb75-46f5-bb7a-a07f93e57e83" />

4️⃣ AWS EKS Worker Nodes
<img width="1920" height="264" alt="AWS EKS worker nodes" src="https://github.com/user-attachments/assets/82c00f96-0232-4390-9234-355f43c88b24" />

5️⃣ Service Exposed via AWS LoadBalancer
<img width="1920" height="528" alt="“Service exposes my app using AWS LoadBalancer" src="https://github.com/user-attachments/assets/0757ddb1-2c8f-4a16-9f3b-4c77034ea9af" />

6️⃣ Application Access (Browser Validation)
<img width="1920" height="1020" alt="application" src="https://github.com/user-attachments/assets/584b725c-fcfd-42f7-b390-39073336444d" />
<img width="1920" height="1020" alt="after singin in application" src="https://github.com/user-attachments/assets/b87f221e-03ef-451f-bfb0-dda6434e9a62" />

