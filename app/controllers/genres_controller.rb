class GenresController < ApplicationController
  def index
    matching_genres = Genre.all

    @list_of_genres = matching_genres.order({ :created_at => :desc })

    render({ :template => "genres/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_genres = Genre.where({ :id => the_id })

    @the_genre = matching_genres.at(0)

    render({ :template => "genres/show.html.erb" })
  end

  def create
    the_genre = Genre.new
    the_genre.genre = params.fetch("query_genre")
    the_genre.game_id = params.fetch("query_game_id")

    if the_genre.valid?
      the_genre.save
      redirect_to("/genres", { :notice => "Genre created successfully." })
    else
      redirect_to("/genres", { :notice => "Genre failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_genre = Genre.where({ :id => the_id }).at(0)

    the_genre.genre = params.fetch("query_genre")
    the_genre.game_id = params.fetch("query_game_id")

    if the_genre.valid?
      the_genre.save
      redirect_to("/genres/#{the_genre.id}", { :notice => "Genre updated successfully."} )
    else
      redirect_to("/genres/#{the_genre.id}", { :alert => "Genre failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_genre = Genre.where({ :id => the_id }).at(0)

    the_genre.destroy

    redirect_to("/genres", { :notice => "Genre deleted successfully."} )
  end
end
