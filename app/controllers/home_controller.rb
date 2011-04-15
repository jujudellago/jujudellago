class HomeController < ApplicationController
  respond_to :html,:js,:xml
  def index
  end
  def send_contact
    ContactMailer.contact_message(params[:name],params[:email],params[:message]).deliver
  end

end
