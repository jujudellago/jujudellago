class HomeController < ApplicationController
  respond_to :html,:js,:xml
  def index
  end
  def send_contact
    @oksend=false
    if verify_recaptcha(:message => "Erreur de captcha")
      @oksend=true
      ContactMailer.contact_message(params[:name],params[:email],params[:message]).deliver      
    end
     render :layout=>'popup'
  end
  
  def facebook
    @galleries=Gallery.latest(3)
    @articles=Article.latest(3)
    render :layout=>'facebook'    
  end
  def contact
    render :layout=>'popup'
    
  end

end
