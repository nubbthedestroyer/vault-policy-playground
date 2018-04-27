# # This is an example of a way to deny any attached auth method the ability to get secrets in the "devplayground/itonly/*" path
path "devplayground/itonly/*" {
  # This is a list of the actions that a token assigned this policy can take on any key in the above path
  capabilities = [
    "create",
    "read",
    "update",
    "delete",
    "list"
  ]

  # This is a list of parameters that any auth method that this policy is attached to is NOT authorized to perform the
  # above actions on.  A use case for this might be to have a
  denied_parameters = {
    "bitcoin_wallet" = []
  }
}