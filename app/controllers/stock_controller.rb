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

end