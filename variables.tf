variable "cloudstack_api_url" {
 type        = string
 description = "Api url"
 default     = "https://cs.dco.webdisk.io/client/api"
}

variable "cloudstack_api_key" {
 type        = string
 description = "Api key available in the profile tab"
 sensitive = true
}

variable "cloudstack_secret_key" {
  type        = string
  description = "Secret kay available in the profile tab"
  sensitive = true
}

variable "cloudstack_zone" {
  type        = string
  description = "Default zone"
  default     = "PL North"
}

variable "kubernetes_version" {
  type        = string
  description = "K8s available versions"
  validation {
    condition     = contains(["1.28.4", "1.27.8"], var.kubernetes_version)
    error_message = "Invalid kubernetes version provided, allowed are 1.28.4, 1.27.8"
  }
  default = "1.28.4"
}

