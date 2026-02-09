output "sg_map" {
  value = {
    (var.bastion_name)  = aws_security_group.mvp_bastion_sg.id
    (var.frontend_name) = aws_security_group.mvp_frontend_sg.id
    (var.backend_name)  = aws_security_group.mvp_backend_sg.id
    (var.db_name)       = aws_security_group.mvp_db_sg.id
  }
}
