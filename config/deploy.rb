# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.14.0'

set :application, 'lib_tut'
# set :repo_url, 'git@gitlab-ssh.sumatosoft.com:will-world/will-world-backend.git'

set :linked_dirs, %w[tmp/pids tmp/cache tmp/sockets log storage]
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key')
