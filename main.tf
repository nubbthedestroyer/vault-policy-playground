provider "vault" {
  address = "http://localhost:8200"
//  token = "537442bc-cd09-be4a-cbb4-04886012a47a"
}

resource "vault_mount" "devplayground" {
  path = "devplayground"
  type = "generic"
}

resource "vault_generic_secret" "devplayground-secret" {
  path = "devplayground/footest"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

resource "vault_policy" "devs_policy_full" {
  name = "devs_policy_full"
  policy = "${file("${path.module}/policy-full-example.hcl")}"
}

resource "vault_policy" "devs_policy_deny_get" {
  name = "devs_policy_deny_get"
  policy = "${file("${path.module}/policy-deny-get.hcl")}"
}

resource "vault_policy" "devs_policy_deny_create" {
  name = "devs_policy_deny_create"
  policy = "${file("${path.module}/policy-deny-create.hcl")}"
}