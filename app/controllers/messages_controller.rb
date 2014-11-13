class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    message_params = params.require(:message).permit(:user, :status, :likes)
    @message = Message.new(message_params)
    if @message.save
      redirect_to message_path(@message), notice: 'Status update successfully created.'
    else
      render new_message_path
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message_params = params.require(:message).permit(:user, :status, :likes)
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to message_path(@message), notice: 'Status update successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: 'Status update successfully deleted.'
  end

end
