module "vpc"{
    source = "./modules/vpc"
    aws_region = "us-east-1"
    vpc_cidr_block = "172.16.0.0/16"
    subnet_cidr_block =  "172.16.10.0/24"

}

module "instance_type" {
    source = "./modules/ec2"
    subnet = module.vpc.my_subnet 
    myvpc = module.vpc.my_vpc
    instance_type = "t2.micro"
    key_name = "vockey"
    ami = "ami-01b799c439fd5516a"
}

module "mysql_db" {
  source = "./modules/mysql"
  
}