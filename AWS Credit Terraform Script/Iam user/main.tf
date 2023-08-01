resource "aws_iam_user" "user" {
  path = "/"
  name = "irfan"
}
resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name

}
# ===========================================
# backend policy
# ===========================================
resource "aws_iam_policy" "user" {
  name = "irfan-policy"
  path = "/"
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


resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.user.arn
}