variable "vpc_config" {
  description = "To get the CIDR & name of vpc from the user."
  type = object({
    name = string
    cidr_block = string
  })
  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "INVALID CIDR Format - ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  # sub1={cidr_block=..., az=.. } sub2={cidr_block=.., az=..}
  description = "To get the cidr of subnet and az"
  type = map(object({
    cidr_block = string
    az = string
    public = optional(bool, false)
  }))

  validation {
    # sub1={cidr=..} sub2={cidr=..}, [true, true] 
    condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "INVALID CIDR Format - ${var.vpc_config.cidr_block}"
  }
}