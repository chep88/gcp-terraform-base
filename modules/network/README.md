# Módulo de Red (Networking)

Este módulo despliega la VPC y subredes seguras.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Nombre de la VPC | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID del proyecto de GCP | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Región donde se desplegará la subred | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Rango CIDR para la subred | `string` | `"10.0.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Nombre de la VPC creada |
| <a name="output_network_self_link"></a> [network\_self\_link](#output\_network\_self\_link) | URI completa de la VPC (útil para otros recursos) |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Nombre de la subred creada |
<!-- END_TF_DOCS -->
