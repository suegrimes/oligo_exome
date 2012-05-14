class WelcomeController < ApplicationController
  skip_before_filter :login_required, :only => :welcome

  def welcome
  end
  
  def notimplemented
  end

  def debug
  end

end