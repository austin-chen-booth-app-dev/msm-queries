class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
    render({ :template => "actors_templates/index.html.erb"})
  end
  
  def actor_info
    @actor_id = params.fetch("actor_id")
    @actor = Actor.where({:id => @actor_id}).first
    @list_of_actor_characters = Character.where(:actor_id => @actor_id.to_i)
    render({ :template => "actors_templates/actor_info.html.erb"})
  end

end
