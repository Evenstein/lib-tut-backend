# frozen_string_literal: true

server 'will-world.demo.sumatosoft.work', roles: %w[app db web], user: 'app'
set :branch, 'staging'
set :deploy_to, '/var/www/apps/will_world_backend_staging'
