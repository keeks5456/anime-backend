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
    user = User.find_or_create_by(username: params[:username])
    @post = Post.new(params.require(:post).permit(:artwork, :description, :likes))
    @post.user = user 
    @post.save
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

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
  end


  # end of class Post
end 
