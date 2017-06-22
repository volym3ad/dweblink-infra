variable "connections" {
  type = "list"
}

resource "null_resource" "install" {
  count = "${length(var.connections)}"

  connection {
    host = "${element(var.connections, count.index)}"
    user = "root"
    agent = true
  }

  provisioner "file" {
    source = "${path.module}/templates/docker.default"
    destination = "/etc/default/docker"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -",
      "echo 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial edge' > /etc/apt/sources.list.d/docker.list",
      "apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq docker-ce libltdl7",
      "systemctl daemon-reload",
      "systemctl is-enabled docker.service || systemctl enable docker.service",
      "systemctl start docker.service",
    ]
  }
}

output "dependency" {
  value = "${null_resource.install.id}"
}