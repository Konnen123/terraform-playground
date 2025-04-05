variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "The type of EC2 instance"
}

variable "ami" {
  type = string
  default = "ami-0548d28d4f7ec72c5" #Debian 12 AMI
}

variable "instance_name" {
  type = string
  default = "Terraform-Playground-Quote-Of-The-Day-API"
}

variable "key_pair_name" {
  type = string
  default = "terraform-key-pair"
}