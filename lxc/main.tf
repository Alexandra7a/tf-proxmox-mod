resource "null_resource" "postgres_setup" {
  depends_on = [proxmox_lxc.pve_lxc]

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y postgresql",
      "sudo -u postgres psql -c "ALTER USER postgres PASSWORD '\{var.postgres_password}';"",
      "sudo -u postgres createdb \${var.postgres_db_name}"
    ]

    connection {
      type        = "ssh"
      host        = proxmox_lxc.pve_lxc.ip
      user        = "postgres"
      password    = var.root_pass
    }
  }
}