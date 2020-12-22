class UsersController < ApplicationController

  def new
  end
  def create
    @user = User.new
  end
end
