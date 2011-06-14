class HomeController < ApplicationController
  respond_to :html,:js,:xml
  def index
  end
  def send_contact
    ContactMailer.contact_message(params[:name],params[:email],params[:message]).deliver
  end
  
  def facebook
    @galleries=Gallery.latest
    @articles=Article.latest
    render :layout=>'facebook'    
  end

end
