class VideogamesController < ApplicationController
  def index
    matching_videogames = Videogame.all

    @list_of_videogames = matching_videogames.order({ :created_at => :desc })

    render({ :template => "videogames/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_videogames = Videogame.where({ :id => the_id })

    @the_videogame = matching_videogames.at(0)

    render({ :template => "videogames/show.html.erb" })
  end

  def create
    the_videogame = Videogame.new
    the_videogame.publisher = params.fetch("query_publisher")
    the_videogame.published = params.fetch("query_published")
    the_videogame.game_photo = params.fetch("query_game_photo")
    the_videogame.recommendations_count = params.fetch("query_recommendations_count")

    if the_videogame.valid?
      the_videogame.save
      redirect_to("/videogames", { :notice => "Videogame created successfully." })
    else
      redirect_to("/videogames", { :notice => "Videogame failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_videogame = Videogame.where({ :id => the_id }).at(0)

    the_videogame.publisher = params.fetch("query_publisher")
    the_videogame.published = params.fetch("query_published")
    the_videogame.game_photo = params.fetch("query_game_photo")
    the_videogame.recommendations_count = params.fetch("query_recommendations_count")

    if the_videogame.valid?
      the_videogame.save
      redirect_to("/videogames/#{the_videogame.id}", { :notice => "Videogame updated successfully."} )
    else
      redirect_to("/videogames/#{the_videogame.id}", { :alert => "Videogame failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_videogame = Videogame.where({ :id => the_id }).at(0)

    the_videogame.destroy

    redirect_to("/videogames", { :notice => "Videogame deleted successfully."} )
  end
end
