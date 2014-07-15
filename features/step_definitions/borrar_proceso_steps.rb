# encoding: utf-8
Cuando(/^hago click en Borrar para "(.*?)"$/) do |process_name|
   #Hace click en el único borrar que figura en la pagina.
   click_on("Borrar")
   
   #deberia buscar el borrar de la fila de process_name
   #find_button(button).click

   # esto borra pero no prueba el comportamiento.
   #delete url_for :controller => 'selection_process', :action => 'destroy', :id => @selection_process.id 
end

Entonces(/^se borra el premio "(.*?)"$/) do |process_name|
  find("#selection-processes-list").should have_no_content(process_name)
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