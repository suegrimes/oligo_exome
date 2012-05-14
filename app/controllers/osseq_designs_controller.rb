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
    @rc = check_params(params)

    case @rc
      when /e\d/ # error code ('e' followed by digit)
      error_found    = true
      
    when 'g'  #gene list entered
      gene_list      = create_array_from_text_area(params[:genes])
      @osseq_designs = OsseqDesign.find_selectors_with_conditions(['gene_code IN (?)', gene_list])
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

private
  #*******************************************************************************************#
  # Method for checking parameters from "select_params"                                       #    
  #*******************************************************************************************#
  def check_params(params, action='list')
    # check first for #nr genes > 400 which can cause browser errors
    nr_genes = params[:genes].split.size if params[:genes]
    if nr_genes && nr_genes > 400
        params[:genes] = ''  #reset params[:genes] to avoid browser errors
        flash[:notice] = "Too many genes (#{nr_genes}) in list - please limit to 400 genes"
        rc = 'e2'

    elsif !params[:genes].blank?
      rc = 'g'

    else
      # error - genes are blank
      flash[:notice] = 'Please select one or more gene(s) for this query'
      rc = 'e1'
    end
    return rc
  end
end