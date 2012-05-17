class FaqV8Controller < ApplicationController
  skip_before_filter :login_required
  FILE_PATH = File.join(RAILS_ROOT, "public/files/exome_v8")
  
  def technology
  end

  def figure_s1
   #file_path = File.join(RAILS_ROOT, "public/images", "Figures_S1_Natsoulis.png")
   #send_file file_path, :type => 'image/png', :disposition => 'inline'
  end
 
  def table_s5
    @table_s5 = read_table(File.join(FILE_PATH, "Table_S5_Novels_SNVs.txt"))
    #send_file(File.join(FILE_PATH, "Table_S5_Novels_SNVs.txt"), :type => 'text/csv', :disposition => 'inline')
  end
  
  def table_s8
    #@table_s8 = read_table(File.join(FILE_PATH, "Table_S8_Capture_Oligos.txt"))
    send_file(File.join(FILE_PATH, "Table_S8_Capture_Oligos.txt"), :type => 'text/csv', :disposition => 'inline')
  end

  def statistics
    @stats_table1 = read_table(File.join(FILE_PATH, "oligostats_table2.txt"))
    @stats_table2 = read_table(File.join(FILE_PATH, "oligostats_table3.txt"))
    @stats_table3 = read_table(File.join(FILE_PATH, "oligostats_table4a.txt"))
  end
  
  def annotations 
  end

end
