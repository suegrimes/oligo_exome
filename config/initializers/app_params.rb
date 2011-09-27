META_TAGS = {:description => "Stanford Human OligoExome comprises capture oligonucleotides which cover the CCDS exon space and a high proportion of related regulatory regions from the human genome",
             :keywords => ["stanford university, hanlee ji, george natsoulis, oligoexome, oligo exome, oligo, oligonucleotide, human genome, cancer,
                            cancer research, resequencing, dna sequencing, capture sequence, primer, CCDS, gene, regulatory region"]}
                            
CAPISTRANO_DEPLOY = RAILS_ROOT.include?('releases')
ZIP_REL_PATH = (CAPISTRANO_DEPLOY ? File.join("..", "..", "shared", "files") : File.join("public", "files"))
ZIP_ABS_PATH = File.join(RAILS_ROOT, ZIP_REL_PATH)
