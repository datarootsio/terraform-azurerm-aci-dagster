variable "resource_prefix" {
  type        = string
  default     = "ps"
  description = "Prefix that will be given to every resource name"
}

variable "resource_suffix" {
  type        = string
  default     = "sp"
  description = "Suffix that will be given to every resource name"
}