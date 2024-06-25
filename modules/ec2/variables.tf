variable "instance_type" {
description = "Type of instance to create."
type = string
}


variable "key_name" {
description = "AWS key_name."
}

variable "ami" {
description = "AWS ami."
}

variable "myvpc"{
description="AWS id."
type= string
}

variable "subnet"{
description="AWS id"
type = string
}