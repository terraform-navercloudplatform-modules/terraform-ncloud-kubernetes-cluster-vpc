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
  dynamic "log" {
    for_each = var.log == null ? [] : [var.log]
    content {
      audit = log.value.audit
    }
  }
  k8s_version           = var.k8s_version
  dynamic "oidc" {
    for_each = var.oidc == null ? [] : [var.oidc]
    content {
      issuer_url = oidc.value.issuer_url
      client_id  = oidc.value.client_id
      username_claim = oidc.value.username_claim
      groups_claim   = oidc.value.groups_claim
      groups_prefix  = oidc.value.groups_prefix
    } 
  }
  ip_acl_default_action = var.ip_acl_default_action
  ip_acl                = var.ip_acl
}