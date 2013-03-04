class SettingsController < ApplicationController

  before_filter :authenticate_user!
  respond_to :js
  
  def toggle
    key = params[:key]
    val = !Setting[key]
    Setting[key] = val
    render :js=> "$('a[href$=\"\/#{key}\"]').find('i').attr('class','icon-#{val ? 'ok' : 'remove'}');"
  end


end
