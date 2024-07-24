module "git"{
    source ="github.com/CloudTechDevOps/terraform-07-30am/day-2-basic_code_ec2"
    ami_id="ami-056f95ba99f81dbab"
    instance_type="t3.micro"
    key_name="publickey"
}
