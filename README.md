This repos will consist of a series of folders linked to Modules/Workspaces in Terraform Cloud. Each folder should contain a README.md file describing its function, status and use.

Currently have two deployments; one to deploy a RG and other a VNet in the RG

## Speculation (things I am looking to learn/prove)
I can place Azure Subscription level variables in Terraform Cloud (away from prying eyes)  
I can create a Workspace for each deployment (in Terraform Cloud) and deploy one at time  
I can pass RG 'name' attribute from the RG deployment into the VNet deployment  
I can deploy then remove the VNet creation   