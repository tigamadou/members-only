class PostsController < ApplicationController
  before_action :required_sign_in, only: %i[new create show]

  def index
    @posts = Post.all
    @current_user = @current_user if signed_in?
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, flash: { success: 'Post created!' }
    else
      render('new')
    end
  end

  def post_params
    params.require(:posts).permit(:title, :body)
  end
end
