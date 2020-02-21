class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user.authenticate(params[:session][:password])
            sign_in user
            #user.remember
            redirect_to posts_path flash[:success] = "Signed In!"
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
      
        session.delete(:user_id)
        @current_user = nil
        redirect_to posts_url flash[:success] = "Signed out!"
    end

end
