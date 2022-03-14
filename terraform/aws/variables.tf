variable "cluster_name" {
  default = "k8s-demo"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "k8s_version" {
  default = "1.21"
}

variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

variable "auto_scale_cpu" {
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}

variable "project_name" {
    description = "Cluster Name"
    default     = "microservices-stack"
}

variable "ami" {
    description = "Ubuntu 18.04 AMI"
    default = "ami-0e472ba40eb589f49"
}


# Customize your key path
variable "aws_key_path" {
    description = "key_path"
    default     = "./lab_key.pub"
}

# Tags
variable "tags" {
    default = {
        project       = "microservices-stack"
        enviroment    = "prod"
    }
}

variable "onpremisses_instance_type" {
    description = "Front Proxy Instance type"
    default = "t3.large"
}

variable "front-proxy_instance_type" {
    description = "Front Proxy Instance type"
    default = "t3.large"
}

