class WelcomeController < ApplicationController
  skip_before_filter :login_required, :only => :welcome

  def welcome
    render :action => "v#{EXOME_VERSION}_welcome"
  end
  
  def notimplemented
  end

  def debug
  end

end