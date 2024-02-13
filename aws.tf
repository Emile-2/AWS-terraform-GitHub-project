resource "aws_instance" "EmileTestEC2" {
    ami = "ami-0323d48d3a525fd18"
    instance_type = "t2.micro"
    tags = {
      Name = "EmileTestEC2Terraform"
    }
  
}