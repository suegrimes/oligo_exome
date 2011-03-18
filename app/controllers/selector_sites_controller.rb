class SelectorSitesController < ApplicationController
  require_role "stanford"
  
  # GET /selector_sites
  def index
    @selector_sites = SelectorSite.curr_ver.find(:all)
  end

  # GET /selector_sites/1
  def show
    @selector_site = SelectorSite.find(params[:id])
  end

end
