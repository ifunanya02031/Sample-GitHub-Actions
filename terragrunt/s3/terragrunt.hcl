include "root" {
  path = find_in_parent_folders("root.hcl") #Naming convention must be root.hcl
}

terraform {
  source = "../..//src/s3" #Called Module
}