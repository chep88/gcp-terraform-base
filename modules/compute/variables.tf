variable "instance_name" {}
variable "machine_type" { default = "e2-micro" } # Capa gratuita ;)
variable "zone" {}
variable "subnet_self_link" {
  description = "El self_link de la subred donde vivirá la VM"
}
variable "tags" {
  type    = list(string)
  default = ["allow-ssh"]
}