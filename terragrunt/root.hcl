remote_state { #'remote_state backend; terragrunt automatically creates *certain* resources that dont exist, if they are hardcoded
  backend = "s3"
  generate = {
    path      = "backend.tf" #*
    if_exists = "overwrite"
  }
  config = {
    bucket         = "8507-terraform-state" #"${get_account_id}-terraform-state" dynamically retrieving your account ID as part of the bucket name
    key            = "${path_relative_to_include()}/terraform.tfstate" #wherever its provisioned from it'll mention/create folder name; wont mix metadata
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-DB-table-statelocking" #terragrunt will create this non-existing DB table, without need for resource block
  }
}
