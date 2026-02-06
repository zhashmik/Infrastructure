provider "aws" {
     region="us-east-1"
}

resource "aws_instance" "database" {
     ami="ami-0b6c6ebed2801a5cb"
     instance_type="t2.medium"
     vpc_security_group_ids = ["sg-07dd3fbd2230f8dbb"]
     subnet_id              = "subnet-02884077c63e5a6ea"
     key_name               = "user"
     tags={
        Name = "Database-jp"
     }
}
resource "aws_instance" "backend" {
     ami="ami-0b6c6ebed2801a5cb"
     instance_type="t2.medium"
     vpc_security_group_ids = ["sg-07dd3fbd2230f8dbb"]
     subnet_id              = "subnet-02884077c63e5a6ea"
     key_name               = "user"
     tags={
        Name = "Backend-jp"
     }
}
resource "aws_instance" "frontend" {
     ami="ami-0b6c6ebed2801a5cb"
     instance_type="t2.medium"
     vpc_security_group_ids = ["sg-07dd3fbd2230f8dbb"]
     subnet_id              = "subnet-02884077c63e5a6ea"
     key_name               = "user"
     tags={
        Name = "Frontend-jp"
     }
}

resource "aws_eip" "database_eip" {
  instance = aws_instance.database.id
  vpc      = true
  tags = {
    Name = "Database-EIP"
  }
}

resource "aws_eip" "backend_eip" {
  instance = aws_instance.backend.id
  vpc      = true
  tags = {
    Name = "Backend-EIP"
  }
}

resource "aws_eip" "frontend_eip" {
  instance = aws_instance.frontend.id
  vpc      = true
  tags = {
    Name = "Frontend-EIP"
  }
}



