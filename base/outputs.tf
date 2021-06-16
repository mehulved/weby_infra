output "state_bucket" {
  value = var.state_bucket_name
}

output "state_lock_table" {
  value = var.dynamodb_lock_table_name
}
