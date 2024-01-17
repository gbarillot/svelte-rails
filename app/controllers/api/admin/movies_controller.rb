class Api::Admin::MoviesController < Api::Admin::AdminController
  # DELETE ME: Dummy emulation of a slow network so you can see the UI animation in dev. mode
  before_action :slow, only: [:create, :update] 
  before_action :load_movie, except: [:index, :new, :create]  

  def index
    @movies = Movie.ransack(search_params)
                   .result
                   .page(params[:page])
                   .per(params[:per_page])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.errors.empty?
      render template: '/api/admin/movies/edit'
    else
      render json: {errors: @movie.errors.messages}.to_json, status: 422      
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      head :ok
    else
      render json: {errors: @movie.errors.messages}.to_json, status: 422
    end
  end

  def destroy
    if @movie.destroy    
      head :ok
    else
      render json: {errors: @movie.errors.messages}.to_json, status: 422
    end
  end

  private

  def movie_params
    params.require(:movie).permit(
      :name,
      :description,
      :rating,
      :restricted,
      :released_at,
      :genre_id
    )
  end

  def load_movie
    @movie = Movie.find(params[:id])
  end

  def slow
    sleep 1
  end
end
