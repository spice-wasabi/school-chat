class UsersController < ApplicationController

  def new
  end
  def create
    @user = User.new
    if @user.save
      
    else
      render :new
    end
  end


  private

end
