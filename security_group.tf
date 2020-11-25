resource aws_security_group main_ssh {
  name_prefix = var.security_group_name
  description = "Main Security Group"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_security_group main_tcp {
  name_prefix = var.security_group_name
  description = "Main TCP Security Group"

  ingress {
    description = "TCP"
    from_port   = 27000
    to_port     = 27020
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_security_group main_udp {
  name_prefix = var.security_group_name
  description = "Main UDP Security Group"

  ingress {
    description = "UDP"
    from_port   = 27000
    to_port     = 27020
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
