# encoding: utf-8
Dado(/^que he creado (\d+) cateogria:$/) do |count, table|
  # table is a Cucumber::Ast::Table
  @categories = Category.create!(table.hashes)
end

Entonces(/^veo una lista de las categorias con (\d+) de ellos\.$/) do |count|
  page.should have_selector("table#categories-list > tbody:nth-child(2) > tr:eq(#{count})")
end

Entonces(/^veo una lista con exactamente la información de los (\d+) categorias\.$/) do |count, expected_table|
  # table is a Cucumber::Ast::Table
  rows = find("table#categories-list").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Dado(/^que no he creado ningúna cateogria$/) do
  @categories = nil
end
