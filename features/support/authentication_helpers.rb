module AuthenticationHelper
 def current_user
  @current_user ||= create(user)
 end
end

World(AuthenticationHelper)