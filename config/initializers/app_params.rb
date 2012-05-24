META_TAGS = {:description => "Stanford Human OligoExome comprises capture oligonucleotides which cover the CCDS exon space and a high proportion of related regulatory regions from the human genome",
             :keywords => ["stanford university, hanlee ji, george natsoulis, oligoexome, oligo exome, oligo, oligonucleotide, human genome, cancer,
                            cancer research, resequencing, dna sequencing, capture sequence, primer, CCDS, gene, regulatory region"]}
                            
# Method for reading system configuration files, and returning first non-comment row
def read_file(filepath)
  if FileTest.file?(filepath)
    FasterCSV.foreach(filepath, {:col_sep => "\t"}) do |row|
      next if row[0][0..0] == '#'
      return row
    end
  end
  return nil  # File doesn't exist, or no non-comment rows
end

#Read App_Versions file to set current application version #
#version# is first row, first column
app_version_row = read_file("#{RAILS_ROOT}/public/app_versions.txt")
APP_VERSION = (app_version_row ? app_version_row[0] : '??') 

# Determine whether application is in capistrano release management structure, or not
# Set path to zip files accordingly
CAPISTRANO_DEPLOY = RAILS_ROOT.include?('releases')
ZIP_REL_PATH = (CAPISTRANO_DEPLOY ? File.join("..", "..", "shared", "files") : "public")
ZIP_ABS_PATH = File.join(RAILS_ROOT, ZIP_REL_PATH)

# Read exome_version file to determine which set of exome designs to access
# Exome version row will be in format: EXOME=V? (where ? is version number)
exome_row = read_file("#{RAILS_ROOT}/public/system/exome_version.txt")
EXOME_VERSION = (exome_row ? exome_row[0][7..-1].to_i : 12)  # Default to version 12 if exome version not readable

APP_LAYOUT = ['exome_v', EXOME_VERSION.to_s].join
OLIGO_DESIGN_TABLE = ['oligo_designs_v', EXOME_VERSION.to_s].join
OSSEQ_DESIGN_TABLE = ['osseq_designs_v', EXOME_VERSION.to_s].join
ANNOT_FLAG = (EXOME_VERSION && EXOME_VERSION > 8 ? 'N' : 'Y')
