# == Schema Information
#
# Table name: versions
#
#  id                    :integer(4)      not null, primary key
#  version_for_synthesis :string(1)
#  exonome_or_partial    :string(1)
#  genome_build          :string(15)      default(""), not null
#  ccds_build            :string(15)
#  dbsnp_build           :string(15)
#  design_version        :string(15)      default(""), not null
#  version_name          :string(50)
#  vector_id             :integer(4)
#  archive_flag          :string(1)
#  genome_build_notes    :string(255)
#  design_version_notes  :string(255)
#  created_at            :datetime
#  updated_at            :timestamp       not null
#

class Version < ActiveRecord::Base   
  DESIGN_VERSION = self.find_by_id(EXOME_VERSION)
end
