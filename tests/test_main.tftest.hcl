variables {
  list_of_words = ["foo", "bar", "baz"]
}

run "test_some_words" {
  variables {
    list_of_words = ["foo", "bar", "baz"]
  }

  command = plan

  assert {
    condition     = local.upper_cased == ["FOO", "BAR", "BAZ"]
    error_message = "unexpected output"
  }
}

run "test_empty_list" {
  variables {
    list_of_words = []
  }

  command = plan

  assert {
    condition     = length(local.upper_cased) == 0
    error_message = "unexpected output"
  }
}
