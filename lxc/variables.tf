variable "postgres_password" {
  type        = string
  sensitive   = true
  description = "The password for the PostgreSQL user"
  nullable    = false
}

variable "postgres_db_name" {
  type        = string
  description = "The name of the PostgreSQL database to create"
  default     = "mydatabase"
  nullable    = false
}
variable "postgres_password" {
  type        = string
  sensitive   = true
  description = "The password for the PostgreSQL user"
  nullable    = false
}

variable "postgres_db_name" {
  type        = string
  description = "The name of the PostgreSQL database to create"
  default     = "mydatabase"
  nullable    = false
}