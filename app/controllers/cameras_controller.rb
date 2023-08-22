class CamerasController < ApplicationController
  def index
    @cameras = Camera.all
    @camera = Camera.new
  end

  def show;
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user

    if @camera.save
      redirect_to @cameras
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update;
    if @camera.update(camera_params)
      redirect_to @cameras
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy;
    @camera.destroy
    redirect_to @cameras, status: :see_other
  end

  private

  def camera_params
    params.require(:cameras).permit(:type, :brand, :user_id)
  end
end
