# AWS-terraform-GitHub-project

## Diagram
![alt text](/images/diagram.jpg)

### What is Terraform
Terraform is an open source Infrastructure as code tool created by HashiCorp.

Terraform allows you to define and manage your resources across multiple cloud providers and services. It enables you to automate infrastructure provisioning, deployment and updates while lowering the possibility of human errors.

### Using Terraform

### Terraform Prerequisites:
1. Install Terraform
   - Download and install Terraform from the [Official Website](https://developer.hashicorp.com/terraform/install)
   - Add the Terraform binary to your system's PATH ([Guide](https://phoenixnap.com/kb/how-to-install-terraform))
     
### Using Terraform to launch an EC2 Instance  
1. AWS
   - Set up your AWS console
   - Create an environment variable for tokens and access key. ([Guide](https://digitalcloud.training/how-to-use-and-configure-aws-cli-environment-variables/#:~:text=To%20configure%20AWS%20CLI%20with,%2C%20'Default%20output%20format'.))

### Using AWS with Terraform (Create an EC2)
   **Step 1:** Create a Terraform Project
   - Create a new directory
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
- From your terminal in directory you're working from run `terraform init`
     
**Expected output:** <br>
![alt text](/images/terraform_init.PNG)

   **Step 4:** Plan your Infrastructure <br>

Run `terraform plan`

   **Step 5:** Apply changes <br>
  Run `terraform apply`

**Expected output** <br>
![alt text](/images/tf_apply.PNG)

**In your AWS Management console, In EC2 you will see that your EC2 has been created.** <br>
![alt text](/images/ec2.PNG)

**Step 6:** Destroy resources created <br>
   Run `terraform destroy`

### Using GitHub with Terraform (Create a Repo)

### GitHub Prerequisites:

- Access to GitHub account
- Terraform installed on your device

**Generate API token on GitHub**

**Step: 1**
- On GitHub head to `Settings`
- Select `Developer Settings` > `Developer Settings` > `Personal access tokens`
- Select `Fine-grained tokens`
- Select `Generate new token` <br>
![alt text](/images/github_token.PNG)

**Step 2:** Name the token, Set expiration date

**Step 3** Set repository access as `All repositories` <br>
![alt text](/images/repo_all_access.PNG)

**Step 4:** Click repository permissions > Administration > Read and Write <br>
![alt text](/images/repo_permissions.PNG)


**Step 5:** Click `Generate Token`
- Make sure you copy your token for use in the next steps
- Similar to AWS access credentials, you can set the token as an environment variable (`GITHUB_TOKEN`) or use directly in the Terraform file. <br>
![alt text](/images/github_token.PNG)

**Deploy repo using Terraform**

**Step 1:** 
- In the previously created directory create a new folder `git-repo`.
- in `git-repo` create a `git-repo.tf` file.

**Step 2:**
- In `git-repo.tf` add the provider and token (if set as variable then ignore Token)

 ```
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "github" {

# if token is set as variable then remove >token = "YOUR-GITHUB-TOKEN<
token = "YOUR-GITHUB-TOKEN"

resource "github_repository" "example" {
  name        = "MyTerraformTest"
  description = "Terraform Test"

  visibility = "public"

}
```
**Step 3:** Initialise Terraform

- In your terminal navaigate to your working directory
- run `terraform init`

**Step 4** Plan infrastructure

- run `terraform plan`

**Step 5** Apply infrastructure

- run `terraform apply`
- On GitHub you should now be able to find your new repository

**Step 6:** Destroy resources created <br>
- Run `terraform destroy`

### Using Terraform to create S3 Buckets

### AWS Prerequisites:

1. AWS
   - Set up your AWS console
   - Create an environment variable for tokens and access key. ([Guide](https://digitalcloud.training/how-to-use-and-configure-aws-cli-environment-variables/#:~:text=To%20configure%20AWS%20CLI%20with,%2C%20'Default%20output%20format'.))
   - Create directory `s3`


**Create S3 Bucket**

Inside the directory create `s3.tf` file

**Step 1:** Configure provider in `s3.tf` file

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region="eu-west-1"
}
```
- The latest Provider and Resource documentation for AWS can be found [Here](https://registry.terraform.io/providers/hashicorp/aws/latest)
  
**Step 2:** Configure resources in `s3.tf`

```
resource "aws_s3_bucket" "example" {
  bucket = "testbucket123456"

  tags = {
    Name        = "test_bucket"
    Environment = "Dev"
  }
}
```
- Note: S3 buckets must have a unique name

**Step 6** Initialise Terraform
- In your terminal, navigate to your working directory
- run `terraform init`

**Step 5:** Plan your Infrastructure 
- run `terraform plan`

**Step 6:** Apply Infrastructure

- run`terraform apply`

**If you navigate to AWS S3, you will see that a bucket has been created.**  <br>
![alt text](/images/s3.PNG)

**Step 6:** Destroy resources created <br>
 -  Run `terraform destroy`


### Using S3 Backend for `.tfstate` file

### Backend prerequisites

1. AWS
   - Set up your AWS console
   - Create an environment variable for tokens and access key. ([Guide](https://digitalcloud.training/how-to-use-and-configure-aws-cli-environment-variables/#:~:text=To%20configure%20AWS%20CLI%20with,%2C%20'Default%20output%20format'.))
   - An S3 bucket
  
**Setting up Backend**

**Step 1:** Backend file
- Create a new Terraform file called `backend.tf`

**Step 2** Configuring backend
- The latest backend configurations can be found [here](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- Sample code <br>
 ```
  terraform {
  backend "s3" {
    bucket = "emiledevopstest556373"
    key    = "test/directory/terraform.tfstate"
    region = "eu-west-1"
  }
}
```

**Step 3:** Initialising backend
- In your terminal run `terraform init` <br>
![alt text](/images/tf_backend.PNG)

**Step 4:** Check it worked
- Navigate your way to S3 on AWS
- Open your bucket and find your .tfstate file
  ![alt text](/images/tf_state_backend.PNG)













   
   

   
