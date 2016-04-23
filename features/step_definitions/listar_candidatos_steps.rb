# encoding: utf-8
Dado(/^que he creado (\d+) candidato:$/) do |count, table|
  # table is a Cucumber::Ast::Table
  @candidates = Candidate.create!(table.hashes)
end

Entonces(/^veo una lista de las candidatos con (\d+) de ellos\.$/) do |count|
  page.should have_selector("table#candidates-list > tbody:nth-child(2) > tr:eq(#{count})")
end

Entonces(/^veo una lista con exactamente la información de los (\d+) candidatos\.$/) do |count, expected_table|
  # table is a Cucumber::Ast::Table
  rows = find("table#candidates-list").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Dado(/^que no he creado ningúna candidato$/) do
  @candidates = nil
end