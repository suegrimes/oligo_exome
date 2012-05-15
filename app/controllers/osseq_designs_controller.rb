class OsseqDesignsController < ApplicationController
  # GET /osseq_designs
  def index
    @osseq_designs = OsseqDesign.find(:all)
  end
  #
  # GET /oligo_designs/1
  def show
    @osseq_design = OsseqDesign.find(params[:id])
    @comments     = @osseq_design.comments.sort_by(&:created_at).reverse
  end

  #*******************************************************************************************#
  # Methods for input of parameters for retrieval of specific oligo designs                   #
  #*******************************************************************************************#
  def select_params
    @genes    = (params[:genes] ? params[:genes] : '')
  end

  #*******************************************************************************************#
  # Method for listing oligo designs, based on parameters entered above                       #
  #*******************************************************************************************#
  def list_selected
    error_found = false
    @rc = check_gene_params(params)

    case @rc
      when /e\d/ # error code ('e' followed by digit)
      error_found    = true
      
    when 'g'  #gene list entered
      gene_list      = create_array_from_text_area(params[:genes])
      @osseq_designs = OsseqDesign.find_oligos_with_conditions(['gene_code IN (?)', gene_list])
      error_found    = check_if_blank(@osseq_designs, 'oligos', 'gene(s)')
    end

    if error_found
      redirect_to :action => 'select_params', :genes => params[:genes]
    else
      render :action => 'list_selected'
    end
  end

  #*******************************************************************************************#
  # Method for adding comment associated with a specific oligo                                #
  #*******************************************************************************************#
  def add_comment
    unless params[:comment].nil? || params[:comment]== ''
      @osseq_design = OsseqDesign.find(params[:id])
      store_comment(@osseq_design, params)
    end

    redirect_to :action => 'show', :id => params[:id]
  end  
end