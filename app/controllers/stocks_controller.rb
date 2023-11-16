class StocksController < ApplicationController

  def stock_search
    if params[:query].present?
      @stock = Stock.stock_lockup(params[:query])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/js_result'}
        end
      else
        flash.now[:alert] = "Please enter the valid company symbol"
        respond_to do |format|
          format.js { render partial: 'users/js_result'}
        end
      end
    else
      flash.now[:alert] = "Please enter the company symbol"
      respond_to do |format|
        format.js { render partial: 'users/js_result'}
      end
    end
  end

end
