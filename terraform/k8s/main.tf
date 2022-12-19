# --- root/main.tf ---

module "instance" {
  source        = "github.com/lukassokol/ONPK_Practical_Exam/terraform/base"
  project       = local.project
  environment   = var.environment
  my_public_ip  = data.http.my_public_ip.response_body
  key_pair_name = openstack_compute_keypair_v2.keypair.name
  flavor_name   = var.flavor_name
  user_data     = data.cloudinit_config.user_data.rendered
}
