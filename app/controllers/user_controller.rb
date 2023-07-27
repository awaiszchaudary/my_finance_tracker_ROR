class UserController < ApplicationController
  def portfolio

    @user_stocks = current_user.stocks

  end

  def friends
    @user_friends = current_user.friends
  end

  def destroy
    @friend = current_user.friends.find_by(id: params[:id])
    current_user.friends.delete(@friend)
    flash[:notice] = "Friend unfollowed successfully"
    redirect_to users_friends_path
  end

  def search

    if params[:friend].present?
      @friend = User.search(params[:friend])
      if @friend
        respond_to do |format|
          format.js {render partial: 'user/friend'}
        end
      else
        flash[:alert] = 'Please enter a valid friend name to search'
        respond_to do |format|
          format.js {render partial: 'user/friend'}
        end
      end
    else
      flash[:alert] = "Please enter a friend name to search"
      respond_to do |format|
        format.js {render partial: 'user/friend'}
      end
    end

  end

  def create
    @ffr = User.find_by(id: params[:id])
    @curr = current_user.friends.find_by(id: @ffr.id)
    if @curr == nil && @ffr != nil
      current_user.friends << @ffr
      flash[:notice] = "Action successful. You are following the friend."
      redirect_to users_friends_path
    else
      flash[:alert] = "Action failed"
      redirect_to users_friends_path      
    end
  end


end
