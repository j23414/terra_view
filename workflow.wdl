version 1.0

task test_docker_path {
  input {
    String abs_path = "/nextstrain"
    String? my_command
    String docker_img = "nextstrain/base:latest"
  }
  command <<<
    set -v

    echo "abs_path = ~{abs_path}"
    echo "docker_img = ~{docker_img}"

    pwd
    ls -ltr "~{abs_path}" # should succeed if path exists

    echo "my_command = ~{my_command} "

    ~{my_command}
  >>>
  output {
    String stdout_str = read_string(stdout())
  }

  runtime {
    docker: docker_img
    cpu: 16
    memory: "50 GiB"
    disks: "local-disk 100 HDD"
  }
}

workflow Main {

  input {
    String abs_path
    String? my_command
    String docker_img
  }

  call test_docker_path { input: abs_path = abs_path, docker_img = docker_img, my_command = my_command}

  output {
    String stdout_str = test_docker_path.stdout_str
  }
}