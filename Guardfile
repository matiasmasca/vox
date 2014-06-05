# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard :rspec, run_all: { message: 'Corriendo todos los ejemplos/specs' }, cmd: 'rspec --color --format documentation --fail-fast' do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
end

guard :rspec, run_all: { message: 'Corriendo RSpec optimiazado' }, cmd: 'rspec --drb --format documentation --color' do
  # run every updated spec file
  watch(%r{^spec/.+_spec\.rb$})
  # run the lib specs when a file in lib/ changes
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  # run the model specs related to the changed model
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  # run the view specs related to the changed view
  watch(%r{^app/(.*)(\.erb|\.haml)$}) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # run the integration specs related to the changed controller
  watch(%r{^app/controllers/(.+)\.rb}) { |m| "spec/requests/#{m[1]}_spec.rb" }
  # run all integration tests when application controller change
  watch('app/controllers/application_controller.rb') { "spec/requests" }
end

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$}){ 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

#guard :cucumber do
  #Para vigilar continuamente... 
  # parece que crea un loop y ya no se ejecutan los pasos que le siguan...
#  watch(%r{^features/.+\.feature$}) do |m|
#    "features/#{m[1]}.feature"
#  end
  
#  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
 #   "features/step_definitions/#{m[1]}_steps\.rb" #que ejecute toda la feature
#  end
#end

#guard 'rails' do
#  watch('Gemfile.lock')
#  watch(%r{^(config|lib)/.*})
#end

