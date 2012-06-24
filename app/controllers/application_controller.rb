class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_footer_links  
  layout :layout_by_resource

  protected

  def load_footer_links
    @footer_links = FooterLink.order(:title).all
  end
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
  
end
