class RecommendationsController < ApplicationController
  def index
    matching_recommendations = Recommendation.all

    @list_of_recommendations = matching_recommendations.order({ :created_at => :desc })

    render({ :template => "recommendations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recommendations = Recommendation.where({ :id => the_id })

    @the_recommendation = matching_recommendations.at(0)

    render({ :template => "recommendations/show.html.erb" })
  end

  def create
    the_recommendation = Recommendation.new
    the_recommendation.videogame_id = params.fetch("query_videogame_id")
    the_recommendation.body = params.fetch("query_body")
    the_recommendation.recipient_id = params.fetch("query_recipient_id")
    the_recommendation.sender_id = params.fetch("query_sender_id")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations", { :notice => "Recommendation created successfully." })
    else
      redirect_to("/recommendations", { :notice => "Recommendation failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.videogame_id = params.fetch("query_videogame_id")
    the_recommendation.body = params.fetch("query_body")
    the_recommendation.recipient_id = params.fetch("query_recipient_id")
    the_recommendation.sender_id = params.fetch("query_sender_id")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations/#{the_recommendation.id}", { :notice => "Recommendation updated successfully."} )
    else
      redirect_to("/recommendations/#{the_recommendation.id}", { :alert => "Recommendation failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.destroy

    redirect_to("/recommendations", { :notice => "Recommendation deleted successfully."} )
  end
end
