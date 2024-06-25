
output "my_vpc" {
  value = aws_vpc.tf.id
}

output "my_subnet" {
  value = aws_subnet.selected.id
}
 