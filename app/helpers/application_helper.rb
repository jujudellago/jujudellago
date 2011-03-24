module ApplicationHelper
  # learned in rbates pragmatic screencast
  def yabo_form_for(*args, &block)
     options = args.extract_options!.merge(:builder => YaboFormBuilder)
     content_tag(:div,form_for(*(args + [options]), &block),:class=>'form-container')
  end
  
  # helpers/application_helper.rb
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def background_image(img) 
    src=img.blank? ? "/images/bg/dark_gradient.jpg" : img
    return content_tag(:span,image_tag(src,:id=>'bgimg')).html_safe    
  end
  
end


