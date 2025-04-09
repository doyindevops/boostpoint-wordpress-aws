resource "null_resource" "simulated_dns" {
  triggers = {
    always_run = timestamp()
  }
}
