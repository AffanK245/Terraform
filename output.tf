output "public_ip" {
    value = aws_instance.MyEC21.public_ip
}
output "eip_address" {
    value = aws_eip.MyElasticIP.public_ip
}


