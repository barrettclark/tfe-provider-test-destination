terraform {
  backend "remote" {
    organization = "barretto"

    workspaces {
      name = "tfe-provider-test-destination"
    }
  }
}

data "tfe_outputs" "pet" {
  organization = "barretto"
  workspace    = "tfe-provider-test-source"
}

output "pet" {
  value = nonsensitive(data.tfe_outputs.pet.values.pet)
}
