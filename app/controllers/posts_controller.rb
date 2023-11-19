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
      flash[:notice] = "投稿を作成しました"
      redirect_to :posts_index
    else
      flash[:notice] = "投稿の作成に失敗しました"
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:memo))
      flash[:notice] = "投稿を編集しました"
      redirect_to :posts_index
    else
      flash[:notice] = "投稿の編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts_index
  end

end
