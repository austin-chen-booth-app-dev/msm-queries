Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  
  # Directors routes
  get("/directors", { :controller => "directors", :action => "index"})
  get("/directors/:director_id", { :controller => "directors", :action => "director_info"})

  # Movies routes
  get("/movies", { :controller => "movies", :action => "index"})
  get("/movies/:movie_id", { :controller => "movies", :action => "movie_info"})

  # Actors routes
  get("/actors", { :controller => "actors", :action => "index"})
  get("/actors/:actor_id", { :controller => "actors", :action => "actor_info"})
end
