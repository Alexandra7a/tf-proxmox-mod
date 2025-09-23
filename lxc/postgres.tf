resource "null_resource" "postgres_setup" {
  count      = var.setup_postgres ? 1 : 0
  depends_on = [proxmox_lxc.pve_lxc]

  provisioner "local-exec" {
    command = <<-EOT
      ssh ${var.proxmox_ssh} \
        "pct exec ${proxmox_lxc.pve_lxc.vmid} -- /bin/bash -c '\\
          apt-get update && \
          DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql && \
          systemctl enable postgresql && \
          systemctl start postgresql && \
          sudo -u postgres psql -c \"CREATE DATABASE ${var.db_name};\" && \
          sudo -u postgres psql -c \"CREATE USER ${var.db_user} WITH PASSWORD '${var.db_password}';\" && \
          sudo -u postgres psql -c \"GRANT ALL PRIVILEGES ON DATABASE ${var.db_name} TO ${var.db_user};\" \
        '"
    EOT
  }

  triggers = {
    container_id = proxmox_lxc.pve_lxc.vmid
  }
}
resource "null_resource" "postgres_setup" {
  count      = var.setup_postgres ? 1 : 0
  depends_on = [proxmox_lxc.pve_lxc]

  provisioner "local-exec" {
    command = <<-EOT
      ssh ${var.proxmox_ssh} \
        "pct exec ${proxmox_lxc.pve_lxc.vmid} -- /bin/bash -c '\\
          apt-get update && \
          DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql && \
          systemctl enable postgresql && \
          systemctl start postgresql && \
          sudo -u postgres psql -c \"CREATE DATABASE ${var.db_name};\" && \
          sudo -u postgres psql -c \"CREATE USER ${var.db_user} WITH PASSWORD '${var.db_password}';\" && \
          sudo -u postgres psql -c \"GRANT ALL PRIVILEGES ON DATABASE ${var.db_name} TO ${var.db_user};\" \
        '"
    EOT
  }

  triggers = {
    container_id = proxmox_lxc.pve_lxc.vmid
  }
}