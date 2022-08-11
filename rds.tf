resource "aws_db_subnet_group" "db-subnetgroup" {
  name       = "db-subnetgroup"
  subnet_ids = ["subnet-08a566d7aab5ca141",
                "subnet-00cd82669c0f77ad1",
                 "subnet-026aecfd3f9bc4f0e"]

  tags = {
    Name = "db-subnetgroup"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  username               = "devapiuser"
  password               = "9573972811Mahi"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnetgroup.name
  vpc_security_group_ids = ["${aws_security_group.rds-sg.id}"]

  tags = {
    Name = "mysql"
  }

}