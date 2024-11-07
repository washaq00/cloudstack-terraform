resource "cloudstack_network" "cs_net" {
  name             = "k8s-network1"
  cidr             = var.instances.cidr_prefix
  network_offering = "19823334-8f4a-465b-9de9-722477cd0ada"
  zone             = var.cloudstack_zone
  project          = var.cloudstack_project
  source_nat_ip    = "true"
}


#resource "cloudstack_ipaddress" "cs_ipaddress" {
#  network_id = cloudstack_network.cs_net.id
#  zone       = var.cloudstack_zone
#  project    = var.cloudstack_project
#}

resource "cloudstack_firewall" "cs_firewall" {
  ip_address_id = cloudstack_network.cs_net.source_nat_ip_id
  managed       = "true"
  rule {
    cidr_list = ["0.0.0.0/0"]
    protocol  = "tcp"
    ports     = ["3000-3005"]
  }
}

resource "cloudstack_port_forward" "cs_pf" {
  count         = var.instances.count
  ip_address_id = cloudstack_network.cs_net.source_nat_ip_id
  project       = var.cloudstack_project
  forward {
    protocol           = "tcp"
    private_port       = 22
    public_port        = 3000 + count.index
    virtual_machine_id = cloudstack_instance.cs_node[count.index].id
  }
}

