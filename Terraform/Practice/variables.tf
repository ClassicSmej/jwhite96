variable "instance_type" {
  type = string

  validation {
    condition     = can(regex("t2.micro", var.instance_type))
    error_message = "Incorrect instance type: Must be a t2.micro."
  }
}