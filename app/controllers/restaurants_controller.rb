class RestaurantsController < ApplicationController 
    def new
        @restaurant = Restaurant.new
    end

    def show
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = session[:user_id]

  
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else 
            flash[:error] = "Please Try Again"
            render :new
        end
    end

    def index
        if params[:category_id]
            category = Category.find(params[:id])
            @restaurants = category.restaurants
        end
    end

    def update 

    end



end