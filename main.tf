locals {
  default_labels = {
    terraform        = "true"
    terraform_module = basename(abspath(path.root))
  }
}

resource "random_id" "main" {
  byte_length = 4
}

resource "yandex_iam_service_account" "main" {
  name        = var.name != null ? "${var.name}-${random_id.main.hex}" : "sa-${random_id.main.hex}"
  description = var.desc
}

resource "yandex_resourcemanager_folder_iam_member" "main" {
  for_each  = toset(var.roles)
  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.main.id}"
  role      = each.value
}
