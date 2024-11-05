resource "cloudstack_network" "cs_net" {
  name             = "test-network"
  cidr             = "10.10.1.0/22"
  network_offering = "cloudstack_network_offering.cs_net_offering.id"
  zone             = "${var.cloudstack_zone}"
  project          = "WB-CloudConsole"
}

resource "cloudstack_network_offering" "cs_net_offering" {
    name = "cs-network-offering"
    display_text = "Network Offering"
    guest_ip_type = "Isolated"
    traffic_type = "Guest"
}
