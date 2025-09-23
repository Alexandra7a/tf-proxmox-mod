resource "aws_dynamodb_table" "example" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"

  tags = {
    Name = var.dynamodb_table_name
  }
}