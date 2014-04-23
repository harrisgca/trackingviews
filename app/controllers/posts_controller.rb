class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    v = Postview.new(post_id: @post.id, guest_ip: request.remote_ip)
    v.save!
    @postViews = @post.postviews.count
    @postUniqueViews = @post.postviews.uniq_by { |i| i.guest_ip }.count
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:alert] = "Post submitted successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "Post deleted successfully!"
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
