
variable "name" {
  description = "(Required) Cluster name."
  type        = string
}

variable "hypervisor_code" {
  description = "(Optional) Hypervisor code. XEN(Default), RHV"
  type        = string
  default     = "RHV"
}

variable "cluster_type" {
  description = <<EOF
  (Required) Cluster type. Maximum number of nodes
  XEN / RHV
  10 ea : SVR.VNKS.STAND.C002.M008.NET.SSD.B050.G002
  50 ea : SVR.VNKS.STAND.C004.M016.NET.SSD.B050.G002
  EOF
  type        = string
}

variable "login_key_name" {
  description = "(Required) Login key name."
  type        = string
}

variable "zone" {
  description = "(Required) zone Code."
  type        = string
}

variable "vpc_no" {
  description = "(Required) VPC No."
  type        = string
}

variable "subnet_no_list" {
  description = "(Required) Subnet No. list."
  type        = list(string)
}

variable "public_network" {
  description = "(Optional) Public Subnet Network (boolean)"
  type        = bool
  default     = false
}

variable "lb_private_subnet_no" {
  description = "(Required) Subnet No. for private loadbalancer only."
  type        = string
}

variable "lb_public_subnet_no" {
  description = "(Optional) Subnet No. for public loadbalancer only. (Required in KR, SG, JP regions in public site)"
  type        = string
  default     = null
}

variable "kube_network_plugin" {
  description = "(Optional) Specifies the network plugin. Only Cilium is supported."
  type        = string
  default     = "Cilium"
}

variable "log" {
  description = "(Optional) Log configuration."
  type = object({
    audit = bool
  })
  default = null
}

variable "k8s_version" {
  description = "(Optional) Kubenretes version. Only upgrade is supported."
  type        = string
  default     = null
}

variable "oidc" {
  description = <<EOF
  (Optional) OIDC configuration.
  - issuer_url - (Required) Issuer URL.
  - client_id - (Required) Client ID.
  - username_prefix - (Optional) Username prefix.
  - username_claim - (Optional) Username claim.
  - groups_prefix - (Optional) Groups prefix.
  - groups_claim - (Optional) Groups claim.
  - required_claim - (Optional) Required claim.
  EOF
  type = object({
    issuer_url      = string
    client_id       = string
    username_prefix = optional(string)
    username_claim  = optional(string)
    groups_prefix   = optional(string)
    groups_claim    = optional(string)
    required_claim  = optional(string)
  })
  default = null
}

variable "ip_acl_default_action" {
  description = "(Optional) IP ACL default action. allow, deny"
  type        = string
  default     = null
  validation {
    condition     = contains(["allow", "deny"], var.ip_acl_default_action)
    error_message = "ip_acl_default_action must be either allow or deny."
  }
}

variable "ip_acl" {
  description = "(Optional) IP ACL. Supported on public, gov site"
  type = list(object({
    action  = string
    address = string
    comment = optional(string)
  }))
  default = null
}