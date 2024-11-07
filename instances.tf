locals {
  template = "Ubuntu 24.04 LTS"
}

resource "cloudstack_instance" "cs_node" {
  count            = var.instances.count
  name             = "cs-node${count.index}"
  ip_address       = cidrhost(var.instances.cidr_prefix,var.instances.first_host_num + count.index,)
  service_offering = "c656c2d8-885f-4d76-b610-fae8620c0e3f"
  network_id       = cloudstack_network.cs_net.id
  template         = local.template
  zone             = var.cloudstack_zone
  project          = var.cloudstack_project
  expunge          = "true"
  keypair          = "fwaszak"
}

#resource "cloudstack_disk" "cs_disk" {
#  name               = "cs-disk"
#  attach             = "true"
#  disk_offering      = "3ddd2c3b-b6b0-4e35-b48a-ab4b83507432"
#  virtual_machine_id = cloudstack_instance.cs_node.id
#  zone               = var.cloudstack_zone
#  project            = var.cloudstack_project
#}

