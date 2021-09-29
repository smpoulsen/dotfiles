function docker_rmi --argument query
    docker image ls --format "{{.ID}} {{.Repository}} {{.Tag}}" | grep "$query" | awk '{print $1 }' | xargs -I {} docker rmi {}
end
