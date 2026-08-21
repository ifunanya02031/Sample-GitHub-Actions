module "s3" {
    source = "../..//modules/s3"

    bucket = "ci-cd-bucket-8.21.26"
    region = "us-east-1"
}