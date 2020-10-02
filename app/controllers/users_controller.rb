class UsersController < ApplicationController
before_action :access_restrictions

  def index 
  end
  def show
    @Nickname = current_user.Nickname
  end

  private

  def access_restrictions
    unless user_signed_in?
      flash[:alert] = 'ログインが必要です' 
      redirect_to new_user_session_path 
    end
  end
end
