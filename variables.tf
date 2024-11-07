variable "instances" {
  type = object({
    count          = number
    cidr_prefix    = string
    first_host_num = optional(number, 5)
  })
  default = {
    count          = 3
    cidr_prefix    = "10.1.10.0/24"
   
  }
  nullable = false
}

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

variable "cloudstack_project" {
  type        = string
  description = "Customer's project"
  default     = "WB-CloudConsole"
}

