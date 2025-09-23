resource "aws_dynamodb_table" "example_table" {
  name         = "example_table"
  billing_mode = "PROVISIONED"
  
  attribute {
    name = "id"
    type = "S"
  }

  hash_key     = "id"
  read_capacity  = 5
  write_capacity = 5
}