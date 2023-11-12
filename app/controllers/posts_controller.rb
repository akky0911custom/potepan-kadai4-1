class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:memo))
    if @post.save
      redirect_to :posts_index
    else 
      redirect_to :new_post
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:memo))
      redirect_to :posts_index
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts_index
  end

end
