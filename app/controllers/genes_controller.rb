class GenesController < ApplicationController
  require_role "stanford"
  
  # GET /genes
  def index
    @genes = Gene.find(:all)
  end

  # GET /genes/1
  def show
    @gene = Gene.find(params[:id])
  end

end
