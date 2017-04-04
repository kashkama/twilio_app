class ContactsController < ApplicationController
  # before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
  end



  def new
    @user = current_user
    @contact =@user.contacts.new
    respond_to do |format|
      format.html{}
      format.js
    end
  end

  def edit
    @user = current_user
    @contact = Contact.find(params[:id])
  end

  def create
    @user = current_user
    @contact = @user.contacts.new(contact_params)
    @contact.user = @user
    if @contact.save
      redirect_to user_path(@contact.user)
      respond_to do |format|
        format.html {redirect_to user_path(@contact.user)}
        format.js
      end
    else
      flash[:notice] = "no contact saved"
    end
  end

  def update
    @user = current_user
    @contact = Contact.find(params[:id])
    if @user.contacts.update(contact_params)
      redirect_to user_path(@contact.user), notice: 'contact was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @user = current_user
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to user_path(@contact.user), notice: 'contact was successfully destroyed.'
  end


  private
    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
end
