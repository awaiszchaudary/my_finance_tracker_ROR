class UserController < ApplicationController
  def portfolio

    @user_stocks = current_user.stocks

  end


end
