module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "~> 2.0"

  name = "atlantis"

  # VPC
  cidr            = "10.20.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  public_subnets  = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]

  # DNS (without trailing dot)
   route53_zone_name = aws_route53_zone.primary.name


  # Atlantis
  atlantis_github_user       = "atlantis-bot"
  atlantis_github_user_token = "91d5c60eae3a821a76e46b24b4b53b48f6e0eb1e"
  atlantis_repo_whitelist    = ["github.com/ajrcode/cloudinfra"]
}
