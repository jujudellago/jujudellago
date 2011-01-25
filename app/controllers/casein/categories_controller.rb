module Casein
  class CategoriesController < Casein::CaseinController
    layout 'constellation'
    respond_to :html,:js
    def index
      @categories = Category.find(:all,:conditions=>{:parent_id=>0})
      @categories_ordred=@categories.group_by { |c| c.parent_id }

      respond_with(@categories)
    end

    def show
      @category = Category.find(params[:id])

      respond_to do |wants|
        wants.html { redirect_to admin_category_articles_url(:category_id => @category.id) }
        wants.xml { render :xml => @category.to_xml }
      end
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(params[:category])

      if @category.save
        flash[:notice] = 'Category was successfully created.'
        respond_to do |wants|
          wants.html { redirect_to casein_categories_url }
          wants.xml { render :xml => @category.to_xml }
        end
      else
        flash[:error] = 'An error occured trying to create this category.'
        respond_to do |wants|
          wants.html { render :action => "new" }
          wants.xml  { render :xml => @category.errors.to_xml }
        end
      end  
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      respond_to do |wants|
        wants.html { redirect_to casein_categories_url }
        wants.xml { render :xml => @category.to_xml }
      end
    end

    def destroy
      @category = Category.find(params[:id])    
      @category.destroy
      flash[:notice] = 'Category was successfully destroyed.'
      respond_with  @category
    end

    def admin
      @categories = Category.find(:all)
      respond_to do |wants|
        wants.html
        wants.xml { render :xml => @categories.to_xml }
      end    
    end
  end
end