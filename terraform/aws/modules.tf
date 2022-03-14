module "network" {
  source = "./modules/network"
  
  cluster_name  = var.cluster_name
  aws_region    = var.aws_region
}

module "master" {
  source = "./modules/master"

  cluster_name  = var.cluster_name
  aws_region    = var.aws_region
  k8s_version   = var.k8s_version

  cluster_vpc   = module.network.cluster_vpc
  private_subnet_1a   = module.network.private_subnet_1a
  private_subnet_1c   = module.network.private_subnet_1c
}

module "nodes" {
  source = "./modules/nodes"

  cluster_name        = var.cluster_name
  aws_region          =  var.aws_region
  k8s_version         = var.k8s_version

  cluster_vpc         = module.network.cluster_vpc
  private_subnet_1a   = module.network.private_subnet_1a
  private_subnet_1c   = module.network.private_subnet_1c

  eks_cluster         = module.master.eks_cluster
  eks_cluster_sg      = module.master.security_group

  nodes_instances_sizes   = var.nodes_instances_sizes
  auto_scale_options      = var.auto_scale_options

  auto_scale_cpu     = var.auto_scale_cpu
}

module "front-proxy" {
  source = "./modules/front-proxy"

  project_name  = var.project_name
  aws_region    =  var.aws_region
  front-proxy_instance_type = var.front-proxy_instance_type
  tags = var.tags
  ami = var.ami
  cluster_vpc   = module.network.cluster_vpc
  subnet_id  = module.network.public_subnet_1a
  key = var.key
  public_subnet_1a = module.network.public_subnet_1a

}

module "onpremisses" {
  source = "./modules/onpremisses"

  project_name  = var.project_name
  aws_region    =  var.aws_region
  onpremisses_instance_type = var.onpremisses_instance_type
  tags = var.tags
  ami = var.ami
  cluster_vpc   = module.network.cluster_vpc
  subnet_id  = module.network.public_subnet_1a
  key = var.key
  public_subnet_1a = module.network.public_subnet_1a

}

module "key-pair" {
  source = "./modules/key-pair"

  project_name  = var.project_name
  aws_key_path = var.aws_key_path
}