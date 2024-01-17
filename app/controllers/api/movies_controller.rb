class Api::MoviesController < Api::ApiController
  def index
    @movies = Movie.all
  end

  def show    
    if params[:id] == "this-will-trigger-a-500"
      # Render a 500 to demonstrate how the front-end handles server side errors
      render json: {error: "Internal server error"}, status: 500
    elsif params[:id] == "this-will-trigger-a-401"
      # Render a 401 to demonstrate how the front-end handles server side errors
      render json: {error: "Not authenticated"}, status: 401
    else
      @movie = Movie.find(params[:id])
    end
  end
end
