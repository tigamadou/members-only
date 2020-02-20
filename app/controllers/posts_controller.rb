class PostsController < ApplicationController
    before_action :required_sign_in, only: [:new, :create]

    def index
        @posts = Post.all
    end

    def new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            @post.save
            redirect_to posts_path, flash: { success: 'Post created!' }
        else
            redirect_to posts_new_path
        end
    end

    def post_params
		params.require(:posts).permit(:title, :body)
	end
end
