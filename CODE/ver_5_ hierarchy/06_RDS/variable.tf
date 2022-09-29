variable "region" {
  type    = string
  default = ""
}

variable "prefix" {
  type    = string
  default = ""
}

# variable "azs" {
#   type    = list(string)
#   default = []
# }

# variable "rds_name" {
#   type    = string
#   default = ""
# }

# variable "engine_info" {
#   type = map(string)
#   default = {}
# }

# variable "rds_cluster_identifier" {
#   type = map(string)
#   default = {}
# }

variable "add_rds_aurora" {
  type    = map(any)
  default = {}
}

variable "add_parameter" {
  type = map(any)
  # type    = map(object({}))
  # type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}