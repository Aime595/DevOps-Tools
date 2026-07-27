variable "tags_map" {
    type = map(string)
    description = "tags for resources"
    default = {
      company = "ReservePartners"
      project = "CAI creds"
      environment = "prod"
    }
}