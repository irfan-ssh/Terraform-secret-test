
output "aws_user_access_key" {
  value = aws_iam_access_key.user.id

}
output "aws_user_secret_key" {
  value     = aws_iam_access_key.user.secret
  sensitive = true
}

resource "local_file" "file" {
  filename = "data-file.txt"
  content  = <<EOF
  [aws1]
  ${aws_iam_access_key.user.id}   ${aws_iam_access_key.user.secret}
EOF
}
