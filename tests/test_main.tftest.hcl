variables {
  len = 16
}

run "test_len" {
  command = plan

  assert {
    condition     = random_id.id.byte_length == 16
    error_message = "expected byte length"
  }
}
