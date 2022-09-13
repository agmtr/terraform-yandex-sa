variable "folder_id" {
  type    = string
  default = null
}

variable "name" {
  type    = string
  default = null
}

variable "desc" {
  type    = string
  default = null
}

variable "roles" {
  type    = list(string)
  default = null
}

variable "labels" {
  type    = map(string)
  default = {}
}
