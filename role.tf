# IAM assume role policy document for the IAM role
data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    dynamic "principals" {
      for_each = var.account_ids
      iterator = ids

      content {
        type = "AWS"
        identifiers = [
          "arn:aws:iam::${ids.value}:root"
        ]
      }
    }
  }
}

# The IAM role
resource "aws_iam_role" "the_role" {
  name               = local.role_name
  description        = local.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
}

# IAM policy document that that allows for reading the certificate
# information for a specific hostname from the S3 bucket where it is
# stored.
data "aws_iam_policy_document" "cert_doc" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.cert_bucket_name}/${var.cert_path}/${var.hostname}/*",
    ]
  }
}

# The IAM policy for our cert-reading role
resource "aws_iam_role_policy" "cert_policy" {
  role   = aws_iam_role.the_role.id
  policy = data.aws_iam_policy_document.cert_doc.json
}
