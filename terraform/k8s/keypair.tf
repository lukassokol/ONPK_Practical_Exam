# --- root/keypair.tf ---

data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "openstack_compute_keypair_v2" "keypair" {
  name = "${local.project}-${var.environment}-exam-keypair"
}

resource "local_file" "private_key" {
  content         = openstack_compute_keypair_v2.keypair.private_key
  filename        = "${path.module}/${openstack_compute_keypair_v2.keypair.name}.pem"
  file_permission = "0400"
}