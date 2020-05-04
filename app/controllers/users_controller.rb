class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

  def index
    @users=User.all
  end

  def create
    @user = User.new(user_params)
  end
  
  def show
    @user =User.find(params[:id])
    @posts = @user.posts

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def user_params
    params.require(:user).permit(:icon, :gender, :age, :area, :introduction, :hobby)
  end

end
