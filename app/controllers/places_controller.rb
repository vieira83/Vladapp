class PlacesController < ApplicationController
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
  def place_params
    params.require(:place,:name).permit(:name, :description, :address)
  end
end
