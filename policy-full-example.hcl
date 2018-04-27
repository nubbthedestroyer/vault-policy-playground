# A full policy example
path "devplayground/*" {
  # This is a list of the actions that a token assigned this policy can take on any key in the above path
  capabilities = ["create", "read", "update", "delete", "list"]

  # This is a list of required parameters for any token performing actions on this path
  # values for each parameter in this policy are allowed values
  required_parameters = [
    "createdby",
    "reason",
    "secure"
  ]

  # This is a whitelist of all allowed parameters a token assigned this policy can perform actions on within this path
  allowed_parameters = {
    "user" = [],
    "password" = [],
    "session" = [],
    "*" = []
  }

  # This is a list of parameters that any auth method that this policy is attached to is NOT authorized to perform the
  # above actions on.  A use case for this might be to have a
  denied_parameters = {
    "bitcoin_wallet" = []
  }
}