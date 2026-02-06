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

output "database_public_ip" {
 value=aws_instance.database.public_ip
}
output "frontend_public_ip" {
 value=aws_instance.frontend.public_ip
}
output "backend_public_ip" {
 value=aws_instance.backend.public_ip
}
