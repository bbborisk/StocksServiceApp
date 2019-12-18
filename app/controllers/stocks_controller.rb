class StocksController < ApplicationController
  def search

    if params[:stock].blank?
      flash.now[:danger] = "Search bar is empty" #treba .now jer flash traje do refresha, a mi preko AJAXa renderujemo samo partial
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "No such symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
