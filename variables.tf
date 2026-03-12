variable "job_name" {
  description = "The unique name for the Nomad job"
  type        = string
  default     = "tetris"
}

variable "nomad_addr" {
  description = "The HTTP address of the Nomad server"
  type        = string
  default     = "http://192.168.34.14:4646"
}

variable "tetris_count" {
  description = "Number of instances to run"
  type        = number
  default     = 5
}

variable "env_label" {
  description = "The environment constraint value"
  type        = string
  default     = "dev-cluster"
}

variable "res_cpu" {
  description = "CPU resources in MHz"
  type        = number
  default     = 50
}

variable "res_mem" {
  description = "Memory resources in MB"
  type        = number
  default     = 256
}
