variable "len" {
  type = number
}

resource "random_id" "id" {
  byte_length = var.len
}
