output "instance" {
  value = aws_instance.vaultsrv01.public_ip
}

#output "hcp" {
#    value = hcp_vault_cluster.vault-east.vault_private_endpoint_url
#}