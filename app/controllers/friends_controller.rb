class FriendsController < ApplicationController
  def index
    @admirer = Admirer.find(params[:admirer_id])
    @friends = @admirer.friends.all
  end

  def show
    @admirer = Admirer.find(params[:admirer_id])
    @friend = Friend.find(params[:id])
  end

  def new
    @admirer = Admirer.find(params[:admirer_id])
    @friend = @admirer.friends.new
  end

  def create
    @admirer = Admirer.find(params[:admirer_id])
    @friend = @admirer.friends.new(friend_params)
    if @friend.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Your friend was added."
          redirect_to admirer_friends_path(@admirer)
        end
        format.js { flash.now[:notice] = "Your friend was added." }
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert]
          render :new
        end
        format.js { flash.now[:alert] = render_to_string :partial => 'messages/errors' }
      end
    end
  end

  private
    def friend_params
      params.require(:friend).permit(:name, :phone)
    end
end
