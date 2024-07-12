resource "ncloud_nks_cluster" "nks_cluster" {
  name                  = var.name
  hypervisor_code       = var.hypervisor_code
  cluster_type          = var.cluster_type
  login_key_name        = var.login_key_name
  zone                  = var.zone
  vpc_no                = var.vpc_no
  subnet_no_list        = var.subnet_no_list
  public_network        = var.public_network
  lb_private_subnet_no  = var.lb_private_subnet_no
  lb_public_subnet_no   = var.lb_public_subnet_no
  kube_network_plugin   = var.kube_network_plugin
  log                   = var.log
  k8s_version           = var.k8s_version
  oidc                  = var.oidc
  ip_acl_default_action = var.ip_acl_default_action
  ip_acl                = var.ip_acl
}