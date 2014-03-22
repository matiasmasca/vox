# encoding: utf-8
Entonces(/^se borra la Organización "(.*?)"$/) do |item_borrado|
  find("#organizer-list").should have_no_content(item_borrado)
end
