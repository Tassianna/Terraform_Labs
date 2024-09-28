
resource "aws_dynamodb_table" "example" {
  name         = var.table_name 
  hash_key     = var.hash_key   

  attribute { 
    name = var.hash_key
    type = var.dynamodb_hash_key_type  
  }

  billing_mode = var.billing_mode 
}