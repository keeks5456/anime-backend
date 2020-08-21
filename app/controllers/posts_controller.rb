class PostsController < ApplicationController
  
  def index 
    @posts = Post.all 
    options = {
      include: [:user, :comment]
    }
    render json: PostSerializer.new(@posts, options)
  end

  def show 
    @post = Post.find_by(params[:id])
    options = {
      include: [:user, :comment]
    }
    render json: PostSerializer.new(@post, options)
  end

  def new 
    @post = Post.new
  end

  def create 
    # byebug

    @post = Post.create(params.require(:post, {}).permit(:artwork, :description, :likes,  user_attributes: [:username]))
    options = {
      include: [:user, :comment]
    }

    render json: PostSerializer.new(@post, options)
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:likes))
    @post.save
    render json: @post
  end


  # end of class Post
end 
