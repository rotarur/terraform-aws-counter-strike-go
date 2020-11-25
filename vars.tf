variable token {}

variable region {
  default = "eu-west-2"
}

variable security_group_name {
  description = "AWS Security Group name"
  default     = "main"
}

variable instance_type {
  description = "AWS Instance Type"
  default     = "m5.large"
}
