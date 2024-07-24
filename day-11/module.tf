module "test" {
    source = "../day-2module"
    ami_id = var.ami
    instancetype = var.instance_type
    keyvalue = var.key_name
}