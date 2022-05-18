#Configure AWS Networking components (VPC, TGW)

resource "aws_vpc" "vault-vpc" {
    cidr_block = "172.29.0.0/16"
    tags = {
      "Name" = "cbeck-vault-train-demo-vpc"
    }
}

resource "aws_ec2_transit_gateway" "vault-tgw" {
    tags = {
      "Name" = "cbeck-vault-train-demo-tgw"
    }
}

resource "aws_ram_resource_share" "vault-resource-share" {
    name = "vault-train-demo-resource-share"
    allow_external_principals = true
}

resource "aws_ram_principal_association" "vault-ram-prin-assoc" {
  resource_share_arn = aws_ram_resource_share.vault-resource-share.arn
  principal = hcp_hvn.vault-hvn.provider_account_id
}

resource "aws_ram_resource_association" "vault-ram-rec-assoc" {
  resource_arn = aws_ec2_transit_gateway.vault-tgw.arn
  resource_share_arn = aws_ram_resource_share.vault-resource-share.arn
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "tgw-accept" {
  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.vault-hcp-tgwa.provider_transit_gateway_attachment_id
}