# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  # OpenStack credentials
  user_name   = var.user_name
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
  endpoint_overrides = {
    "Compute" =	"http://10.100.1.23:8774/v2.1"
    "Compute_Legacy" = "http://10.100.1.23:8774/v2/3494e6e37ea34a1392c056fe1dec2214"
    "Identity" =	"http://10.100.1.23:5000"
    "Image"	= "http://10.100.1.23:9292"
    "Network"	= "http://10.100.1.23:9696"
    "Placement" =	"http://10.100.1.23:8780"
  }

}