require 'spec_helper'

describe "users/show" do
  login_admin
  
  before(:each) do
    @user = assign(:user, stub_model(User,
      :usuario => "Usuario",
      :nombre => "Nombre",
      :apellido => "Apellido",
      :email => "Email",
      :facebook => "Facebook",
      :twitter => "Twitter",
      :tipo_usuario_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Usuario/)
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
    rendered.should match(/Email/)
    rendered.should match(/Facebook/)
    rendered.should match(/Twitter/)
    rendered.should match(/1/)
  end
end
