class ArticlesController < ApplicationController
  before_filter :set_category
  def index
        logger.debug("ArticlesController  index")
    @per_page=10
    @order_by="published_at"
    @articles=@category.articles.paginate(:per_page=> @per_page, :page=> params[:page], :conditions=>'published=true',
    :order => "articles.#{@order_by} desc")
    respond_to do |wants|
      wants.html
      wants.rss
    end
  end

  def show
    @article=Article.find(params[:id], :conditions=>'published=true')
  end
  private
  def set_category
    logger.debug("ArticlesController set_category params=>#{params[:category_id]}")
    @category=Category.find(params[:category_id])
    logger.debug("ArticlesController set_category @category=>#{@category.name}")
  end
end
