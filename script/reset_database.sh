#!/bin/bash

set -ex

case "${RAILS_ENV}" in
test)
  rvx bundle exec rake db:reset_and_migrate
  ;;
development)
  which rv
  rvx bundle exec rake db:otwseed
  rvx bundle exec rake skins:load_site_skins
  rvx bundle exec rake search:index_tags
  rvx bundle exec rake search:index_works
  rvx bundle exec rake search:index_pseuds
  rvx bundle exec rake search:index_bookmarks
  rvx bundle exec rake search:index_admin_users
  rvx bundle exec rake search:index_collections
  ;;
*)
  echo "Only supported in test and development (e.g. 'RAILS_ENV=test ./script/reset_database.sh')"
  exit 1
  ;;
esac
