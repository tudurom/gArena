class PagedownInput < SimpleForm::Inputs::TextInput
  def input
    out =  "<div class='wmd-panel'>"
    out << "  <div id='wmd-button-bar'></div>"
    out << "  #{@builder.text_area(attribute_name, input_html_options.merge({:class => "mde-input"}))}"
    out << "</div>"
    out << "<script>"
    out << "  var simplemde = new SimpleMDE({element: $('.mde-input')[0]});"
    out << "  simplemde.render();"
    out << "</script>"

    out.html_safe
  end
end
