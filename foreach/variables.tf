variable "ami_id" {
    type = string
    default = "ami-056f95ba99f81dbab"
}
variable "ec" {
  type = string
  default = "t3.micro"
}
variable "sandbox" {
  type = list(string)
  default = [ "dev","prod" ]
}