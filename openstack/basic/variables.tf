variable  "default_tags" {
    type = map(string)
    description = "Default tags to be applied to all resources"
    default = {
        ManagedBy = "Terraform"
        RepositoryURL = ""
    }
}

variable "tags" {
    type = map(string)
    description = "Tags to be applied to all resources"
    default = {}
}

variable "region" {
    type = string
    description = "The OpenStack region to deploy the resources"
}

variable "auth_url" {
    type = string
    description = "The OpenStack authentication URL"
}

variable "user_name" {
    type = string
    description = "The OpenStack user name"
}

variable "tenant_name" {
    type = string
    description = "The OpenStack tenant name"
}

variable "password" {
    type = string
    description = "The OpenStack user password"
}

variable "instances" {
    type = list(object({
        name = string
        image_id = string
        flavor_id = string
        key_pair_name = string
        security_group_id = string
        network_id = string
        subnet_id = string
        #floating_ip_pool = string
    }))
    description = "The OpenStack puppet server configuration values"
}

variable "key_pair" {
    type = object({
        name = string
        public_key = string
    })
    description = "The OpenStack key pair configuration values"
  
}
