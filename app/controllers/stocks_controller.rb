class StocksController < ApplicationController
  def search
    if params[:stock].present?
        @stock = Stock.new_from_lookup(params[:stock])
        if @stock
          render 'users/my_portfolio'
        else
          flash[:danger] = "No such symbol"
          redirect_to my_portfolio_path
        end
    else
      flash[:danger] = "Search bar is empty"
      redirect_to my_portfolio_path
    end
    end


end
