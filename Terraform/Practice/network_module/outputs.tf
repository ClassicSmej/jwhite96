
output "subnets" {
  value = aws_subnet.subnet.*.id # [for i in aws_subnet.subnet : i.id] 
}