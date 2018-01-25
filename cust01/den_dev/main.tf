### Configure vSphere provider

provider "vsphere" {
  vsphere_server       = "${var.vsphere_server}"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  allow_unverified_ssl = "${var.vsphere_unverified_ssl}"
}

### VM data

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_port_group}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_vm_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

### Configure vSphere VM01
resource "vsphere_virtual_machine" "vm01" {
  name             = "${var.vsphere_vm01_name}"
  num_cpus         = "${var.vsphere_vm01_vcpu_number}"
  memory           = "${var.vsphere_vm01_memory_size}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    name             = "${var.vsphere_vm01_name}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vsphere_vm01_name}"
        domain    = "${var.vsphere_vm01_domain}"
        time_zone = "${var.vsphere_time_zone}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_vm01_ipv4_address}"
        ipv4_netmask = "${var.vsphere_vm01_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.vsphere_vm01_ipv4_gateway}"
      dns_suffix_list = ["${var.vsphere_vm01_domain}"]
      dns_server_list = ["${var.vsphere_vm01_dns_servers}"]
    }
  }
}

### Configure vSphere VM02
resource "vsphere_virtual_machine" "vm02" {
  name             = "${var.vsphere_vm02_name}"
  num_cpus         = "${var.vsphere_vm02_vcpu_number}"
  memory           = "${var.vsphere_vm02_memory_size}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    name             = "${var.vsphere_vm02_name}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vsphere_vm02_name}"
        domain    = "${var.vsphere_vm02_domain}"
        time_zone = "${var.vsphere_time_zone}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_vm02_ipv4_address}"
        ipv4_netmask = "${var.vsphere_vm02_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.vsphere_vm02_ipv4_gateway}"
      dns_suffix_list = ["${var.vsphere_vm02_domain}"]
      dns_server_list = ["${var.vsphere_vm02_dns_servers}"]
    }
  }
}

### Configure vSphere VM03
resource "vsphere_virtual_machine" "vm03" {
  name             = "${var.vsphere_vm03_name}"
  num_cpus         = "${var.vsphere_vm03_vcpu_number}"
  memory           = "${var.vsphere_vm03_memory_size}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    name             = "${var.vsphere_vm03_name}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vsphere_vm03_name}"
        domain    = "${var.vsphere_vm03_domain}"
        time_zone = "${var.vsphere_time_zone}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_vm03_ipv4_address}"
        ipv4_netmask = "${var.vsphere_vm03_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.vsphere_vm03_ipv4_gateway}"
      dns_suffix_list = ["${var.vsphere_vm03_domain}"]
      dns_server_list = ["${var.vsphere_vm03_dns_servers}"]
    }
  }
}
