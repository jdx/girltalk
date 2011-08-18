class ApplicationController < ActionController::Base
  protect_from_forgery

  include Locomotive::Routing::SiteDispatcher

  include Locomotive::Render

  before_filter :require_site

  def home
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      render_locomotive_page
    end
  end

  protected

  # rescue_from Exception, :with => :render_error
  #
  # def render_error
  #   render :template => "/admin/errors/500", :layout => '/admin/layouts/box', :status => 500
  # end
end
