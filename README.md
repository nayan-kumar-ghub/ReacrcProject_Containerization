------------------*--------------------Quest App Terraform Deployment (Containerization)------------------*--------------------

This repository contains Terraform configurations to deploy the Quest App on AWS. The setup includes a VPC, an EC2 instance running a Dockerized application, and an Elastic IP for public access.

*Prerequisites

    Before you begin, ensure you have the following installed:

    >>Terraform (>= 1.0.0) → Download Terraform

    >>AWS CLI (Configured with credentials) → AWS CLI Setup

    >>SSH Client (for accessing the instance)
---------------------------------------------------------------------------------------------------------------------------------
*Infrastructure Components

This Terraform configuration provisions:

    >>VPC (10.0.0.0/16) with a Public Subnet (10.0.5.0/24)

    >>Internet Gateway and Route Table for public access

    >>Security Group allowing:
        Port 3000 (for application access)
        Port 22 (for SSH access)

    >>Elastic IP for public access to the EC2 instance

    >>EC2 Instance (t2.micro, Ubuntu-based AMI)

    >>Docker & Docker Compose installed on the EC2 instance

    >>Application Deployment using Docker Compose
---------------------------------------------------------------------------------------------------------------------------------
*Deployment Instructions

    >>Clone this repository
        git clone https://github.com/your-repo/quest-app-terraform.git
        cd quest-app-terraform

    >>Initialize Terraform
        terraform init

    >>Review the Execution Plan
        terraform plan

    >>Deploy the Infrastructure
        terraform apply -auto-approve

    >>Retrieve the Public IP
        terraform output ec2_public_ip
        Example Output:
        ec2_public_ip = "3.12.236.38"

        Access the Application
        Open your browser and navigate to:
        http://<EC2_PUBLIC_IP>:3000

    Example:
    http://3.12.236.38:3000

    >>SSH into the Instance (Optional)
        ssh -i <private-key>.pem ubuntu@<EC2_PUBLIC_IP>

---------------------------------------------------------------------------------------------------------------------------------
*Terraform Resources Created

1. Networking

>>Creates a Virtual Private Cloud (VPC) with CIDR 10.0.0.0/16
>>Creates a Public Subnet (10.0.5.0/24)
>>Creates an Internet Gateway
>>Defines a Route Table for the subnet
>>Associates the subnet with the route table

2. Security

>>Creates a Security Group with:
    Port 3000 open for application access
    Port 22 open for SSH access
    Allows all outbound traffic

3. Compute

>>Generates an SSH key pair
>>Launches an EC2 instance (t2.micro, Ubuntu-based AMI)
>>Allocates an Elastic IP for the EC2 instance
>>Associates the Elastic IP with the EC2 instance

4. Provisioning & Deployment

>>Generates an RSA private key for SSH access
>>Executes remote provisioning steps:
    Configures the EC2 instance (SSH, permissions)
    Installs Docker and Docker Compose
    Deploys the Quest App using Docker Compose
---------------------------------------------------------------------------------------------------------------------------------
*Troubleshooting

If the application doesn't start, verify Docker logs:

docker ps -a
docker logs <container_id>

Ensure your AWS credentials are correctly configured using aws configure.
---------------------------------------------------------------------------------------------------------------------------------
*Cleanup
    
    >>To destroy all created resources, run:
        terraform destroy -auto-approve

This will remove the EC2 instance, Elastic IP, VPC, and all associated resources.
---------------------------------------------------------------------------------------------------------------------------------
*Conclusion

This Terraform configuration automates the deployment of the Quest App, ensuring a reliable and repeatable infrastructure setup on AWS. By leveraging Terraform and Docker, the application is quickly provisioned and accessible via a public IP. You can easily extend this setup by modifying instance types, security rules, or integrating additional AWS services.

Author: Nayan Kumar