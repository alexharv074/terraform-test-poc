variable "list_of_words" {
  type = list(string)
}

locals {
  upper_cased = [for s in var.list_of_words : upper(s)]
}
