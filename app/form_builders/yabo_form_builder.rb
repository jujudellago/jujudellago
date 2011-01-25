class YaboFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field collection_select password_field text_area date_select file_field].each do |method_name|
    define_method(method_name) do |field_name, *args|
      @template.content_tag(:div, field_label(field_name, *args)  + super+ field_error(field_name) )
    end
  end
  
  
  
  def check_box(field_name, *args)
    @template.content_tag(:div, super + " " + field_error(field_name) + field_label(field_name, *args))
  end
  

  
  def submit(*args)
    @template.content_tag(:div, super,:class=>'buttonrow')
  end
  
  def many_check_boxes(name, subobjects, id_method, name_method, options = {})
    @template.content_tag(:p) do
      field_name = "#{object_name}[#{name}][]"
      "<div>"+subobjects.map do |subobject|
        @template.check_box_tag(field_name, subobject.send(id_method), object.send(name).include?(subobject.send(id_method))) + " " + subobject.send(name_method)
      end.join("<br />") + @template.hidden_field_tag(field_name, "")+"</div>"
    end
  end
  
  def error_messages(*args)
    @template.render_error_messages(object, *args)
  end
  
  private
  
  def field_error(field_name)
    if object.errors.invalid? field_name
      @template.content_tag(:span, [object.errors.on(field_name)].flatten.first.sub(/^\^/, ''), :class => 'error_message')
    else
      ''
    end
  end
  
  def field_label(field_name, *args)
    options = args.extract_options!
    options.reverse_merge!(:required => field_required?(field_name))
    #options.reverse_merge!(:title=>options[:title].cleanup_html)
    options[:title]=options[:title].cleanup_html if options[:title]
    options[:label_class] = "required" if options[:required]
    label(field_name, options[:label], :class => options[:label_class])
  end
  
  def field_required?(field_name)
    object.class.reflect_on_validations_for(field_name).map(&:macro).include?(:validates_presence_of)
  end
  
  def objectify_options(options)
    super.except(:label, :required, :label_class)
  end
end
