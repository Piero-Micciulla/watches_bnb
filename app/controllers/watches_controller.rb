class WatchesController < ApplicationController
  before_action :find_watch, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @watches = Watch.all

    @markers = @watches.geocoded.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude
      }
    end
  end

  def show
  end

  def new
    @watch = Watch.new
    @disable_footer = true
  end

  def create
    @watch = Watch.new(strong_params)
    if @watch.save
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  def edit
    @watch
  end

  def update
    @watch
    if @watch.update(strong_params)
      flash[:notice] = "Created"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @watch = Watch.destroy(strong_params)
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:watch).permit(:id, :description, :price, :photos, :brand)
  end

  def find_watch
    @watch = Watch.find(params[:id])
  end
end
