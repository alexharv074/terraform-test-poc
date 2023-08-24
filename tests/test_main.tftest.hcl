variables {
  projects = {
    customer_api = {
      region       = "ap-southeast-1"
      environments = ["dev", "uat", "prd"]
    }
    internal_api = {
      region       = "ap-southeast-2"
      environments = ["prd"]
    }
    payments_api = {
      region       = "us-east-1"
      environments = ["dev", "tst", "uat", "sit", "stg", "prd"]
    }
  }
}

run "test_projects" {
  command = plan

  assert {
    condition     = local.ap_southeast_region == ["customer_api", "internal_api"]
    error_message = "unexpected projects in ap-southeast"
  }
  assert {
    condition     = local.us_east_region == ["payments_api"]
    error_message = "unexpected projects in us-east"
  }
}

run "test_invalid_input" {
  variables {
    projects = {
      customer_api = {
        region       = "eu-west-1"
        environments = ["dev", "uat", "prd"]
      }
    }
  }
  command         = plan
  expect_failures = [var.projects]
}

#run "test_totally_invalid_input" {
#  variables {
#    projects = "totally_invalid"
#  }
#  command         = plan
#  expect_failures = [var.projects]
#}
