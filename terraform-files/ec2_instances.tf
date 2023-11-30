resource "aws_instance" "control" {
  ami             = "ami-0fc5d935ebf8bc3bc" # Replace with the correct AMI ID
  instance_type   = "t3.small"
  subnet_id       = aws_subnet.subnet_1a.id
  security_groups = [aws_security_group.control_node_sg.id]
  key_name        = "server_key"

  tags = {
    Name = "k8s_control_node"
  }
}

resource "aws_instance" "node1" {
  ami             = "ami-0fc5d935ebf8bc3bc" # Replace with the correct AMI ID
  instance_type   = "t3.small"
  subnet_id       = aws_subnet.subnet_1a.id
  security_groups = [aws_security_group.control_node_sg.id]
  key_name        = "server_key"

  tags = {
    Name = "k8s_node1"
  }
}

resource "aws_instance" "node2" {
  ami             = "ami-0fc5d935ebf8bc3bc" # Replace with the correct AMI ID
  instance_type   = "t3.small"
  subnet_id       = aws_subnet.subnet_1a.id
  security_groups = [aws_security_group.control_node_sg.id]
  key_name        = "server_key"

  tags = {
    Name = "k8s_node2"
  }
}

resource "aws_eip" "control_eip" {
  instance = aws_instance.control.id
  domain   = "vpc"
}

resource "aws_eip" "node1_eip" {
  instance = aws_instance.node1.id
  domain   = "vpc"
}

resource "aws_eip" "node2_eip" {
  instance = aws_instance.node2.id
  domain   = "vpc"
}
