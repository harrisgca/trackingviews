class PostviewsController < ApplicationController
  def new
    @view = Postview.new
  end

  def create
    @view = Postview.new(view_params)
    @view.post_id = Post.find(params[:id])
    @view.save!
  end

  private
  def view_params
    params.require(:view).permit(:guest_ip, :post_id)
  end
end