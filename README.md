# terra_view

Peek into Terra - [Launch from Dockstore](https://dockstore.org/workflows/github.com/j23414/terra_view:main?tab=info)


| Input | Example | Description|
|:--|:--|:--|
| String abs_path | "/nextstrain" | Check if a file exists in a docker image |
| String docker_img | "nextstrain/base:latest" | Docker image to check |
| String? my_command | "ls *" | [Optional] Check if a command can be called in docker image |
