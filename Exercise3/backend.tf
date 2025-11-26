#Manually I have already created an s3 bucket named my-terraform-statestore and a folder inside it named terraform
terraform {
  backend "s3" {
    bucket = "my-terraform-statestore"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
# Now our state information will be stored in s3 bucket inside terraform/backend
