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