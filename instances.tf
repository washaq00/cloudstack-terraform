locals {
  template = "Ubuntu 22.04 LTS"
}

resource "cloudstack_disk" "cs_disk" {
  name               = "cs-disk"
  attach             = "true"
  disk_offering      = "3ddd2c3b-b6b0-4e35-b48a-ab4b83507432"
  size               = 10
  virtual_machine_id = "cloudstack_instance.cs_node.id"
  zone               = "${var.cloudstack_zone}"
}

#resource "cloudstack_disk_offering" "cs_custom_disk" {
#    name = "cs-disk-offering"
#    display_text = "Example Disk Offering"
#    disk_size = 50
#}

resource "cloudstack_instance" "cs_node" {
  name             = "cs-node"
  service_offering = "6bfc02bf-9d73-4990-8abc-7da0fa5b850d"
  network_id       = "cloudstack_network_offering.cs_net_offering.id"
  template         = local.template
  zone             = "${var.cloudstack_zone}"
}
