require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

class DummyModel < ActiveRecord::Base
end

describe ApplicationHelper do
  it "bootstrap_class_for, flash_type"
  it "flash_messages, opts"

  it "tabla_sin_registros devuelve mensaje" do
    pending "probe algunas cosas pero no me salieron"
  end

  #Acta tenes que probar lo de boostrap.
  #Aca tenes que probar tu metodo tabla_sin_registros
  	#pasale un modelo nulo
  	#pasale un modelo vacio
  	#pasale un modelo con n registros
end