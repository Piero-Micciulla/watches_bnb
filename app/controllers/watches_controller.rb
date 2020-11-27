class WatchesController < ApplicationController
  before_action :find_watch, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @choice_of_watch = params[:query]

    @materials = Material.all
    @material_name = @materials.map do |material|
      material.name
    end

    @watches = Watch.all

    if @choice_of_watch.present?
      @watches = @watches.global_search(@choice_of_watch)
    end
    @watch_material = params[:material]

    if @watch_material.present?
      @watches = @watches.joins(:material).where(materials: {name: params[:material]})
    end

    @watch_price = params[:price]

    if @watch_price.present?
      @watches = @watches.where("price <= ?", params[:price])
    end

    @markers = @watches.geocoded.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { watch: watch }),
        image_url: helpers.asset_url('map_logo_2.jpg')
      }
    end
  end

  def show
    @marker = [{
      lat: @watch.user.address.latitude,
      lng: @watch.user.address.longitude,
      image_url: helpers.asset_url('map_logo_2.jpg')
    }]

  end

  def new
    @watch = Watch.new
    @disable_footer = true
    @materials = Material.all
  end

  def create
    @watch = Watch.new(strong_params)
    @watch.user = current_user
    @watch.user.address = current_user.address
    if @watch.save
      redirect_to dashboard_path(anchor: "profile")
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
      redirect_to dashboard_path(anchor: "profile")
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
    params.require(:watch).permit(:id, :description, :address, :price, :brand, :start_date, :end_date, :material_id, photos: [])
  end

  def find_watch
    @watch = Watch.find(params[:id])
  end
end
