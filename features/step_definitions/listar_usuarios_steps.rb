# encoding: utf-8
Dado(/^que he creado (\d+) usuario:$/) do |count, table|
  # table is a Cucumber::Ast::Table
  @Users = User.create!(table.hashes)
end

Entonces(/^veo una lista de los usuarios con (\d+) de ellos\.$/) do |count|
  page.should have_selector("table#users-list>tbody:nth-child(2)>tr:eq(#{count})")
end

Entonces(/^veo una lista con exactamente la información de los (\d+) usuarios\.$/) do |count, expected_table|
  # table is a Cucumber::Ast::Table
  rows = find("table#users-list").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Dado(/^que no he creado ningún usuario$/) do
  @Users = nil
end

Dado(/^que he creado (\d+) usuarios:$/) do |count, table|
  # table is a Cucumber::Ast::Table
  step "que he creado #{count} usuarios:", table
end