module AuthenticationHelper
 def current_user
  @current_user ||= create(user)
 end
end

World(AuthenticationHelper)

#Esto crear una variable global para poder acceder a los valores de current_user de Devise. 
