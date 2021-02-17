class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to the show page
            redirect_to @user
        else 
            flash[:error] = "Please Try Again"
            render :new
        end
    end

    def show 
        if session[:user_id].nil? 
            redirect_to root_path
        else 
            @user = User.find_by(id: params[:id])
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end

end
