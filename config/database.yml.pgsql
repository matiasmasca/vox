login: &login
  adapter: postgresql
  host: localhost
  username: root
  password:


development:
  database: db_vox_production
  <<: *login

test:
  database: db_vox_production
  <<: *login

production:
  database: db_vox_production
  <<: *login
