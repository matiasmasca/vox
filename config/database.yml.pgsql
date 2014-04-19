login: &login
  adapter: postgresql
  encoding: unicode
  pool: 5
  database: dakorcvqte90bc
  username: clrnemxgshgjjg
  password: Zo3VdCa5TQF5Y-03YUElPAauOf
  host: ec2-54-197-238-242.compute-1.amazonaws.com
  port: 5432

production:
  database: dakorcvqte90bc
  <<: *login
