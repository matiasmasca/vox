module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)
    html = <<-HTML
    <div class='alert alert-danger alert-dismissible' role='alert'>
      <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>
      <strong>#{sentence}</strong>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end