# --- root/user_data.tf ---

# Scripts
data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_base"
    content      = file("${path.module}/scripts/1-base.sh")
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_docker"
    content      = file("${path.module}/scripts/2-docker.sh")
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_minikube"
    content      = file("${path.module}/scripts/3-minikube.sh")
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_helm"
    content      = file("${path.module}/scripts/4-helm.sh")
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_tekton"
    content      = file("${path.module}/scripts/5-tekton.sh")
  }
}