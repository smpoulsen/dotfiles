function docker_rm_image_by_name --argument query
 docker image -a --format "{{.ID}} {{.Repository}} {{.Tags}}" | grep "$query" | awk '{print $1 }' | xargs -I {} docker rmi {}
end
