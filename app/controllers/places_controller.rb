class PlacesController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create]
def index
	 @places = Place.all.paginate(page: params[:page], per_page: 6)
 end
 def new
 	@place = Place.new
  end
  def form
 	@place = Place.form
  end
  def create
    Place.create(place_params)
    redirect_to root_path
  end
  def show 
    @place = Place.find(params[:id])
  end
   def edit
    @place = Place.find(params[:id])
  end
   def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to root_path
  end
  def destroy
     @place = Place.find(params[:id])
     @place.destroy
     @place.destroy
  end
  private
  def place_params
    params.require(:place,:name).permit(:name, :description, :address)
  end
end
