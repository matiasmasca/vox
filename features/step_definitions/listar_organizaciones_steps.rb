# encoding: utf-8
Dado(/^que he creado (\d+) organización:$/) do |count, table|
  # table is a Cucumber::Ast::Table
    @Organizers = Organizer.create!(table.hashes)
end

Dado(/^que estoy en la pantalla de Administración de Organizaciones$/) do
  visit organizers_path
end

Entonces(/^veo una lista de las Organizaciones con (\d+) de ellas\.$/) do |count|
  page.should have_selector("table#selection-processes-list>tbody:nth-child(2)>tr:eq(#{count})")
end

Dado(/^que he creado (\d+) organizaciones:$/) do |count, table|
  # table is a Cucumber::Ast::Table
  step "que he creado #{count} organización:", table
end

Entonces(/^veo una lista con exactamente la información de las (\d+) Organizaciones\.$/) do |count, expected_table|
  # table is a Cucumber::Ast::Table
  rows = find("table#selection-processes-list").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Dado(/^que no he creado ningúna Organización$/) do
  @Organizers = nil  #SelectionProcesses
end
