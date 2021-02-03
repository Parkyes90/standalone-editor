class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      if stock
        stock.save
      else
        flash[:alert] = 'Please enter a valid symbol to search'
        return redirect_to my_portfolio_path
      end
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] =
      "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user: current_user, stock: stock).first
    user_stock.destroy
    flash[:notice] =
      "#{stock.ticker} was successfully removed from your portfolio"
    redirect_to my_portfolio_path
  end
end
