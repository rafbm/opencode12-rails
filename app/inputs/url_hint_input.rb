class UrlHintInput < SimpleForm::Inputs::Base
  def input
    @builder.url_field(attribute_name, input_html_options) +
      ' <small class="hint">e.g. www.yourcompany.com</small>'.html_safe
  end
end
