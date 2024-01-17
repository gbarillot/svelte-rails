class Api::Admin::ToolingController < Api::Admin::AdminController
  def index
    render json: {metrics: {movies: Movie.count}}
  end
end
