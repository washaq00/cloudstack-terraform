resource "cloudstack_network" "cs_net" {
  name             = "test2-network"
  cidr             = var.instances.cidr_prefix
  network_offering = "19823334-8f4a-465b-9de9-722477cd0ada"
  zone             = var.cloudstack_zone
  project          = var.cloudstack_project
}

