variables {
  word1 = "Hello"
  word2 = "World"
}

run "test_output" {
  command = plan

  assert {
    condition     = output.message == "Hello, World!"
    error_message = "unexpected output"
  }
}
