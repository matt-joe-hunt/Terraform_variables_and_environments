output "vpc_id" {
    value = aws_vpc.simple_vpc.id
}

output "public_subnetA_id" {
    value = aws_subnet.public_subnet_A.id
}