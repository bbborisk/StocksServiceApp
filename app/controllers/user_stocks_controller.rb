class UserStocksController < ApplicationController

  def create
    UserStock.connection
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "#{@user_stock.stock.name} was successfully added"
    redirect_to my_portfolio_path
  end
end
