job "tetris" {
  datacenters = ["dc1"]
  type        = "service"

  group "games" {
    count = ${instance_count}

    constraint {
      # Nomad runtime attribute (escaped)
      attribute = "$${meta.environment}"
      # Terraform injected value
      value     = "${environment}"
    }

    network {
      port "web" {
        to = 80
      }
    }

    task "tetris" {
      driver = "docker"

      config {
        image = "bsord/tetris"
        ports = ["web"]
      }

      resources {
        cpu    = ${cpu_limit}
        memory = ${mem_limit}
      }
    }
  }
}
