# Linux VM Input Variables Placeholder file.
variable "web_linuxvm_instance_count" {
  description = "Web Linux VM Instance Count"
  type        = number
  default     = 1
}

# Web LB Inbout NAT Port for All VMs
variable "lb_inbound_nat_ports" {
  description = "Web LB Inbound NAT Ports List"
  type        = list(string)
  default     = ["1022", "2022", "3022", "4022", "5022"]
}



variable "bastion_ngs_inbound_ports" {
  description = "web vmss inbound ports"
  type        = list(string)
  default     = [22, 80, 443, 3306]
}