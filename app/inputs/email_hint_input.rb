class EmailHintInput < SimpleForm::Inputs::Base
  def input
    @builder.email_field(attribute_name, input_html_options) +
      ' <small class="hint">e.g. yourname@company.com</small>'.html_safe
  end
end
