class LandingsController < ApplicationController
  def index
    @posts = Post.all
  end
end
