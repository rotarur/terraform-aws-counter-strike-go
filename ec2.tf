# PROVIDER
provider "aws" {
  region = var.region
}

# DATA SOURCES
data aws_ami ubuntu {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource aws_instance main {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name

  associate_public_ip_address = true

  user_data = data.template_file.main.rendered

  root_block_device {
    volume_size = 30
  }

  security_groups = [
    aws_security_group.main_ssh.name,
    aws_security_group.main_tcp.name,
    aws_security_group.main_udp.name
  ]
}

data template_file main {
  template = file("${path.module}/user-data.tplt")

  vars = {
    STEAM_TOKEN = var.token
  }
}

# SSH KEYS
resource tls_private_key ssh_key {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource aws_key_pair ssh_key {
  key_name_prefix = "key"
  public_key      = tls_private_key.ssh_key.public_key_openssh
}


# OUTPUTS
output public_ssh_key {
  description = "SSH Public Key"
  value       = tls_private_key.ssh_key.public_key_openssh
}

output instance_public_ip {
  description = "Instance Public IP"
  value       = aws_instance.main.public_ip
}

# LOCAL SSH KEYS
resource local_file id_rsa_pub {
  content         = tls_private_key.ssh_key.public_key_openssh
  filename        = "${path.module}/id_rsa.pub"
  file_permission = 400
}

resource local_file id_rsa {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/id_rsa"
  file_permission = 400
}
