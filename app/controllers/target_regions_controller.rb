class TargetRegionsController < ApplicationController
  require_role "stanford"
  
  # GET /target_regions
  def index
    @target_regions = TargetRegion.curr_ver.find(:all)
  end

  # GET /target_regions/1
  def show
    @target_region = TargetRegion.find(params[:id])
  end

end
