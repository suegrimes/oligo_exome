class UserNotifier < ActionMailer::Base
  #SITE_URL = 'reve.stanford.edu/oligo_exome'  # Development/Test (SGTC)
  SITE_URL  = 'oligoexome.stanford.edu' # Production (SGTC-svr108)
  
  default content_type: 'text/html'

  def reset_notification(user)
    @user = user
    @url = "http://#{SITE_URL}/reset/#{user.reset_code}"
    mail(:subject => 'OligoExome: Link to reset your password',
	     :from => 'oligoexome_admin@stanford.edu',
		   :to => user.email)
  end
end
