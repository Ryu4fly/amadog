class RoomsController < ApplicationController
  before_action :load_entities

  def show

    @rooms = policy_scope(Room)

    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
    @user = current_user
    authorize @room

  end

  def index
    @rooms = policy_scope(Room)
    @user = current_user
  end

  def new
    @room = Room.new

    @user = current_user
    authorize @room
  end

  def create
    @rooms = policy_scope(Room)


    @user = current_user
    @room = Room.new permitted_parameters
    authorize @room

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
      authorize @room

    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @rooms = policy_scope(Room)


    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end


  def room_params
    params.require(:room).permit(:user_id)
  end
end
