
variable "project_name" {
    description = "Cluster Name"
    default     = "microservices-stack"
}

variable "ami" {
    description = "Ubuntu 18.04 AMI"
    default = "ami-0e472ba40eb589f49"
}


variable "aws_region" {
    description = "AWS Region for the VPC"
    default     = "us-east-1"
}

# Customize your key path
variable "aws_key_path" {
    description = "key_path"
    default     = "../../lab_key.pub"
}

# Tags
variable "tags" {
    default = {
        project       = "microservices-stack"
        enviroment    = "prod"
    }
}


variable "front_proxy_instance_type" {
    description = "Front Proxy Instance type"
    default = "t3.large"
}
