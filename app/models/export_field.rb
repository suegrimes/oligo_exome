# == Schema Information
#
# Table name: export_fields
#
#  id           :integer(4)      not null, primary key
#  export_type  :integer(1)
#  model_nm     :string(50)      default(""), not null
#  report_order :integer(2)
#  fld_heading  :string(25)
#  fld_name     :string(50)
#

class ExportField < ActiveRecord::Base

def self.headings
  condition_array = self.export_conditions
  rpt_hdgs = self.find(:all, :order => :report_order, :conditions => condition_array)
  rpt_hdgs.collect(&:fld_heading)  
end

def self.fld_names
  condition_array = export_conditions
  rpt_flds = self.find(:all, :order => :report_order, :conditions => condition_array)
  rpt_flds.collect{|xport| [xport.model_nm, xport.fld_name]}
end

def self.export_conditions
  # Probably three distinct export formats => use 3 different formats in SQL table
  # 1. Original (version 8) exome designs, which have annotations both in oligo_designs table, and annotations table
  # 2. Subsequent selector design (version 12, no restriction enzymes), no annotations in oligo_designs or annotations table
  # 3. OS-Seq designs (version 13), no annotations, and slightly different fields
  
  # Currently only format 1 exists in the table.  'Virtual' export format 2 excludes annotation table fields
  
  xfmt = (EXOME_VERSION > 12 ? 2 : 1)
  if EXOME_VERSION > 8
    condition_array = ["re_versions_only IS NULL AND export_type = ?", xfmt]
  else
    condition_array = ["export_type = ?", xfmt]
  end
  return condition_array
end

end
