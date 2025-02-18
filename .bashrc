# Docker Aliases
alias dc="docker compose"
alias dce="docker compose exec"
alias docker-clean="if [ -n \"\$(docker ps -q)\" ]; then docker stop \$(docker ps -q); fi && docker system prune -a"
alias docker-suicide="if [ -n \"\$(docker ps -q)\" ]; then docker stop \$(docker ps -q); fi && docker system prune -a --volumes && docker volume rm \$(docker volume ls -q)"
alias dnet="function _dnet() { docker network inspect \$1 --format=\"{{range .Containers}}{{.Name}} {{end}}\"; }; _dnet"
function dex_old { docker exec -it $1 ${2:-bash}; }
function dex { if [ "$#" -lt 1 ]; then echo "Usage: dex <container_name> [<command>]"; return 1; fi; if [ "$#" -eq 1 ]; then docker exec -it "$1" bash; elif [ "$#" -ge 2 ]; then docker exec "$@"; fi; }
alias dps='docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}" | (read -r; printf "%s\\n" "$REPLY"; sort -k 2 )'
