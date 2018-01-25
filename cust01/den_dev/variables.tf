### vCenter connection variables
variable "vsphere_server" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
  default     = "true"
}

### VM general variables
variable "vsphere_datacenter" {
  description = "In which datacenter the VM will be deployed"
  type        = "string"
  default     = "Datacenter"
}

variable "vsphere_cluster" {
  description = "In which cluster the VM will be deployed"
  type        = "string"
  default     = "resource01"
}

variable "vsphere_datastore" {
  description = "What is the name of the VM datastore"
  type        = "string"
  default     = "R610-04-Raid5"
}

variable "vsphere_vm_template" {
  description = "Where is the VM template located"
  type        = "string"
  default     = "template3"
}

variable "vsphere_port_group" {
  description = "In which port group the VM NIC will be configured (default: VM Network)"
  type        = "string"
  default     = "VM Network"
}

variable "vsphere_time_zone" {
  description = "What is the timezone of the VM (default: UTC)"
  type        = "string"
  default     = "UTC"
}

### VM01 specific variables
variable "vsphere_vm01_name" {
  description = "What is the name of the first VM"
  type        = "string"
  default     = ""
}

variable "vsphere_vm01_vcpu_number" {
  description = "How many vCPU will be assigned to the VM (default: 1)"
  type        = "string"
  default     = "1"
}

variable "vsphere_vm01_memory_size" {
  description = "How much RAM will be assigned to the VM (default: 1024)"
  type        = "string"
  default     = "1024"
}

variable "vsphere_vm01_domain" {
  description = "What is the domain of the VM"
  type        = "string"
  default     = ""
}

variable "vsphere_vm01_ipv4_address" {
  description = "What is the IPv4 address of the VM"
  type        = "string"
  default     = ""
}

variable "vsphere_vm01_ipv4_netmask" {
  description = "What is the IPv4 netmask of the VM (default: 24)"
  type        = "string"
  default     = "24"
}

variable "vsphere_vm01_ipv4_gateway" {
  description = "What is the IPv4 gateway of the VM"
  type        = "string"
  default     = ""
}

variable "vsphere_vm01_dns_servers" {
  description = "What are the DNS servers of the VM (default: 8.8.8.8,5.5.5.5)"
  type        = "list"
  default     = "8.8.8.8,5.5.5.5"
}
