class <%= class_name %> < ActiveRecord::Base


<% 
searchwhat="name"
for attribute in attributes 
  if (attribute.to_s.index("title") ||  attribute.to_s.index("name"))
    searchwhat=attribute.to_s
  end
end
%>


  def self.search(search)
    if search
      where('<%= searchwhat %> LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  
end