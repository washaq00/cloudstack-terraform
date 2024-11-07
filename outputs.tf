output "id" {
  value       = "cloudstack_instance.instance.*.id"
  description = "The instance ID"
}

output "display_name" {
  value       = "cloudstack_instance.instance.*.display_name"
  description = "The display name of the instance"
}
