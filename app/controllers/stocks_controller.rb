class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      # debugger
      if @stock
        respond_to do |f|
          f.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = 'You have entered an incorrect symbol'
        render partial: 'users/result'
      end
    else
      flash[:danger] = 'You have entered an empty search string'
      render partial: 'users/result'
    end
  end
end