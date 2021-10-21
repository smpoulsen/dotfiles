# Defined interactively
function docker_rm_by_name --argument name
docker ps -a --format "{{.ID}} {{.Image}} {{.Names}}" | grep "$name" | awk '{print $1}' | xargs -I {} docker rm {}
end
