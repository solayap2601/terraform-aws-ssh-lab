output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.cmtr-g40pyt8i-ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.cmtr-g40pyt8i-ec2.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.cmtr-g40pyt8i-ec2.private_ip
}

output "key_pair_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.cmtr-g40pyt8i-keypair.key_name
}