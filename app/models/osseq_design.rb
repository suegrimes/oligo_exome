# == Schema Information
#
# Table name: osseq_designs
#
#  id                     :integer(4)      not null, primary key
#  oligo_name             :string(100)     default(""), not null
#  chromosome_nr          :string(3)
#  gene_code              :string(25)
#  roi_nr                 :integer(2)
#  sel_polarity           :string(1)
#  selector               :string(40)
#  uselector              :string(40)
#  selector_useq          :string(108)
#  amplicon_chr_start_pos :integer(4)
#  amplicon_chr_end_pos   :integer(4)
#  amplicon_length        :integer(4)
#  version_id             :integer(4)
#  genome_build           :string(25)
#  created_at             :datetime
#  updated_at             :datetime
#

class OsseqDesign < ActiveRecord::Base
  set_table_name = OSSEQ_DESIGN_TABLE
  
  acts_as_commentable
  
  validates_uniqueness_of :oligo_name,
                          :on  => :create  

  #****************************************************************************************#
  #  Define virtual attributes                                                             #
  #****************************************************************************************#
  
  def polarity
    (sel_polarity == 'p' ? 'plus' : 'minus')
  end
  
#  def usel_vector
#    selector_useq[41,68]
#  end
  
#  def selector
#    [sel_5prime, Vector::VECTOR].join('')
#  end

  #****************************************************************************************#
  #  Class find methods   - Oligos                                                         #
  #****************************************************************************************#
  
  def self.find_using_oligo_name_id(oligo_name)
    # Use id or gene_code index to speed retrieval.
    # Note: curr_oligo_format?, and get_gene_from_name are in OligoExtensions module
    
    if curr_oligo_format?(oligo_name)                            
      # oligo name in current format, => use id as index
      oligo_array  = oligo_name.split(/_/)
      oligo_design = self.find_by_oligo_name_and_id(oligo_name, oligo_array[0])
    else
      # oligo name in old format => cannot use id, use gene code instead
      #gene_code    = self.get_gene_from_name(oligo_name, false)
      gene_code    = get_gene_from_oligo_name(oligo_name, false) 
      oligo_design = self.find_by_oligo_name_and_gene_code(oligo_name, gene_code)
    end
    
    return oligo_design
  end
  
  def self.find_selectors_with_conditions(condition_array)
    self.qcpassed.find(:all, :order => 'gene_code, enzyme_code',                               
                             :conditions => condition_array) 
  end
  
  def self.find_with_id_list(id_list)
    self.find(:all, :include => :oligo_annotation,
                    :order => 'gene_code, enzyme_code',
                    :conditions => ["id IN (?)", id_list])
  end
  
end
