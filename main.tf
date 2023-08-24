variable "projects" {
  description = "Map of projects"

  type = map(object({
    region       = string
    environments = list(string)
  }))

  validation {
    condition = alltrue([
      for proj in var.projects : (startswith(proj.region, "us-east-") || startswith(proj.region, "ap-southeast-"))
    ])
    error_message = "The provided region for some projects is unexpected. It should start with 'us-east-' or 'ap-southeast-'."
  }

  validation {
    condition = alltrue([
      for proj in var.projects : alltrue([for env in proj.environments : contains(["dev", "tst", "uat", "sit", "stg", "prd"], env)])
    ])
    error_message = "Some environments in the projects are invalid. They should be one of: 'dev', 'tst', 'uat', 'sit', 'stg', or 'prd'."
  }
}

locals {
  ap_southeast_region = [
    for key, val in var.projects : key
    if startswith(val.region, "ap-southeast")
  ]
  us_east_region = [
    for key, val in var.projects : key
    if startswith(val.region, "us-east")
  ]
}
