module YaboHelper
  def ajax_spinner_for(id, spinner="spinner.gif")
    "<img src='/images/#{spinner}' style='display:none; vertical-align:middle;' id='#{id.to_s}_spinner' alt='#{id.to_s}_spinner' /> ".html_safe
  end
  def current_class?(test_path)
    ret=""
    if test_path.is_a?(String)
      ret= 'current' if  params[:controller].index(test_path)
    elsif test_path.is_a?(Array)
      test_path.each do |tp|
        ret= 'current' if params[:controller].index(tp)
      end
    else
      ret=""
    end
    return ret
  end
  
  def page_title(title)
    @page_title=title
    
  end

  def js_open
    '<script type="text/javascript">//<![CDATA[' + "\n"
  end

  def js_close
    "\n" + '//]]>' + "</script>"
  end
  def back_link
    content_tag("span","#{link_to I18n.t(:go_back), :back}",:class=>'back_link')
  end

  def pluralize_no_number(count, singular, plural = nil)
    ((count == 1 || count == '1') ? singular : (plural || singular.pluralize))
  end 

  def toggle_value(object,admin=false) 
    path=admin  ? url_for([:admin,object]) : url_for(object)
    
    remote_function(:url => path, 
     :method => :put, 
     :before => "$('##{object.id}_spinner').show()", 
     :complete => "$('##{object.id}_spinner').hide()", 
   # :before => "$('#{object.dom_id}').startWaiting();", 
   #  :complete => "$('#{object.dom_id}').stopWaiting();", 
     :with => "this.name + '=' + this.checked") 
   end


   def js_growl_message
       messages = ""
        [:notice, :info, :warning, :error].each do|type|
          if flash[type]
            messages= "$.jGrowl(\"<div id='#{type}' class='growl_#{type}'><span>#{escape_javascript(flash[type])}</div>\");".html_safe
          #messages= "<div id=\"#{type}\" class=\"#{type}\" ><span>#{flash[type]}</span></div>"
            flash.discard
          end
        end
        messages
    end
    def in_page_growl_message
       messages = ""
        [:notice, :info, :warning, :error].each do|type|
          if flash[type]
            messages= "$.jGrowl(\"<div id='#{type}' class='growl_#{type}'><span>#{escape_javascript(flash[type])}</div>\");".html_safe
          #messages= "<div id=\"#{type}\" class=\"#{type}\" ><span>#{flash[type]}</span></div>" , { life: 1000000 }
            flash.discard
          end
        end
       javascript_tag messages unless messages.blank?
    end
    
    def stylised_error_message
      message=""
        [:notice, :info, :warning, :error].each do|type|
          if flash[type]
            	message<<%(
          		<div class="clear"></div>
            	<ul class="message #{type} grid_12">
        				<li>#{flash[type]}</li>
        				<li class="close-bt"></li>
        			</ul>
        			)
          end
        end
        message.html_safe
    end
    
    
    def mytextilize(text,full_html=false)
      return if text.nil?
      #RedCloth.new(text.gsub(/</, '&lt;').gsub(/>/, '&gt;')).to_html

      if full_html
        RedCloth.new(text).to_html    
      else
        sanitize_fu(RedCloth.new(text).to_html)  
      end
     # RedCloth.new(text).to_html
    end

    def truncate_words(text, length = 30, end_string = ' …')
      words = text.split()
      words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    end


    def shorten(string, count = 30)
      if string.length >= count 
        shortened = string[0, count]
        splitted = shortened.split(/\s/)
        words = splitted.length
        splitted[0, words-1].join(" ") + ' ...'
      else 
        string
      end
    end
    
    
    
    def control_bar(text)
      return "" if text.blank?
      render :partial => '/shared/control_bar', :locals=>{:text=>text}      
    end
    def sidebar_or_full_layout(text) 
      if text.blank?
        return "<section class=\"grid_12\">"
      else
        <<-EOS
  		<section class="grid_4 with-margin">
  			<div class="block-border">
  				 #{text}				
  			</div>				
  		</section>
  		<section class="grid_8">
  		EOS
		  end
	  end
    
    


  # Adapted from http://ideoplex.com/id/1138/sanitize-html-in-ruby
  def sanitize_fu(html, okTags = 'a href, b, br, p, i, em, img,strong,blockquote,ul,ol,li')
    return if html.nil?
    # no closing tag necessary for these
    soloTags = ["br","hr"]

    # Build hash of allowed tags with allowed attributes
    tags = okTags.downcase().split(',').collect!{ |s| s.split(' ') }
    allowed = Hash.new
    tags.each do |s|
      key = s.shift
      allowed[key] = s
    end
    # Analyze all <> elements
    stack = Array.new
    result = html.gsub( /(<.*?>)/m ) do | element |
      if element =~ /\A<\/(\w+)/ then
        # </tag>
        tag = $1.downcase
        if allowed.include?(tag) && stack.include?(tag) then
          # If allowed and on the stack
          # Then pop down the stack
          top = stack.pop
          out = "</#{top}>"
          until top == tag do
            top = stack.pop
            out << "</#{top}>"
          end
          out
        end
      elsif element =~ /\A<(\w+)\s*\/>/
        # <tag />
        tag = $1.downcase
        if allowed.include?(tag) then
          "<#{tag} />"
        end
      elsif element =~ /\A<(\w+)/ then
        # <tag ...>
        tag = $1.downcase
        if allowed.include?(tag) then
          if ! soloTags.include?(tag) then
            stack.push(tag)
          end
          if allowed[tag].length == 0 then
            # no allowed attributes
            "<#{tag}>"
          else
            # allowed attributes?
            out = "<#{tag}"
            while ( $' =~ /(\w+)=("[^"]+")/ )
              attr = $1.downcase
              valu = $2
              if allowed[tag].include?(attr) then
                out << " #{attr}=#{valu}"
              end
            end
            out << ">"
          end
        end
      end
    end

    # eat up unmatched leading >
    while result.sub!(/\A([^<]*)>/m) { $1 } do end

      # eat up unmatched trailing <
      while result.sub!(/<([^>]*)\Z/m) { $1 } do end

        # clean up the stack
        if stack.length > 0 then
          result << "</#{stack.reverse.join('></')}>"
        end

        result
    end
    def safe_mail_to(mail)
    #  mail.sub(/@/,)      
      return "<a class=\"obfuscate email\">"+mail.gsub(/@/, '<span class="replaceAt">-AT-</span>')+"</a>"  #.gsub(/\./,'[dot]') 
    end
    

    
    
 


    def super_user_link(user)
       user.nil?  ? "no-user" : link_to(user.login,overview_admin_user_url(user),:class=>'fancy_box' )
    end
    
    def super_project_link(project)
         project.nil?  ? "no-project" : link_to(project.name,overview_admin_project_url(project),:class=>'fancy_box_large' )
    end
    
    
    def super_organisation_link(organisation)
          organisation.nil?  ? "no-organisation" : link_to(organisation.name,overview_admin_organisation_url(organisation),:class=>'fancy_box_large' )
      end
    
    def super_article_link(article)
      article.nil?  ? "no-article" : link_to(article.title_fr,overview_casein_category_article_url(article.category,article),:class=>'fancy_box_large' )
      
    end
    
      def super_page_link(txt,page)
            page.nil?  ? "no-page" : link_to(txt,overview_admin_page_url(page.id),:class=>'fancy_box_large' )
        end
    
    

    def list_destroy_button(link, remote=false,label="item",text="",tip=nil)
     css=tip.nil? ? "" : "tipsy_link"
     title=tip.nil? ? label : tip
     title=title.cleanup_html
     
      confirmtxt=I18n.t(:are_you_sure_you_wish_to_delete_cannot_be_undone,:item=>label,:default=>"Etes vous sur de vouloir effacer {{item}}\nCette action ne peut pas être annulée").cleanup_html
      if remote
        linktxt="#{image_tag(get_cms_icon('delete'), :alt=>"Destroy",:class=>css,:title=>title)} #{text}".html_safe
        link_to(linktxt,  link, :remote=>true,  :confirm => confirmtxt , :method => :delete)
      else
        link_to(image_tag(get_cms_icon('delete'), :alt=>"Destroy",:class=>css,:title=>title)+text, link, :confirm =>confirmtxt, :method => :delete)
      end
    end
    
    
     def list_edit_button(link,label="",tip=nil)
        generic_list_button(link,"pencil",label,tip)
      end
      def list_show_button(link,label="",tip=nil)
        generic_list_button(link,"eye",label,tip)
      end
      def list_validate_button(link,label="",tip=nil)
        generic_list_button(link,"accept",label,tip)
      end
      def list_devalidate_button(link,label="",tip=nil)
        generic_list_button(link,"cancel",label,tip)
      end
      def list_info_button(link,label="",tip=nil)
        generic_list_button(link,"information",label,tip)
      end
      def list_attach_button(link,label="",tip=nil)
        generic_list_button(link,"attach",label,tip)
          #link_to(image_tag(get_cms_icon('attach'), :alt=>'show')+label,  link)
      end
      def list_cog_button(link,label="",tip=nil)
        generic_list_button(link,"cog",label,tip)
          #link_to(image_tag(get_cms_icon('attach'), :alt=>'show')+label,  link)
      end
      def generic_list_button(link,icon,label="",tip=nil)
        css=tip.nil? ? "" : "tipsy_link"
        return link_to(image_tag(get_cms_icon(icon).html_safe, :alt=>"",:title=>tip,:class=>css).html_safe+label.cleanup_html.html_safe,  link).html_safe
      end
      
    def add_button(link,label="")
      link_to_remote(image_tag(get_cms_icon('add'), :alt=>'add')+label, :url =>  link,:method=>:put)
    end
    def remove_button(link,label="")
      link_to_remote(image_tag(get_cms_icon('delete'), :alt=>'add')+label, :url =>  link,:method=>:put)
    end
    def get_cms_icon(icon)
      image_tag("/images/icons/fugue/#{icon}.png").html_safe      
    end


    def make_table_headers(collection,headers,options = {})
 
      options.reverse_merge!({
        :placeholder  => 'Nothing to display',
        :caption      => nil,
        :table_class => nil,
        :summary      => nil,
        :footer       => ''
      })
      
      return if headers.size<1
       output=""
       summary = options[:summary] || "A list of #{collection.first.class.to_s.pluralize}".html_safe
       tblclass=" class=\""+options[:table_class]+"\"".html_safe if options[:table_class]
       tblid=" id=\""+options[:table_id]+"\"".html_safe if options[:table_id]
       output = "<div class=\"dynamic_container\"><table summary=\"#{summary}\" #{tblclass} #{tblid} width=\"100%\">\n".html_safe
       output << content_tag('caption', options[:caption]).html_safe if options[:caption]
      # output << content_tag('thead', content_tag('tr', headers.collect { |h| "\n\t" + content_tag('th', h.html_safe).html_safe }).html_safe).html_safe
       output << "\n<thead>".html_safe
       output << "\n\t<tr>".html_safe
       #output << "\n\t\t<th class=\"black-cell\"><span class=\"loading\"></span></th>"
       headers.each do |header|
           output << "\n\t\t<th>#{header.html_safe}</th>".html_safe
       end
       output << "\n\t</tr>".html_safe
       output << "\n</thead>".html_safe
       #output << "<tfoot><tr>" + content_tag('th', options[:footer], :colspan => headers.size) + "</tr></tfoot>\n" if options[:footer]  
       output << "<tbody>\n".html_safe
       
       
       return output.html_safe
    end
    def make_table_footers(collection)
        return "</tbody></table></div\n".html_safe
    end
    







    def html_table(collection, headers, options = {}, &proc)
      content=with_output_buffer(&proc)
      
      
      options.reverse_merge!({
        :placeholder  => 'Nothing to display',
        :caption      => nil,
        :table_class => nil,
        :summary      => nil,
        :footer       => ''
      })
      if collection.size==0
         summary = options[:summary] || "A list of #{collection.first.class.to_s.pluralize}".html_safe
          tblclass=" class=\""+options[:table_class]+"\"".html_safe if options[:table_class]
          tblid=" id=\""+options[:table_id]+"\"".html_safe if options[:table_id]
          output = "<table summary=\"#{summary}\" #{tblclass} #{tblid}>\n".html_safe
          output << content_tag('caption', options[:caption]).html_safe if options[:caption]
          output << "\t<caption>#{options[:caption]}</caption>\n".html_safe if options[:caption]
          output << content_tag('thead', content_tag('tr', headers.collect { |h| "\n\t" + content_tag('th', h).html_safe }).html_safe).html_safe
          output << "<tfoot><tr>" + content_tag('th', options[:footer], :colspan => headers.size) + "</tr></tfoot>\n".html_safe if options[:footer]  
          output << "<tbody>\n".html_safe
          #concat(output, proc.binding)
          output<<content
          #concat("\n</tbody>\n</table>\n", proc.binding)
          output<<"\n</tbody>\n</table>\n"
      else
          placeholder_unless collection.any?, options[:placeholder] do
             summary = options[:summary] || "A list of #{collection.first.class.to_s.pluralize}".html_safe
             tblclass=" class=\""+options[:table_class]+"\"".html_safe if options[:table_class]
             tblid=" id=\""+options[:table_id]+"\"".html_safe if options[:table_id]
             output = "<table summary=\"#{summary}\" #{tblclass} #{tblid}>\n"
             output << content_tag('caption', options[:caption]).html_safe if options[:caption]
             output << "\t<caption>#{options[:caption]}</caption>\n".html_safe if options[:caption]
             output << content_tag('thead', content_tag('tr', headers.collect { |h| "\n\t" + content_tag('th', h).html_safe }).html_safe).html_safe
             output << "<tfoot><tr>" + content_tag('th', options[:footer], :colspan => headers.size) + "</tr></tfoot>\n".html_safe if options[:footer]  
             output << "<tbody>\n".html_safe
            # concat(output, proc.binding)
              output<<content
             collection.each do |row|
               proc.call(row, cycle('odd', 'even'))
             end
              #concat("\n</tbody>\n</table>\n", proc.binding)
              output<<"\n</tbody>\n</table>\n"
          end
          return output.html_safe
    end
      unless options[:table_id].nil?
       retjs= %(
       <script type="text/javascript">
       //<![CDATA[
       Ajax.Responders.register({
       	onCreate: function() {
       		$('#{options[:table_id]}').parentNode.startWaiting('bigWaiting');	
       	},
       	onComplete: function() {
       	  $('#{options[:table_id]}').parentNode.stopWaiting();	
       	}
       });
       //]]>
       </script>
       )      
       content_for(:head) {retjs}
     end
      
    end
    def placeholder(message = 'Nothing to display', options = {}, &proc)
      # set default options
      o = { :class => 'placeholder', :tag => 'p' }.merge(options)

      # wrap the results of the supplied block, or
      # just print out the message
      if proc
        t = o.delete(:tag)
        concat tag(t, o, true), proc.binding
        yield
        concat "</#{t}>", proc.binding
      else
        content_tag o.delete(:tag), message, o
      end
    end
    def placeholder_unless(condition, *args, &proc)
      condition ? proc.call : concat(placeholder(args), proc.binding)
    end

    def upload_frame
      return "<iframe id='upload_frame' name='upload_frame' style='width:1px;height:1px;border:0px' src='about:blank'></iframe>"
    end
    def start_form_container
      return "\n<div class=\"form-container\">"
    end
    def end_form_container
      return "\n</div>"
    end
    
    def yes_no_icon(bol)
       bol ?  image_tag("/images/icons/tick.png") : image_tag("/images/icons/cross.png")   
    end
    def visible_icon(bol,tip="")
        if tip.blank?
          bol ?  image_tag("/images/icons/eye.png") : image_tag("/images/icons/hidden.png")   
        else
          bol ?  image_tag("/images/icons/eye.png",:class=>'tipsy_link',:title=>tip) : image_tag("/images/icons/hidden.png",:class=>'tipsy_link',:title=>tip)   
        end
     end
    
    
    def yes_no(bol)
       bol ? I18n.t(:yes)  : I18n.t(:no)
    end
    
    
    def org_item(label,value,bold=false,suffix="") 
      return if value.blank? || value.to_s.strip.blank?
      bold ?  content_tag("p",content_tag("strong",label+": ")+value.to_s+" "+suffix) : content_tag("p",label+": "+value.to_s+" "+suffix)
    end

    
    
    def country_icon(code,size="16",*opt)
       return if code.blank?
       if size=="16"
         image_tag("/images/flags/"+code.downcase+".png",*opt)
       elsif size=="48"
         image_tag("/images/flags/48/"+code.downcase+".png",*opt)
       end
    end

    def display_categories(categories, parent_id,show_admin=false)
      ret = "\n<ul class='category_list'>" 
      for category in categories
        if category.parent_id == parent_id
          ret << display_category(category,show_admin)
        end
      end
      ret << "\n</ul>" 
    end
  #  use_intro 
  # :use_synopsis 
  # :use_citation

    def sub_menu_item_short(label,path,first=false)
      return sub_menu_item(label,label,path,first)
    end	

    def sub_menu_item(label,title,path,first=false)
      r=""
      r<<"<li>"
      r<<"<img class=\"corner_inset_left\" alt=\"\" src=\"/images/corner_inset_left.png\" />" if first
      #r<<content_tag("li",link_to(content_tag("b",label),path,:title=>title),:class=>"menuparent") 
      r<<link_to(label,path,:title=>title.cleanup_html)
      r<<"<img class=\"corner_inset_right\" alt=\"\" src=\"/images/corner_inset_right.png\" />" if first
      r<<"</li>"
      return r
    end
    def last_menu_item(js=false)
      r=""
      if js
        r<<"<li class='last'> <img class='corner_left' alt='' src='/images/corner_left.png' /><img class='middle' alt='' src='/images/reply_background.png'/><img class='corner_right' alt='' src='/images/corner_right.png'/></li>"
      else
        r<<%(
        <li class="last">
                      <img class="corner_left" alt="" src="/images/corner_left.png"/>
                      <img class="middle" alt="" src="/images/reply_background.png"/>
                      <img class="corner_right" alt="" src="/images/corner_right.png"/>
        </li>
        )
        end
      return r
    end

    def main_menu_item(label,title,path,&block)
      # concat("<li>"+link_to(content_tag("b",label),path,:title=>title),block.binding)
       concat("<li>"+link_to(label,path,:title=>title),block.binding)
       yield
       concat("</li>",block.binding)
     end






    def display_category(category,show_admin=false)
      unless category.parent
        ret="<li><br class=\"clear\"><div class=\"thin_sep\"></div>"
        ret<< "\n\t<h3> #{category.id} " 
        show_admin ? ret << category.name : ret << link_to(category.name, admin_category_articles_path(category))
        ret<< "<i>#{category.label}</i>"
        ret<<"</h3>"
      else
        ret = "\n\t<li><strong> #{category.id}</strong> " 
        show_admin ? ret << category.name : ret << link_to(category.name, admin_category_articles_path(category))
        ret<< "<i>#{category.label}</i>"
      end


      if logged_in? && current_user.has_role?('Administrator') && show_admin
        ret << " - <span>"+link_to('edit', edit_admin_category_path(category))+"</span>"
        ret << " - <span>"+link_to('destroy', admin_category_path(category),:method=>:delete, :confirm => 'Are you sure?')+"</span>"



      end
      ret << display_categories(category.children, category.id,show_admin) if category.children.any?
      ret << "\n\t</li>" 
    end
    def display_admin_categories(categories, parent_id,second=false)
      ret = "\n<ul class='links'>" 
      if (second) 
        ret << "<li><ul class='sublinks'>"
      end
      for category in categories
        if category.parent_id == parent_id
          ret << display_admin_category(category)
        end
      end
      if (second) 
        ret << "</ul></li>"
      end
      ret << "\n</ul>" 
    end
    def display_admin_category(category)
      ret = "\n\t<li>" 
      ret << link_to(h(category.name), admin_articles_path( :id=>category))
      ret << display_admin_categories(category.children, category.id,true) if category.children.any?
      ret << "\n\t</li>" 
    end
    
    def created_updated(object)
      ret=""
      unless object.created_at.nil?
        ret<<content_tag("strong", "created:").html_safe
        ret<<object.created_at.to_s(:db).html_safe
      end
      ret<<"<br />"
      unless object.updated_at.nil?
        #ret<<"<br />"
        ret<<content_tag("strong", "updated:").html_safe
        ret<<object.updated_at.to_s(:db).html_safe
       
      end
      if object.has_attribute?('published_at')
        ret<<"<br />".html_safe
        ret<<content_tag("strong", "published:").html_safe
        ret<<object.published_at.to_s.html_safe
      end
      return content_tag("span",ret.html_safe, :class=>'small_info').html_safe
    end
end

# 
# 
# class Htmlbox
# 
#   def hello
#     return "hello world"
#   end
# 
#   @header=""
#   @headerdivname=""
#   @divid=""
#   @link=""
#   @footer=""
#   @img_alt=""
#   @loaderid=""
#   @topnav=[]
#   @rssupdatelinkname=""
#   @icon_image=""
#   @wait_loading_message=nil
#   @extraspace=false
#   @toggle_style=false
#   @alternate_style=nil
# 
#   def initialize(template)
#     @header=""
#     @headerdivname=""
#     @divid=""
#     @link=""
#     @footer="&nbsp;"
#     @extraspace=false
#     @loaderid=""
#     @rssupdatelinkname=""
#     @topnav=[]
#     @icon_image=""
#     @wait_loading_message=nil
#     @width_class=""
#     @alternate_style=nil
#     @img_alt=""
#     @toggle_style=false
#     @template=template
#   end
# 
#   def set_icon_img(s)
#     #@icon_image="<img src=\"/images/icons/logos/#{s}_16.gif\" align=\"right\" class=\"fl_right\">"
#     @icon_image=image_tag("/images/icons/logos/#{s}_16.gif",:align=>'right',:class=>'fl_right')
#   end
#   def set_wait_loading_message(s)
#     @wait_loading_message=s
#   end
# 
# 
#   def set_header(s)
#     @header=s
#   end
#   def set_loader_id(s)
#     @loaderid=s
#   end
#   def all_width(s)
#     @width_class=s
#   end
#   def set_toggle_style(b)
#     @toggle_style=b
#   end
#   def set_div_id(s)
#     @divid=" id=\"#{s}\""
#     @img_alt=s
#     @headerdivname=" name=\"arr_#{s}\""
#     @rssupdatelinkname=" name=\"rss_#{s}\""
#   end
# 
#   def set_alternate_style(s)   
#     @alternate_style=s
#   end
# 
# 
#   def method_missing(*args, &block)
#     @template.send(*args, &block)
#   end
# 
#   # def to_s
#   #   ret=""
#   #    ret<<sub_box_title
#   #    ret<<@content
#   #    ret<<sub_box_end
#   #    return ret
#   # end
# 
#   # def sub_box(header="",content="")
#   #   ret=""
#   #   ret <<sub_box_title(header)
#   #   ret <<content
#   #   ret <<sub_box_end
#   #   return ret
#   # end
# 
# end
# 
# 
