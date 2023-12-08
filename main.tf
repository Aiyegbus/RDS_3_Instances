# RDS Instance
resource "aws_db_instance" "my_rds_instance" {
  identifier        = var.db_instance_identifier
  engine            = var.db_engine
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  #name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
}

# EC2 Instances
resource "aws_instance" "my_ec2_instances" {
  count                       = var.number_of_instance
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  subnet_id                   = aws_subnet.my_subnet[count.index % length(aws_subnet.my_subnet)].id
  associate_public_ip_address = true # Enables public IP addresses for EC2 instances


  tags = {
    Name = var.instance_names[count.index]
  }
}

