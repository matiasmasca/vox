module ControllerMacros
# @TO-Do: refatorizar estos dos metodos en 1 solo.

  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      @admin = User.create!('usuario' => 'Administrador' , 'email' => 'admin@email.com' , 'password' => 'MyString9' , 'tipo_usuario_id' => 1)
       # user.confirm! #Esto cuando usas el modulo de Confirm.
      sign_in(@admin) 
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = User.create!('usuario' => 'usuarioregistrado' , 'email' => 'usuario@email.com' , 'password' => 'MyString9' , 'tipo_usuario_id' => 3)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the 'confirmable' module
      sign_in @user
    end
  end
end