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
    @table1 = read_table(File.join(FILE_PATH, "oligostats_table2.txt"))
    @table2 = read_table(File.join(FILE_PATH, "oligostats_table3.txt"))
    @table3 = read_table(File.join(FILE_PATH, "oligostats_table4a.txt"))
  end
  
end
