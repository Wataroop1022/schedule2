class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @post_count = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :day_start, :day_end, :all_day, :memo))
    if @post.save
      redirect_to posts_path, notice: "スケジュールを登録しました"
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(params.require(:post).permit(:title, :day_start, :day_end, :all_day, :memo))
    flash[:notice] = "編集が完了しました"
    redirect_to posts_path
  else
    flash[:alert] = "スケジュールを更新できませんでした"
    render "edit"
  end
end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

end
