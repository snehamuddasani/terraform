terraform {
  backend "s3"{
    bucket="qwertyujkdhsnksjb"
    key="day1/terraform.tfstate"
    region="ap-southeast-1"
  }
}