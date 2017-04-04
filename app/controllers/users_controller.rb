class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def new

  end

  def create
    #code
  end

  def show
    @user = current_user
    @contacts = @user.contacts
    @messages = @user.messages
  end
end
