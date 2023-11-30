# Defined in - @ line 1
function dc-all --description 'alias dc-all=docker compose down && docker compose build && docker compose create && docker compose start'
  docker compose down && docker compose build && docker compose create && docker compose start;
end
