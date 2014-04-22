require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :usuario => "MyString",
      :nombre => "MyString",
      :apellido => "MyString",
      :email => "MyString",
      :clave => "MyString",
      :facebook => "MyString",
      :twitter => "MyString",
      :tipo_usuario_id => 3
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_usuario[name=?]", "user[usuario]"
      assert_select "input#user_nombre[name=?]", "user[nombre]"
      assert_select "input#user_apellido[name=?]", "user[apellido]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_clave[name=?]", "user[clave]"
      assert_select "input#user_facebook[name=?]", "user[facebook]"
      assert_select "input#user_twitter[name=?]", "user[twitter]"
      assert_select "select#user_tipo_usuario_id option[selected]", text: "Organizador"
    end
  end
end
