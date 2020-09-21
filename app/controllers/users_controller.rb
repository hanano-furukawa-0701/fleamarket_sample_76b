class UsersController < ApplicationController
  def index 
  end
  def show
    @Nickname = current_user.Nickname
  end
end
