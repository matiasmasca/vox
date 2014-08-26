require 'spec_helper'

describe "users/index" do
  login_admin
  
  before(:each) do
    assign(:users, [
      stub_model(User,
        :usuario => "Usuario",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :email => "Email",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :tipo_usuario_id => 1
      ),
      stub_model(User,
        :usuario => "Usuario",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :email => "Email",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :tipo_usuario_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Usuario".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
