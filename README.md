# AWS-terraform-GitHub-project
Learning path progress = 33%

### What is Terraform
Terraform is an open source Infrastructure as code tool created by HashiCorp.

Terraform allows you to define and manage your resources across multiple cloud providers and services. It enables you to automate infrastructure provisioning, deployment and updates while lowering the possibility of human errors.

###Using Terraform to launch an EC2 Instance

###Prerequisites:
1. Install Terraform
   - Download and install Terraform from the [Official Website](https://developer.hashicorp.com/terraform/install)
   - Add the Terraform binary to your system's PATH ([Guide](https://phoenixnap.com/kb/how-to-install-terraform))
  
2. AWS
   - Set up your AWS console
   - Create an environment variable for tokens and access key. ([Guide](https://digitalcloud.training/how-to-use-and-configure-aws-cli-environment-variables/#:~:text=To%20configure%20AWS%20CLI%20with,%2C%20'Default%20output%20format'.))

### Using AWS with Terraform (Create an EC2)
   **Step 1:** Create a Terraform Project
   - Create a new directy
   - Inside the directory create a Terraform file <br>
`main.tf`

   **Step 2:** Configure AWS Provider
   - In the `main.tf` file configure the region you'd like to deploy your EC2 instance on, then Save 
   - (AWS should automatically pick up your credientials if you have set up your variable environment correctly) 
   - The latest Provider and Resource documentation for AWS can be found [Here](https://registry.terraform.io/providers/hashicorp/aws/latest)
      
      
```
# Who is the cloud provider

provider "aws" {
# Region you'd like to deploy resources to
  region = "eu-west-1"
}

# create a service/resource on the cloud - ec2 on aws

resource "aws_instance" "example" {
   ami = "ami-0905a3c97561e0b69"
   instance_type = "t2.micro"
   tags = {
     Name = "your-EC2-Name"
   }

}
```
   **Step 3:** Initialise Terraform
   - From your CMD in directory you're working from run `terraform init`
   **Expected output**
   (insert screenshot here)

   **Step 4:** Plan your Infrastructure <br>

Run `terraform plan`

   **Step 5:** Apply changes <br>
  Run `terraform apply`

**Expected output**
(insert succesful apply screenshot)

**In your AWS Management console, In EC2 you will see that your EC2 has been created.**
(EC2 Image here)

**Step 6:** Destroy resources created <br>
   Run `terraform destroy`

### Using GitHub with Terraform



   
   

   
