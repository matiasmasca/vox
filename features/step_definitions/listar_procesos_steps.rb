# encoding: utf-8
Dado(/^que he creado (\d+) proceso de selección:$/) do |arg1, table|
  # table is a Cucumber::Ast::Table
  @selection_process = SelectionProcess.create!(table.hashes)
end

Entonces(/^veo una lista de los procesos con (\d+) de ellos\.$/) do |count|
   page.should have_selector("table#selection-processes-list>tbody:nth-child(2)>tr:eq(#{count})")
end

Entonces(/^veo una lista con exactamente la información de los (\d+) procesos\.$/) do |arg1, expected_table|
  # table is a Cucumber::Ast::Table
  rows = find("table#selection-processes-list").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end


Dado(/^que no he creado ningún proceso de selección$/) do
  @selection_process = nil
end

Entonces(/^veo una una tabla vacia, con el mensaje "(.*?)"$/) do |mensaje|
  step %{se lee el texto "#{mensaje}"}
end





#Then I should see a table with the following rows:
#  | Premio Roberto       | Av. Siempre Viva 742    | 30 |
#  | Miss Galaxia   | Planeta alfacentauris Av. Galaxy 2304 | 350 |
#  | El Mejor amigo | Escuela Manuel Belgrano, Corrientes | 15 |

#Then /^I should see a table with the following rows:$/ do |table_results|
#table_results = page.find('#games_results_table tr').map do |row|
#    row.children.map do |cell|
#        cell.text
#    end
#end
#end

#Según Coke.info, la manera de comparar una tabla de Garkin con capybara es:
# rows = find("table#selector").all('tr')
# table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
# expected_table.diff!(table)
