locals {
  cluster_name = "sajal-eks-${random_string.suffix.result}"
}
resource "random_string" "suffix" {
  length  = 3
  special = false
}