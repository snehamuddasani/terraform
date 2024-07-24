variable "ami" {
  description = "The AMI ID for the EC2 instance."
  type = string
  default = ""
}
 
variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type = string
  default = ""
}

 
variable "key_name" {
  description = "Key pair to associate with the EC2 instance."
  type = string
  default = ""
}
 
