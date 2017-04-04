class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = @user.messages.new
    respond_to do |format|
      format.html{}
      format.js
    end
  end

  def create
    @user = current_user
    @message =@user.messages.new(message_params)
    @message.user = @user
    if @message.save
      redirect_to user_path(@message.user)
      respond_to do |format|
        format.html {redirect_to user_path(@message.user)}
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to user_path(@message.user)
    flash[:notice] = "Successfully deleted"
  end

  private

    def message_params
      params.require(:message).permit(:from, :to, :body)
    end
end
