# encoding: utf-8
# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections(:en) do |inflect|
   inflect.plural 'user_types', 'user_type'
   inflect.singular 'user_type', 'user_types'
   inflect.plural 'process_types', 'process_type'
   inflect.singular 'process_type', 'process_types'
   inflect.plural 'juries', 'jury'
   inflect.singular 'jury', 'juries'
   inflect.plural 'selection_processes', 'selection_process'
   inflect.singular 'selection_process', 'selection_processes'
   inflect.plural 'organizers', 'organizer'
   inflect.singular 'organizer', 'organizers'
   inflect.plural 'categories', 'category'
   inflect.singular 'category', 'categories'
   inflect.plural 'nominees', 'nominee'
   inflect.singular 'nominee', 'nominees'
   inflect.plural 'seats', 'seat'
   inflect.singular 'seat', 'seats'
   
   inflect.irregular 'error', 'errores'
 end