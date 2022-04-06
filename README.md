# EKS Helm SOPS action

This action allows you to execute Helm commands against an EKS cluster. It also
has the `helm-secrets` plugin for Mozilla SOPS.

## Inputs

### `eksCluster`

**Required** Name of the EKS cluster where you want to run Helm.

### `args`

**Required** Arguments you want to pass to Helm.

## Example usage

```yaml
uses: mool/eks-helm-sops-action
with:
  eksCluster: main-prod-cluster
  args: upgrade --install -n ns_name release_name path_to_chart/
```
