# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

    private #----------------

  def authorize_access
    if not session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => 'admin', :action => 'login')
      return false;
    end
  end
end
