# This is an example of a way to deny any attached auth method the ability to create secrets in the "devplayground/*" path
path "devplayground/*" {
  # This is a list of the actions that a token assigned this policy can take on any key in the above path
  capabilities = [
    "create"
  ]

  # This is a list of parameters that any auth method that this policy is attached to is NOT authorized to perform the
  # above actions on.  A use case for this might be to have a
  denied_parameters = {
    "*" = []
  }
}