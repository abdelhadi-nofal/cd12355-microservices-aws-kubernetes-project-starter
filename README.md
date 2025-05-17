## Deployment Process

1. **Docker Build**:  
   - Built with `--platform linux/amd64` to ensure compatibility with EKS worker nodes (M1 Mac users).

2. **Kubernetes Deployment**:  
   - Deployed via `kubectl apply -f deployment/` using a LoadBalancer service.
   - Used liveness/readiness probes for health checks.
   - Environment variables set directly in Deployment (no ConfigMap/Secret due to IAM restrictions).

3. **Workarounds**:  
   - Removed PostgreSQL dependency due to IAM limitations (PVC and EBS CSI Driver issues).
   - Used Docker Hub instead of ECR due to restricted ECR permissions.
   - Verified app functionality via `kubectl port-forward` when ELB failed.

## Cost-Saving Strategies
- **Instance Type**: `t3.medium` is cost-effective for small workloads.
- **Auto-Scaling**: Node groups can scale based on demand.
- **Clean Up**: Always delete EKS cluster and Docker images after submission to avoid charges.
