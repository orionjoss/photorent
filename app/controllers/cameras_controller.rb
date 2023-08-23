class CamerasController < ApplicationController
  def index
    @cameras = Camera.all
    @camera = Camera.new
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user

    if @camera.save
      redirect_to camera_path(@camera)

    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])
    if @camera.update(camera_params)
      redirect_to camera_path
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
    params.require(:camera).permit(:brand, :camera_type, :address, :user_id)
  end
end
