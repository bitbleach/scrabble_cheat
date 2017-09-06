class PagesController < ApplicationController
  # GET /
  #
  def main
  end
  
  def search
    @term = params[:search][:query]
  end
end
