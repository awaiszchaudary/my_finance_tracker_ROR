class StockController < ApplicationController

    def show
        @price = Stock.new_lookup('MSFT')
    end

    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock.present?
                respond_to do |format|
                    format.js {render partial: 'user/result'}
                end
            else
                respond_to do |format|
                    flash[:alert] = 'Please enter a valid symbol to search'
                    format.js {render partial: 'user/result'}
                end
            end
        else
            respond_to do |format|
                flash[:alert] = 'Please enter a symbol to search'
                format.js {render partial: 'user/result'}
            end
        end
    end

    def create
        current_user.stocks.create(name: params[:name], ticker: params[:ticker], last_price: params[:last_price])
        flash[:notice] = "Stock added to your porfolio"
        redirect_to portfolio_path
    end

    def destroy
        @st = current_user.user_stocks.find_by(stock_id: params[:id])
        @st.destroy
        flash[:notice] = "Stock removed from portfolio successfully"
        redirect_to portfolio_path
    end


end