[![PostgreSQL Version](https://img.shields.io/badge/posgresql-12.3-blue.svg?longCache=true&style=flat-square)](https://www.postgresql.org/download/)
[![Ruby Version](https://img.shields.io/badge/ruby-2.7.1-blue.svg?longCache=true&style=flat-square)](https://www.ruby-lang.org/en/downloads/)
[![Rails Version](https://img.shields.io/badge/rails-6.0.3-blue.svg?longCache=true&style=flat-square)](https://weblog.rubyonrails.org/2020/5/6/Rails-6-0-3-has-been-released/)

# Will.World

A solution that will track and manage fund-raising campaigns in museums and other similar arts and culture locations

[![JIRA Board](https://img.shields.io/badge/Jira%20Board-link-green.svg?longCache=true&style=for-the-badge)](https://jira.sumatosoft.com/jira/secure/RapidBoard.jspa?projectKey=WIL&rapidView=235)
[![Confluence Space](https://img.shields.io/badge/Confluence%20space-link-green.svg?longCache=true&style=for-the-badge)](https://jira.sumatosoft.com/confluence/display/WIL/Will.World)

[GitFlow](https://jira.sumatosoft.com/confluence/display/DKB/GitFlow+Guide)

[Javascript language style guide](https://github.com/airbnb/javascript)

[Ruby style guide](https://github.com/rubocop-hq/ruby-style-guide)

[Rails style guide](https://github.com/rubocop-hq/rails-style-guide)


## How to run locally

### `git clone git@gitlab-ssh.sumatosoft.com:will-world/will-world-backend.git && cd will-world-backend`

Clones project from git and changes working directory to will-world-backend.

### `bundle install`

Install the project gems dependencies.

### `yarn install`

Install the project node dependencies.

### `cp config/database.example.yml config/database.yml`

Copy database.example.yml into database.yml and set your config

### Copy [master.key](https://jira.sumatosoft.com/confluence/download/attachments/427691179/master.key) into config folder

### `rails db:prepare`

Create you db, load schema and load seed.

### `lefthook install`

Install git-hooks to run rubocop before commit.

### `rails s`

Runs the app in the development mode.
Open http://localhost:3000 to view it in the browser.

### http://localhost:3000/api-docs

Open to see swagger documentation

## How to deploy

Deploy is running on GitLab.

Merge develop branch into qa and GitLab will deploy it to the qa server

Merge qa branch into staging and GitLab will deploy it to the demo server

## Contacts:

* Project Manager: e.zherko@sumatosoft.com
* Tech Lead: a.demidenko@sumatosoft.com
* Business Analyst: o.shpakovich@sumatosoft.com
