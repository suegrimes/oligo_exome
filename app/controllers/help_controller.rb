class HelpController < ApplicationController
  skip_before_filter :login_required
  
  def technology
  end

#  def diagram
#    file_path = File.join(RAILS_ROOT, "public/images", "oligoexome_technology.jpg")
#    send_file file_path, :type => 'image/jpeg', :disposition => 'inline'
#  end

  def statistics
    file_path = File.join(RAILS_ROOT, "public/files")
    @table1 = read_table(File.join(file_path, "oligostats_table2.txt"))
    @table2 = read_table(File.join(file_path, "oligostats_table3.txt"))
    @table3 = read_table(File.join(file_path, "oligostats_table4a.txt"))
  end
  
  def annotations 
  end

protected
  def read_table(file_path)
    FasterCSV.read(file_path, {:col_sep => "\t"})
  end
end
