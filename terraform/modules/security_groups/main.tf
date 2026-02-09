
resource "aws_security_group" "mvp_bastion_sg" {
  name        = "${var.bastion_name}-sg"
  description = "SSH access only from own IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from own IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.own_ip_cidr]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    # Standard way to allow all protocols and ports in egress rules
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.bastion_name}-sg" }
}

resource "aws_security_group" "mvp_frontend_sg" {
  name        = "${var.frontend_name}-sg"
  description = "Public web access (vote/result)"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  description     = "SSH only from Bastion"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [aws_security_group.mvp_bastion_sg.id]
  }
  
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.frontend_name}-sg" }
}

resource "aws_security_group" "mvp_backend_sg" {
  name        = "${var.backend_name}-sg"
  description = "Private backend redis & worker"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH only from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.mvp_bastion_sg.id]
  }

  ingress {
    description     = "Access from Frontend"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.mvp_frontend_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.backend_name}-sg" }
}

resource "aws_security_group" "mvp_db_sg" {
  name        = "${var.db_name}-sg"
  description = "Private Postgres DB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH only from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.mvp_bastion_sg.id]
  }

  ingress {
    description     = "Worker & Redis only from Backend"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.mvp_backend_sg.id]
  }
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.db_name}-sg" }
}
