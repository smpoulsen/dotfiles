function docker_rm_container_by_name --argument query
 docker ps -a --format "{{.ID}} {{.Image}} {{.Names}}" | grep "$query" | awk '{print $1 }' | xargs -I {} docker rm -f {}
end
