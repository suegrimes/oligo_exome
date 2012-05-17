class FaqV13Controller < ApplicationController
  skip_before_filter :login_required
  FILE_PATH = File.join(RAILS_ROOT, "public/files/exome_v13")
  
  def technology
  end

  def figure_s1
   #file_path = File.join(RAILS_ROOT, "public/images", "Figures_S1_Natsoulis.png")
   #send_file file_path, :type => 'image/png', :disposition => 'inline'
  end

  def statistics
    @table1 = read_table(File.join(FILE_PATH, "v13stats_table1.txt"))
  end
  
end
