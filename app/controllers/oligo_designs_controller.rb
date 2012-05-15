class OligoDesignsController < ApplicationController

  # GET /oligo_designs
  def index
    @oligo_designs = OligoDesign.find(:all)
  end
  #
  # GET /oligo_designs/1
  def show
    @oligo_design = OligoDesign.find(params[:id], :include => :oligo_annotation )
    @comments     = @oligo_design.comments.sort_by(&:created_at).reverse
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
      @oligo_designs = OligoDesign.find_selectors_with_conditions(['gene_code IN (?)', gene_list])
      error_found    = check_if_blank(@oligo_designs, 'oligos', 'gene(s)')
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
      @oligo_design = OligoDesign.find(params[:id])
      store_comment(@oligo_design, params)
    end

    redirect_to :action => 'show', :id => params[:id]
  end
end