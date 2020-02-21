class PostsController < ApplicationController
    before_action :required_sign_in, only: [:new, :create,:show]

    def index
        @posts = Post.all
        @current_user = @current_user if signed_in?
            
        
    end

    def new
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            @post.save
            redirect_to posts_path, flash: { success: 'Post created!' }
        else
            redirect_to new_post_path flash: { error: "#{@post.errors.full_messages_for(:title)}" }
        end
    end

    def post_params
		params.require(:posts).permit(:title, :body)
	end
end
