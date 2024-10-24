variable "vm_count" {
  type    = number
  default = 1  # Количество виртуальных машин
}

data "vkcs_compute_flavor" "compute" {
  name = var.compute_flavor
}

data "vkcs_images_image" "compute" {
  name = var.image_name
}

#resource "vkcs_networking_floatingip" "fip" {
#  pool = data.vkcs_networking_network.ext-net.name
#}

#resource "random_string" "vm_name" {
#  length  = 8
#  special = false
#}

resource "vkcs_compute_instance" "nikitin_vm" {
  count                   = var.vm_count
#name                    = "nikitin-project-${random_string.vm_name.result}"
  name                    = "nikitin-project-server"
  flavor_id               = data.vkcs_compute_flavor.compute.id
  key_pair                = var.key_pair_name
  security_groups         = ["default", "ssh", "security_group_nikitin"]
  availability_zone       = var.availability_zone_name

  block_device {
    uuid                  = data.vkcs_images_image.compute.id
    source_type           = "image"
    destination_type      = "volume"
    volume_type           = "ceph-ssd"
    volume_size           = 30
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid        = "83e88a59-1b2f-4aa2-8d52-4c374399507c"
#    fixed_ip_v4 = format("192.168.254.%d", 101 + count.index * 10)
     fixed_ip_v4 = format("192.168.254.254")
}
#provisioner "remote-exec"{
#    inline = [
#        "sudo apt update",
#        "sudo apt install ansible -y"
#    ]
#provisioner "file"{
#        source = "install.sh"
#        destination = "/home/ubuntu/install.sh"
#        connection{
#            type = "ssh"
#            user = "ubuntu"
#            private_key = file("~/.ssh/id_rsa")
#            host = self.network[0].fixed_ip_v4
#        }
#}

#  depends_on = [
#    vkcs_networking_network.nikitin,
#    vkcs_networking_subnet.nikitin
#  ]
}



#resource "null_resource" "example" {
#depends_on = [vkcs_compute_instance.nikitin_vm]
#}

output "vm_hostnames" {
  value = [for vm in vkcs_compute_instance.nikitin_vm : vm.name]
}

output "vm_ips" {
  value = [for vm in vkcs_compute_instance.nikitin_vm : vm.network[0].fixed_ip_v4]
}
