terraform {
  backend "s3" {
    bucket = "terraformtestbucket27"
    key = "TFstatefile/terrform.tfstate"
    region = "us-east-1"
  }
}
