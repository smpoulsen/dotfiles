function docker_rm_image_name --argument query
    docker ps -a --format "{{.ID}} {{.Image}} {{.Names}}" | grep "$query" | awk '{print $1 }' | xargs -I {} docker rm -f {}
end
