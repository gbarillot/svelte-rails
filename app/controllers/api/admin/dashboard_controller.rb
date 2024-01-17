class Api::Admin::DashboardController < Api::Admin::AdminController
  def index
    render json: {metrics: {movies: Movie.count}}
  end
end
