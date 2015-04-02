class MessagesController < ApplicationController
  before_filter :authenticate_admirer!, except: [:index, :show]

  def index
    @admirer = Admirer.find(params[:admirer_id])
    @messages = @admirer.messages.all
  end

  def new
    @admirer = Admirer.find(params[:admirer_id])
    @message = @admirer.messages.new
  end

  def create
    @admirer = Admirer.find(params[:admirer_id])
    @message = @admirer.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Your message was sent."
          redirect_to admirer_messages_path(@admirer)
        end
        format.js 
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Oops, something went wrong."
          render :new
        end
        format.js { render js: "alert('It did not send.');"}
      end
    end
  end

  def show
    @admirer = Admirer.find(params[:admirer_id])
    @message = Message.find(params[:id])
  end

  private

    def message_params
      params.require(:message).permit(:body, :to)
    end
end
