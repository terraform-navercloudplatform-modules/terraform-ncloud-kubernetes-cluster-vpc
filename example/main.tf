terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

provider "ncloud" {}

resource "ncloud_vpc" "vpc" {
  name            = "example-vpc"
  ipv4_cidr_block = "10.0.0.0/16"
}

resource "ncloud_subnet" "subnet" {
  name           = "example-subnet"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.0.1.0/24"
  zone           = "KR-1"
  subnet_type    = "PRIVATE"
  usage_type     = "GEN"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
}

resource "ncloud_subnet" "subnet-lb" {
  name           = "example-subnet-lb"
  vpc_no         = ncloud_vpc.vpc.id
  subnet         = "10.0.100.0/24"
  zone           = "KR-1"
  subnet_type    = "PRIVATE"
  usage_type     = "LOADB"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
}

resource "ncloud_login_key" "login_key" {
  key_name = "example-key"
}

module "kubernetes-cluster-vpc" {
  source               = "terraform-navercloudplatform-modules/kubernetes-cluster-vpc/ncloud"
  name                 = "example-cluster"
  vpc_no               = ncloud_vpc.vpc.id
  subnet_no_list       = [ncloud_subnet.subnet.id]
  lb_private_subnet_no = ncloud_subnet.subnet_lb.id
  cluster_type         = "SVR.VNKS.STAND.C002.M008.NET.SSD.B050.G002"
  login_key_name       = ncloud_login_key.loginkey.key_name
  zone                 = "KR-1"
}
