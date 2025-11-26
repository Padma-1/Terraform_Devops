variable "region" {
  default = "us-east-1"
}
variable "zone1" {
  default = "us-east-1a"
}

variable "webuser" {
    default = "ubuntu"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-2 = "ami-036841078a4b68e14"
    us-east-1 = "ami-0ecb62995f68bb549"
  }
}
