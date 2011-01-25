module SilkyButtonsHelper

  def silk_image( img, options={} )
      image_tag( "/images/icons/fugue/#{img}", options).html_safe
  end

  def submit_resource_button(text, options={})
    options[:text]      = text
    options[:type]      = "submit"
    options[:icon]      ||= "tick.png"
    unless options[:icon].blank?
      options[:icon] =  silk_image(options[:icon]).html_safe
      options[:text] = "#{options[:icon]} #{options[:text]}".html_safe
    end
    options.merge!({ :class => "button #{options[:class]}" })
    content_tag(:button, options[:text], options.delete_if { |k, v| [:icon, :text].include? k }).html_safe
  end
  alias_method :submit_button, :submit_resource_button

  def show_resource_button(resource, options={})
    options[:icon]  ||= "eye.png"
    options[:text]  ||= "Show #{resource.class.to_s.humanize}"
    options[:path]  ||= polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :show_button, :show_resource_button

  def new_resource_button(resource, options={})
    options[:class]   = "positive #{options[:class]}"
    options[:icon]  ||= "add.png"
    options[:text]  ||= "New #{resource.class.to_s.humanize}"
    options[:path]  ||= new_polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :new_button, :new_resource_button


  def cancel_resource_button(resource, options={})
    options[:class]   = "negative #{options[:class]}"
    options[:icon]  ||= "cancel.png"
    options[:text]  ||= t("cancel")
    options[:path]  ||= request.referer
    resource_button(resource, options)
  end
  alias_method :cancel_button, :cancel_resource_button



  def login_resource_button(resource, options={})
    options[:class]   = "positive #{options[:class]}"
    options[:icon]  ||= "key.png"
    options[:text]  ||= t("Login")
    options[:path]  ||= login_path
    resource_button(resource, options)
  end
  alias_method :login_button, :login_resource_button

  def custom_positive_button(resource,options={})
    options[:class]   = "positive #{options[:class]}"
    options[:icon]  ||= "link.png"
    options[:text]  ||= t("NOT DEFINED")
    options[:path]  ||= "#"
    resource_button(resource, options)
  end
  alias_method :custom_button, :custom_positive_button

  



  def edit_resource_button(resource, options={})
    options[:icon]  ||= "pencil.png"
    options[:text]  ||= "Edit #{resource.class.to_s.humanize}"
    options[:path]  ||= edit_polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :edit_button, :edit_resource_button





  def destroy_resource_button(resource, options={})
    options[:class]   = "negative #{options[:class]}"
    options[:method]  ||= :delete
    options[:confirm] ||= "Are you sure?"
    options[:icon]    ||= "delete.png"
    options[:text]    ||= "Delete #{resource.class.to_s.humanize}"
    options[:path]    ||= polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :destroy_button, :destroy_resource_button
  




  def resource_button(resource, options={})
    options[:text]        ||= resource.class.to_s.humanize
    options[:path]        ||= polymorphic_path(resource)
    unless options[:icon].blank?
      options[:icon] = silk_image(options[:icon]).html_safe
      options[:text] = "#{options[:icon]} #{options[:text]}".html_safe
    end
    options.merge!({ :class => "button #{options[:class]}" })
    link_to(options[:text], options[:path], options.delete_if { |k, v| [:icon, :text, :path].include? k }).html_safe
  end
  
  
  def fancy_silk_link_to(text,url,options={})
     unless options[:icon].blank?
        options[:icon] = silk_image(options[:icon]).html_safe
        text = "#{options[:icon]} #{text}"
      end
      options.merge!({ :class => "button #{options[:class]}" })
      link_to text, url, options.delete_if { |k, v| [:icon, :text, :path].include? k }
  end
  alias_method :fancy_link_to, :fancy_silk_link_to
  
  
  
  def function_button(text,function ,options={})
    unless options[:icon].blank?
      options[:icon] = silk_image(options[:icon]).html_safe
      text = "#{options[:icon]} #{text}"
    end
    options.merge!({ :class => "button #{options[:class]}" })
    link_to_function text, function, options.delete_if { |k, v| [:icon, :text, :path].include? k }
  end
end
