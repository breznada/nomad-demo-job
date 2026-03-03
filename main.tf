terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "~> 2.0"
    }
  }
}

provider "nomad" {
  address = var.nomad_addr
}

resource "nomad_job" "tetris" {
  # Pass the variables from TF into the Nomad template
  jobspec = templatefile("${path.module}/tetris.nomad.tpl", {
    instance_count = var.tetris_count
    environment    = var.env_label
    cpu_limit      = var.res_cpu
    mem_limit      = var.res_mem
  })

  # Optional: Ensure the job is removed if the resource is deleted
  purge_on_destroy = true
}
