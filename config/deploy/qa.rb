# frozen_string_literal: true

server 'will-world.qa.sumatosoft.work', roles: %w[app db web], user: 'app'
set :branch, 'qa'
set :deploy_to, '/var/www/apps/will_world_backend_qa'
