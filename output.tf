output "id" {
  description = "Cluster id."
  value       = ncloud_nks_cluster.nks_cluster.id
}

output "uuid" {
  description = "Cluster uuid. (It is the same result as id)"
  value       = ncloud_nks_cluster.nks_cluster.uuid
}

output "endpoint" {
  description = "Control Plane API address."
  value       = ncloud_nks_cluster.nks_cluster.endpoint
}

output "acg_no" {
  description = "The ID of cluster ACG."
  value       = ncloud_nks_cluster.nks_cluster.acg_no
}