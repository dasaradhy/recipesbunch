class TextListInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    input_html_options[:type]||= :text
    array=Array(object.public_send(attribute_name))
    array=[""] if array.empty?
    array.map.with_index(1) { |array_el,index|
      inputfield(array_el,index)
    }.join.html_safe
  end

  def inputfield(val,index)
    '<div class="input-group list-input-group">'+
    @builder.text_field(nil, input_html_options.merge(value: val, name: "#{object_name}[#{attribute_name}][]", id: "#{attribute_name}_#{index}",class: "text_list form-control required"))+
    '<span class="input-group-addon remove-ingredient"><i class="fa fa-remove"></i></span></div>'
  end

end