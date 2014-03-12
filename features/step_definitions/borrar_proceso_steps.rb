# encoding: utf-8
Cuando(/^hago click en Borrar para "(.*?)"$/) do |process_name|
   click_on("Borrar")
   
   #el problema estaba en el orden de los step.
   # esto borra pero no prueba el comportamiento.
   #delete url_for :controller => 'selection_process', :action => 'destroy', :id => @selection_process.id 
end

Entonces(/^se borra el premio$/) do
  find("#selection-processes-list").should have_no_content("Premios ACME")
end

# Chequear que muestra el pop up de confirmación
 #Con Selinium
 #Ventana abierta: page.driver.browser.window_handles.length.should == 1

#   text = "Esta seguro que desea borrar este proceso"
#  within_window(page.driver.browser.window_handles.last) do
#    if defined?(RSpec::Matchers)
#      page.should have_content(text)
#    else
#      assert page.has_content?(text)
#    end
#  end