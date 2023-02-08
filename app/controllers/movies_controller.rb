class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all
    render({ :template => "movies_templates/index.html.erb"})
  end

  def movie_info
    @movie_id = params.fetch("movie_id")
    @movie = Movie.where({:id => @movie_id}).first
    render({ :template => "movies_templates/movie_info.html.erb"})
  end
  
end
