resource "aws_instance" "onpremisses" {

    ami = var.ami
    instance_type = var.onpremisses_instance_type

    subnet_id = var.public_subnet_1a.id
    associate_public_ip_address = true

    vpc_security_group_ids = [ 
        aws_security_group.onpremisses.id
    ]

    key_name = aws_key_pair.cluster_key.key_name

    tags = merge(var.tags, { 
        Name = format("%s-onpremisses", var.project_name)
    })

}

resource "aws_security_group" "onpremisses" {

    name        = format("%s-onpremisses-sg", var.project_name)

    vpc_id = var.cluster_vpc.id

    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(var.tags, { 
        Name = format("%s-onpremisses-sg", var.project_name)
    })


}