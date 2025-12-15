resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.key_pair.name
  public_key = var.key_pair.public_key
}

resource "openstack_compute_instance_v2" "instances" {  
    count =var.instances != null ? length(var.instances) : 0
    name = var.instances[count.index].name
    image_id = var.instances[count.index].image_id
    key_pair = var.key_pair.name
    security_groups = [var.instances[count.index].security_group_id]
    flavor_id = var.instances[count.index].flavor_id
    network {
        uuid = var.instances[count.index].network_id
    }
}
