# encoding: utf-8
Cuando(/^hago click en Mostrar para "(.*?)"$/) do |process_name|
  first("#selection-processes-list", :text => "Mostrar")
end
#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(8) > a:nth-child(1)

Entonces(/^veo toda la información del premio\.$/) do
  visit selection_processes_path(@selection_process)
end



