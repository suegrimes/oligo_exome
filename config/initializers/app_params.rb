META_TAGS = {:description => "Stanford Human OligoExome comprises capture oligonucleotides which cover the CCDS exon space and a high proportion of related regulatory regions from the human genome",
             :keywords => ["stanford university, hanlee ji, george natsoulis, oligoexome, oligo exome, oligo, oligonucleotide, human genome, cancer,
                            cancer research, resequencing, dna sequencing, capture sequence, primer, CCDS, gene, regulatory region"]}
                            
#read App_Versions file to set current application version #
#version# is first row, first column
filepath = "#{RAILS_ROOT}/public/app_versions.txt"
if FileTest.file?(filepath)
  app_version_row1 = FasterCSV.read(filepath, {:col_sep => "\t"})[0]
end
APP_VERSION = (app_version_row1 ? app_version_row1[0] : '??') 

# Determine whether application is in capistrano release management structure, or not
# Set path to zip files accordingly
CAPISTRANO_DEPLOY = RAILS_ROOT.include?('releases')
ZIP_REL_PATH = (CAPISTRANO_DEPLOY ? File.join("..", "..", "shared", "files") : "public")
ZIP_ABS_PATH = File.join(RAILS_ROOT, ZIP_REL_PATH)

# Exome version# should later be read from a file, vs hard-coded
EXOME_VERSION = 13
APP_LAYOUT = ['exome_v', EXOME_VERSION.to_s].join
OLIGO_DESIGN_TABLE = ['oligo_designs_v', EXOME_VERSION.to_s].join
OSSEQ_DESIGN_TABLE = ['osseq_designs_v', EXOME_VERSION.to_s].join
ANNOT_FLAG = (EXOME_VERSION > 8 ? 'N' : 'Y')

