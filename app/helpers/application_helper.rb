# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def error_messages_for( object )
    render(:partial => '/shared/error_messages', :locals => {:object => object})
  end

  def games_list()
    render(:partial => '/shared/games_list')
  end
end
