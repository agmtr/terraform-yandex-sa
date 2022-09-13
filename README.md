# Usage

```
locals {
  folder_id = <folder-id>
  sa_map = {
    "k8s-master-sa" = ["vpc.publicAdmin", "k8s.clusters.agent", "k8s.tunnelClusters.agent"]
    "k8s-nodes-sa"  = ["container-registry.images.pusher", "container-registry.images.puller"]
  }
}

module "sa" {
  for_each = local.sa_map

  source    = "git::https://github.com/agmtr/terraform-yandex-sa.git?ref=v1.0.0"
  folder_id = local.folder_id
  name      = each.key
  roles     = each.value
}
