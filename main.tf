variable "word1" {
  type = string
}

variable "word2" {
  type = string
}

locals {
  hello = "${var.word1}, ${var.word2}!"
}

output "message" {
  value = local.hello
}
