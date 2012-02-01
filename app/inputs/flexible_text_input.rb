class FlexibleTextInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge(:class => "flexible-text-area")
  end
end
