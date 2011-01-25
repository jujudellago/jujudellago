module Casein
  class TranslationsController < Casein::CaseinController
    layout 'constellation'

    respond_to :html,:js
    #prepend_view_path(File.join(File.dirname(__FILE__), "..", "views"))
   # layout 'admin'


    # GET /translations
    # GET /translations.xml
    def index
      #    @translations = @locale.translations.paginate(:all, :order => "id, value, pluralization_index")
      @letters=%w(a b c d e f g h i j k l m n o p q r s t u v w x y z)



      @per_page=50
      @asc_desc="asc"
      @order_by="value" 

      unless params[:list].nil? 
        @per_page=params[:list][:per_page].to_i
      end
      sql_conditions=" locale='fr' "
      if params[:translation_search] && !params[:translation_search].blank?
        s=params[:translation_search]
        sql_conditions<<" and ( CONVERT(translations.value USING utf8) like '%#{s}%' )"
      end
      if params[:letter] && !params[:letter].blank?
        s=params[:letter]
        sql_conditions<<" and ( CONVERT(translations.value USING utf8) like '#{s}%' )"
      end

     # @translations=Translation.paginate :per_page=> @per_page, :page=> params[:page],      :order => "translations.#{@order_by} #{@asc_desc}",       :conditions => sql_conditions
      @translations=Translation.paginate :per_page=> @per_page, :page=> params[:page],      :order => "translations.#{@order_by} #{@asc_desc}",       :conditions => sql_conditions
      respond_with(@translations)
    end


    # GET /translations
    # GET /translations.xml





    def translations
      @translation_option="translated"
      if params[:translation_option]=="not-translated"
        @translation_option="not-translated"
        extra_conditions="value IS  NULL"
      else
        extra_conditions="value IS NOT NULL"
      end

      @translations = Translations.find(:all, :order => "raw_key",:conditions=>extra_conditions) do 
        if params[:_search] == "true"
          raw_key =~ "%#{params[:raw_key]}%" if params[:raw_key].present?
          #  default_locale_value  =~ "%#{params[:default_locale_value]}%" if params[:default_locale_value].present?                
          value     =~ "%#{params[:value]}%" if params[:value].present?
          default_locale_value  =~ "%#{params[:default_locale_value]}%" if params[:default_locale_value].present?
        end
        paginate :page => params[:page], :per_page => params[:rows]      
        order_by "#{params[:sidx]} #{params[:sord]}"
      end
      respond_with(@translations)

    end





      # GET /asset_translations
      # GET /asset_translations.xml
      def asset_translations
        @locale ||= Locale.default_locale
        @translation_option = TranslationOption.find(params[:translation_option])

        @asset_translations  = I18n.asset_translations
        @untranslated_assets = I18n.untranslated_assets(@locale.code)
        @percentage_translated =   ( (@asset_translations.size - @untranslated_assets.size).to_f / @asset_translations.size.to_f * 100).round

        if @translation_option == TranslationOption.translated
          @asset_translations = @asset_translations.reject{|e| @untranslated_assets.include?(e)}
        else
          @asset_translations = @untranslated_assets
        end

        respond_with(@untranslated_assets)
      end

      # GET /translations/1
      # GET /translations/1.xml
      def show
        @translation = @locale.translations.find(params[:id])

        respond_with(@translation)
      end

      # GET /translations/new
      # GET /translations/new.xml
      def new
        @translation = Translation.new
        respond_with(@translation)

      end

      # GET /translations/1/edit
      def edit
        @translation = @locale.translations.find(params[:id])
        respond_with(@translation)
      end

      def smart_edit
        @translation = Translation.find_by_key(params[:id])
        respond_with(@translation)
      end

      def smart_update
        @translation = Translation.find(params[:id])

        vals=params[:value]
        vals.each do |k,v|
          l=Locale.find(k)
          if v.blank?
            v=nil
          end
          I18nUtil.create_translation(l, @translation.raw_key, @translation.pluralization_index, v)
        end

        render :layout=>false

      end

      # POST /translations
      # POST /translations.xml
      def create
        @translation = @locale.translations.build(params[:translation])

        respond_with(@translation)
      end

      # PUT /translations/1
      # PUT /translations/1.xml
      def update
        @translation  = @locale.translations.find(params[:id])
        @first_time_translating = @translation.value.nil?


        if @translation.update_attributes(params[:translation])
          respond_with(@translation)
        end
      end
    end


    def jqgrid
      logger.debug(params.inspect)
      # It's of course your role to add security / validation here

      if params[:oper] == "del"
        Translation.find(params[:id]).destroy
      elsif params[:oper]== "add"
        Translation.create(:raw_key=>params[:value])
      else
        translation_params = {:value => params[:value]}
        #if params[:id] == "_empty"
        #  user = Translation.create(translation_params)
        #else
        translation = Translation.find(params[:id])
        translation.update_attributes(translation_params)
        # end
      end

      # If you need to display error messages
      err = ""
      if translation
        translation.errors.entries.each do |error|
          err << "<strong>#{error[0]}</strong> : #{error[1]}<br/>"
        end
      end

      render :text => "#{err}"  

    end



    # DELETE /translations/1
    # DELETE /translations/1.xml
    def destroy
      @translation = Translation.find(params[:id])
      if @translation.destroy
        flash[:notice]="Traduction effacée"
      else
        flash[:error]="Une erreur est survenue"
      end
      respond_with(@translation)
    end

    private

    def find_locale
      if params[:lokale_id]
        @locale = Locale.find_by_code(params[:lokale_id]) 
      else
        @locale=Locale.default_locale
      end

    end
  end
