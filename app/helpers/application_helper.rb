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
  
  
end


