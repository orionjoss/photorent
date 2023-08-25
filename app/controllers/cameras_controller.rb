class CamerasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @cameras = Camera.all
    if params[:query].present?
      @cameras = Camera.global_search(params[:query])
    end
    @cameras = Camera.geocoded
    @markers = @cameras.map do |camera|
      {
        lat: camera.latitude,
        lng: camera.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {camera: camera}),
        marker_html: render_to_string(partial: "marker")
      }
    end
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
    # @photo = Camera.photo.find(params[:id])

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

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to cameras_path, status: :see_other
  end

  private

  def camera_params
    params.require(:camera).permit(:brand, :camera_type, :address, :user_id, :photo)
  end
end
