# == Schema Information
#
# Table name: osseq_designs
#
#  id                     :integer(4)      not null, primary key
#  oligo_name             :string(100)     default(""), not null
#  chromosome_nr          :string(3)
#  gene_code              :string(25)
#  exon_nr                :integer(2)
#  sel_polarity           :string(1)
#  capture_seq            :string(40)
#  target_chr_start_pos   :integer(4)
#  amplicon_chr_start_pos :integer(4)
#  amplicon_chr_end_pos   :integer(4)
#  tile_score             :decimal(8,3)
#  version_id             :integer(4)
#  updated_at             :datetime
#

class OsseqDesign < ActiveRecord::Base
  set_table_name OSSEQ_DESIGN_TABLE
  
  acts_as_commentable
  
  validates_uniqueness_of :oligo_name,
                          :on  => :create  

  #****************************************************************************************#
  #  Define virtual attributes                                                             #
  #****************************************************************************************#
  
  def polarity
    (sel_polarity == 'p' ? 'plus' : 'minus')
  end
  
  #****************************************************************************************#
  #  Class find methods   - Oligos                                                         #
  #****************************************************************************************#
  
  def self.find_using_oligo_name_id(oligo_name)        
    # use id as index
    oligo_array  = oligo_name.split(/_/)
    return self.find_by_oligo_name_and_id(oligo_name, oligo_array[0])
  end
  
  def self.find_oligos_with_conditions(condition_array)
    self.find(:all, :order => 'gene_code, exon_nr',                               
                    :conditions => condition_array) 
  end
  
  def self.find_with_id_list(id_list)
    self.find(:all, :order => 'gene_code, exon_nr',
                    :conditions => ["id IN (?)", id_list])
  end
  
end
