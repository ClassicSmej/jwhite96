variable "instance_type" {
    type = string
    validation {
        condition = can(regex("^t2.", var.instance_type))
        error_message = "Instance must be a t2."
    }
}