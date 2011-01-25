module MarkItUp
  module ViewHelpers
    include ActionView::Helpers::AssetTagHelper

    def mark_it_up(selector, options = nil, dependencies = true)
      settings = options || MarkItUp.settings
      html = ""
      if dependencies
        html << include_mark_it_up_javascripts
        html << include_mark_it_up_stylesheet
        html << include_textile_set
        html << include_textile_stylesheets
      end
      if selector.is_a?Array
        html << js_start
        selector.each do |s|
          html << "jQuery('#{s}').markItUp(#{MarkItUp.format_settings(settings)})\n"
        end
        html << js_end
      

      else
        html << %{
          <script type="text/javascript">
            jQuery(document).ready(function() {
              jQuery('#{selector}').markItUp(#{MarkItUp.format_settings(settings)})
            });
          </script>
        }
      end

      return_html_considering_rails_version(html)


    end

    def js_start
      return return_html_considering_rails_version "<script type=\"text/javascript\">\n\tjQuery(document).ready(function() {\n"      
    end
    def js_end
      return return_html_considering_rails_version "\n\t});\n</script>"      
    end

    def include_textile_set
       return_html_considering_rails_version(javascript_include_tag("/#{MarkItUp.root}/sets/textile/set.js"))
    end
    def include_textile_stylesheets
        css = %{\n<link href="/#{MarkItUp.root}/sets/textile/style.css" media="all" rel="stylesheet" type="text/css" />}
        return_html_considering_rails_version(css)
    end

    def include_mark_it_up_javascripts
      js_file_name = Rails.env.production? ? "jquery.markitup.pack" : "jquery.markitup"
      return_html_considering_rails_version(javascript_include_tag("/#{MarkItUp.root}/#{js_file_name}.js"))
    end
    def include_mark_it_up_stylesheet
      css = %{\n<link href="/#{MarkItUp.root}/skins/#{MarkItUp.skin}/style.css" media="all" rel="stylesheet" type="text/css" />}
      return_html_considering_rails_version(css)
    end  
      
    def include_mark_it_up_stylesheets
      css = %{\n<link href="/#{MarkItUp.root}/skins/#{MarkItUp.skin}/style.css" media="all" rel="stylesheet" type="text/css" />}
      inline_css = MarkItUp.markup_set.inject("") do |x,btn|
        icon = btn[:icon].blank? ? MarkItUp.default_icon : btn[:icon]
        icon.concat(".png") unless icon.match(MarkItUp::ICONS_EXTENSIONS_REGEXP)
        x.concat(btn[:className].blank? ? "" : ".markItUp .#{btn[:className]} a {background-image:url(/#{MarkItUp.root}/icons/#{icon})}\n")
      end
      css << %{
<style type="text/css" media="all">
#{inline_css}
</style>
      }
      return_html_considering_rails_version(css)
    end

    private

      def return_html_considering_rails_version(html)
        (Rails::VERSION::MAJOR == 3) ? html.html_safe : html
      end

  end
end

ActionView::Base.send :include, MarkItUp::ViewHelpers