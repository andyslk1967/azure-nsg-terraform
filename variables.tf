variable "allowed_source_address_prefixes" {
  description = "List of source IP address prefixes allowed to access port 3342 inbound."
  type        = list(string)
  default     = ["0.0.0.0/0"]

  validation {
    condition     = length(var.allowed_source_address_prefixes) > 0
    error_message = "At least one source address prefix must be specified."
  }
}
