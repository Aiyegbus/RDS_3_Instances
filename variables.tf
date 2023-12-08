variable "instance_names" {
  description = "Names for instances to create."
  default     = ["E-instance-1", "E-instance-2", "E-instance-3"]
}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ami to be used"
  default     = "ami-0f8e81a3da6e2510a"
}

variable "number_of_instance" {
  description = "The number of instances to create"
  default     = 3
}

variable "key_pair" {
  default = "ayoterraformkey"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "az_count" {
  default = 2
}

variable "subnet_count" {
  default = 2
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  default     = "my-rds-instance"
}

variable "db_engine" {
  description = "The database engine to use for RDS (e.g., mysql, postgres)"
  default     = "mysql"
}

variable "db_instance_class" {
  description = "The RDS instance class"
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the initial database on the RDS instance"
  default     = "mydatabase"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  default     = "admin"
}

variable "db_password" {
  description = "The master password for the RDS instance"
  default     = "mysecretpassword"
}

variable "db_allocated_storage" {
  description = "The amount of storage (in GB) to allocate to the RDS instance"
  default     = 10
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  default     = "my-db-subnet-group"
}
