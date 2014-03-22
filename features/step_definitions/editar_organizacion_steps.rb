# encoding: utf-8
Dado(/^existe una organización llamada "(.*?)" con domicilio en "(.*?)"$/) do |name, address|
  @organizer = Organizer.new({:name => name, :address => address}) 
end

Cuando(/^yo edito una Organización$/) do
   visit edit_organizer_path
end

Cuando(/^cambio el nombre por "(.*?)", la diereción por "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Dado(/^existe una Organización llamada "(.*?)" con domicilio en "(.*?)", sin web definida$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Cuando(/^yo edito la Organización$/) do
  pending # express the regexp above with the code you wish you had
end

Cuando(/^cambio web por "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Entonces(/^veo que la web cambio, sin afectar a nombre o dirección\.$/) do
  pending # express the regexp above with the code you wish you had
end

