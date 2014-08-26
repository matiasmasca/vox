require 'spec_helper'

describe "users/new" do
  login_admin
  
  before(:each) do
    assign(:user, stub_model(User,
      :usuario => "MyString",
      :nombre => "MyString",
      :apellido => "MyString",
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :facebook => "MyString",
      :twitter => "MyString",
      :tipo_usuario_id => 3
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_usuario[name=?]", "user[usuario]"
      assert_select "input#user_nombre[name=?]", "user[nombre]"
      assert_select "input#user_apellido[name=?]", "user[apellido]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
      assert_select "input#user_facebook[name=?]", "user[facebook]"
      assert_select "input#user_twitter[name=?]", "user[twitter]"
      assert_select "select#user_tipo_usuario_id option[selected]", text: "Organizador"
    end
  end
end
