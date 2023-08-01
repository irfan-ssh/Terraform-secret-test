resource "aws_iam_role" "role" {
  name = "Admin"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : "arn:aws:iam::${var.account_id}:root"
          },
          "Action" : "sts:AssumeRole",
          "Condition" : {}
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "policy" {
  name = "Admin-policy"
  role = aws_iam_role.role.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "*",
          "Resource" : "*"
        }
      ]
    }
  )
}
