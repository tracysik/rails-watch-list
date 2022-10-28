class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

# #As a user, I can see all my movie lists
# As a user, I can create a movie list
# As a user, I can see the details of a movie list
# As a user, I can bookmark a movie inside a movie list
# # As a user, I can destroy a bookmark

# def create
#   @restaurant = Restaurant.new(restaurant_params)
#   @restaurant.save
#   # No need for app/views/restaurants/create.html.erb
#   redirect_to restaurant_path(@restaurant)
# end

# private

# def restaurant_params
#   params.require(:restaurant).permit(:name, :address, :rating)
# end
