# encoding: utf-8
Dado(/^que estoy en la pantalla de mis procesos electorales$/) do
  visit("/selection_process")
end

Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)"$/) do |name_process, place|
  @selection_process = SelectionProcesses.create!({ :name_process => name_process, :place => place })
end