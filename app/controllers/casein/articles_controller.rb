module Casein
  class ArticlesController < Casein::CaseinController
    layout 'constellation'
    
    #cache_sweeper :articles_sweeper  
    respond_to :html,:js
    def index
      order='created_at desc'
      logger.debug("casein_articles_index params=#{params.inspect}")
      # if @category.children
      #   
      # end
      @per_page=10
      @asc_desc="desc"
      @order_by="created_at" 
      @my_categories=Category.find(:all,:conditions=>'parent_id != 0').group_by { |c| c.parent_id}
      unless params[:list].nil? 
        @per_page=params[:list][:per_page].to_i
        @asc_desc=params[:list][:asc_desc]
        @order_by=params[:list][:order_by]
      end
      sql_conditions=" articles.id>0"
      if params[:article_search] && !params[:article_search].blank?
        s=params[:article_search]
        sql_conditions<<" and ( CONVERT(articles.title_fr USING utf8) like '%#{s}%' )"
      end
      #published=params[:published].nil? ? "0" : params[:published]
      if params[:published] && params[:published]!="2"
        published=params[:published].nil? ? "0" : params[:published]
        sql_conditions<<" and published=#{published} "
      end
      unless params[:categories].nil?
        @sabs=params[:categories].class==String ? params[:categories] : params[:categories].join(",") 
        # @sabs=="2" ? sql_conditions<<" and (category_id=#{@sabs} or category_id in (select id from categories where parent_id=#{@sabs}))" :  sql_conditions<<" and articles.category_id in (#{@sabs})"
        sql_conditions<<" and (category_id in(#{@sabs}) or category_id in (select id from categories where parent_id in (#{@sabs})))" 

        logger.debug("casein_articles_index @sabs=#{@sabs}")

        #sql_conditions<<" and articles.category_id in (#{@sabs})"
        #@searchlabel<<"<br />"+"Displaying".t+" "+Loctype.find(params[:loctype])[1]
        #            RAILS_DEFAULT_LOGGER.error("\n params[:loctype]=#{params[:loctype]}  --- Loctype.find(params[:loctype]) ==#{Loctype.find(params[:loctype]).class} \n")
      end
      unless params[:author_id].blank?
        sql_conditions<< " and articles.user_id=#{params[:author_id]}"
      end
      @show_text=false
      unless params[:show].blank?
        @show_text=true if params[:show][:text]=="yes"
      end

      @articles=Article.paginate :per_page=> @per_page, :page=> params[:page],
      :order => "articles.#{@order_by} #{@asc_desc}", 
      :conditions => sql_conditions





      # @articles=Article.paginate :per_page=> perPage, :page=> params[:page],  :order=>order 
      @use_ajax_table=true

    end



    def show
      @article = Article.find(params[:id])


      @permpath=category_article_path(@article.category,@article)
      @escapedtitle=@article.title_fr
      respond_to do |format|
        format.html 
        format.xml  { render :xml => @article }
      end

    end

    def events
      @article = @category.articles.find(params[:id])
    end



    def new  
      if @category
        @article = @category.articles.new
      else
        @article = Article.new
      end
    end

    # POST /casein_articles
    # POST /casein_articles.xml
    def create
      @article = Article.new(params[:article])
      respond_to do |format|
        if @article.save
          flash[:notice] = 'Article was successfully created.'
          format.html { redirect_to(casein_articles_path) }
          format.xml  { render :xml => @article, :status => :created, :location => @article }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
        end
      end
    end


    def edit
      @article = Article.find(params[:id])
      # @article = Article.find(params[:id])
      # @category=Category.find(@article.category_id)



    end


    def overview
      set_category
      @article = @category.articles.find(params[:id])

      render  :layout=>'popup' 
    end
    def popup_edit
      @article = @category.articles.find(params[:id])
      render :action=>'edit', :layout=>'redboxwide' 
    end




    def set_article_user_id
      @article = Article.find_by_id(params[:id])

      @category=@article.category
      @user=User.find_by_id(params[:article]['user_id'])
      @article.user=@user
      @article.save!
      # render :layout=>false, :text => @username
      respond_to do |format|
        format.js do
          render :update do |page|
            page[@article.dom_id].replace_html :partial => 'admin/articles/article', :locals => {:article=>@article}
          end
        end
      end
    end 




    def enabledisable
      @article = Article.find(params[:id])
      @category=@article.category
      if @article.update_attribute(:published, params[:enabled])
        #  @article.published_at = Time.now
        @article.update_attribute(:published_at,Time.now)
        #@article.published_at = Time.now 

        if @article.published
            message = "article published, it is visible now"          
        else
           message = "article un-published, it is hidden now"
        end
      else
        message = "There was a problem setting publish status this article."
      end
      flash[:notice] = message
      respond_with @article
    end



    def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        flash[:notice] = "Article #{@article.title_fr} "+"successfully updated"
        # expire_action_content('/articles')
        # expire_action_content("/articles/#{@article.id}-#{@article.permalink}")
        respond_to do |wants|
          unless params[:close_after].nil?
            logger.debug("update_article params[:close_after]=#{params[:close_after]}")
            wants.html {render :layout=>'redboxwide'}# => update.html.erb
          else
            wants.html { redirect_to casein_articles_url }
            wants.xml  { render :xml => @article.to_xml }
          end
        end
      else
        flash[:error] = "Article #{@article.title} cannot be updated"
      end
    end

    def destroy
      @article = Article.find(params[:id])
      # expire_action_content("/articles/#{@article.id}-#{@article.permalink}")
      @article.destroy
      # expire_action_content('/articles')
      respond_to do |wants|
        wants.js do
          render :update do |page|
            page.visual_effect :fade, @article.dom_id
          end
        end
        wants.html { redirect_to casein_category_articles_url }
        wants.xml  { render :nothing => true }
      end
    end

    protected
    def set_category
      @category=nil
      if params[:category_id]
        @category=Category.find params[:category_id]
      end
    end

  end
end



