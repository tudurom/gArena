class PagedownInput < SimpleForm::Inputs::TextInput
  def input
    out =  "<div class='wmd-panel'>"
    out << "  <div id='wmd-button-bar'></div>"
    out << "  #{@builder.text_area(attribute_name, input_html_options.merge({:class => "wmd-input"}))}"
    out << "</div>"
    out << "<script>"
    out << "  var converter = Markdown.getSanitizingConverter();"
    out << "  var editor = new Markdown.Editor(converter);"
    out << "  editor.run();"
    out << "</script>"

    out.html_safe
  end
end
