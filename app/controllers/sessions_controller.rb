class SessionsController < ApplicationController
    def new
        #render new log in here
    end
  
    def create
      # call user.show 
      # if user
      #  continue
      # else user.create
      puts params

      # "name"=>"a"
      user = User.find_by(name: params[:name])
      user_params = {name: params[:name]}
      if user == nil
        user = User.create(user_params)
        puts "===CREATING USER==="
      else
        puts "===USER EXISTS==="
      end

      #user = User.find_by(name: params.dig(:session, :name))
      if user 
        log_in user
        #redirect_back_or user
        redirect_to root_path
      else
        puts "===IDK=="
        render 'new'
      end
    end
  
    def destroy
      log_out
      redirect_to root_url
    end
end

private
    def user_params
        params.require(:user).permit(:name)
    end