require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Vox
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
  end
end

#Agragando Bootstrap a los mensajes de los formularios
=begin
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe
  # add nokogiri gem to Gemfile
  form_fields = [
    'textarea',
    'input',
    'select'
      ]

      elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')
      elements.each do |e|
        if e.node_name.eql? 'label'
          html = %(<div class="control-group error">#{e}</div>).html_safe
        elsif form_fields.include? e.node_name
          if instance.error_message.kind_of?(Array)
            html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message.join(',')}</span></div>).html_safe
          else
            html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message}</span></div>).html_safe
          end
        end
      end
      html
    end
=end
#--

#Agragar Bootstrap a las validaciones

ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| 
  "<div class=\"has-error form-group\">#{html_tag}</div>".html_safe
}
