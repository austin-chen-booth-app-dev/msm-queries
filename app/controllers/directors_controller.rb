class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "directors_templates/index.html.erb"})
  end
  
  def director_info
    @director_id = params.fetch("director_id")

    puts("did we get here?")

    if @director_id == "youngest" or @director_id == "eldest"
      sort_direction = {"youngest" => :desc, "eldest" => :asc}
      director = Director.where.not({ :dob => nil }).order({ :dob => sort_direction[@director_id] }).first
      @director_name = director.name
      @director_dob = director.dob.strftime("%B %e, %Y")
      @director_id_internal = director.id
      render({ :template => "directors_templates/director_type.html.erb"})
    else
      @list_of_director_movies = Movie.where({:director_id => @director_id.to_i})
      @director = Director.where({:id => @director_id.to_i}).first
      render({ :template => "directors_templates/director_info.html.erb"})
    end
  end
end
